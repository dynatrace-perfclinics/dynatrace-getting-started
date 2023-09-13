# How to do DORA Analysis with Dynatrace
This notebook provides best practices on using Dynatrace to monitor some of the DORA metrics.

**Got questions or feedback?**: [devrel@dynatrace.com](mailto:devrel@dynatrace.com?subject=Feedback%20on%20DORA)

**Target Audience**: DevSecOps, Platform Engineers, SREs

**What are DORA metrics and their performance levels?**
https://cloud.google.com/blog/products/devops-sre/using-the-four-keys-to-measure-your-devops-performance

![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_dora_overview.png)

---

# Step 1: Sending Deployment Events to Dynatrace
To make Dynatrace aware of deployments the best practice is to send a CUSTOM_DEPLOYMENT event or a BizEvent to Dynatrace from your CI/CD pipeline, e.g: Jenkins, GitHub, GitLab, Azure DevOps, ArgoCD ...

## Option 1: Sending a CUSTOM_DEPLOYMENT Event
The documentation on [Version detection strategies](https://www.dynatrace.com/support/help/platform-modules/cloud-automation/release-monitoring/version-detection-strategies#events-ingestion) includes an example on how to send a CUSTOM_DEPLOYMENT Event to Dynatrace using the Events API v2.

```
{
  "eventType": "CUSTOM_DEPLOYMENT",
  "title": "Easytravel 1.1",
  "entitySelector": "type(PROCESS_GROUP_INSTANCE),tag(easytravel)",
  "properties": {
    "dt.event.deployment.name":"Easytravel 1.1",
    "dt.event.deployment.version": "1.1",
    "dt.event.deployment.release_stage": "production" ,
    "dt.event.deployment.release_product": "frontend",
    "dt.event.deployment.release_build_version": "123",
    "approver": "Jason Miller",
    "dt.event.deployment.ci_back_link": "https://pipelines/easytravel/123",
    "gitcommit": "e5a6baac7eb",
    "change-request": "CR-42",
    "dt.event.deployment.remediation_action_link": "https://url.com",
    "dt.event.is_rootcause_relevant": true
  }
}
```

## Option 2: Sending a BizEvent
Another option is to send a BizEvent as shown in **CI/CD Pipeline Triggers SRG** workflow on the Dynatrace Playground Tenant. This one leverages the BizEvent Ingest API to send an event about a deployment.

```
// default function that will be run for the task
export default async function () {
  // derive vesion from date
  const now = new Date();
  let hour = now.getHours();
  var start = new Date(now.getFullYear(), 0, 0);
  var diff = now - start;
  var oneDay = 1000 * 60 * 60 * 24;
  var day = Math.floor(diff / oneDay);
  var buildId = 4711 + day + hour;

  
  // event that triggers validation
  const event = { 
    "timeframe.from": "now-32m",
    "timeframe.to": "now-2m",   
    execution_context: {
        buildId: ""+ buildId,
        version: "0." + day + "." + hour,
        id: crypto.randomUUID().toString()
    }, 
    "tag.service": "carts",
	"tag.application": "sockshop",
	"tag.stage": "production",
    "event.id": crypto.randomUUID().toString(),
    "event.provider": "Jenkins",
    "event.type": "DEPLOYMENT"    
  };

  console.log("Ingesting event: ", event);

  const ingestResponse = await fetch('/platform/classic/environment-api/v2/bizevents/ingest', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(event),
  }); 

  console.log("Event ingested", ingestResponse.status, await ingestResponse.text());

  return event["execution_context"]
}
```

---

# Step 2: Analyze Events to measure Deployment Frequency
The following tiles use DQL to query the number of deployment events sent to Dynatrace. The power of DQL allows us to filter or split by environment, service and make calculations to get the value that you need, e.g: Deployments per Hour

```
fetch events
| filter event.kind == "DAVIS_EVENT"
| filter event.type == "CUSTOM_DEPLOYMENT"
| summarize count()
```

```
fetch events
| filter event.kind == "DAVIS_EVENT"
| filter event.type == "CUSTOM_DEPLOYMENT"
| summarize count(), by:{timestamp, 1d}
```

# Step 3: Validate Release with Site Reliability Guardian (SRG)
The [Site Reliability Guardian (SRG)](https://guu84124.apps.dynatrace.com/ui/apps/dynatrace.site.reliability.guardian/) allows you to automatically validate a release against a set of objectives. Ideally the SRG is triggered through a Workflow to automatically validate the Guardian definition for every new deployment as shown in the Dynatrace Playground Tenant Workflow **Carts Reliability Validation**

The guardian itself will create two BizEvents (event.provider="dynatrace.site.reliability.guardian"):
* event.type="guardian.validation.started"
* event.type="guardian.validation.finished"

To fetch all finished events for instance you can use this
```
fetch bizevents
| filter event.provider == "dynatrace.site.reliability.guardian"
| filter event.type == "guardian.validation.finished"
```

This can be used to get an overview of failed vs successful releases as you can see in the following chart

---

# Step 4: Analyze Release Quality based on Site Reliability Guardian (SRG) Results
With the triggering of the Site Reliability Guardian we can now analyze the releases by its evaluation status as you can see in the chart below. With the power of DQL you can calculate your Deployment Failure Rate metrics to match your definition of success, e.g: warning and pass could be considered pass - or - you can even factor in additional data from other tools such as pulling in data from your Code Coverage or Functional Test Results. This could be done by executing JavaScript to pull in that data from external sources.

```
fetch bizevents
| filter event.provider == "dynatrace.site.reliability.guardian"
| filter event.type == "guardian.validation.finished"
| summarize count(), by:{validation.status}
```

---

# Step 5: Measure Time to Restore Service upon an error
Dynatrace Davis automatically detects problems in case errors happen. Those problems are stored in Grail with all context about Problem Impact, Start & Endtime, root cause components and more 

DQL can now be used to query DORA metrics around *Time to Restore Service* as you can see from some of the query examples below!

**Explanation of Elite, High, Medium & Low Performance Level**
These are queries that highlight how many problems have been solved very fast, medium fast or where it took long to fix them. This is a great way to categorize your problem resolution time and gives you an indication of maturity!

```
fetch events
| filter event.kind == "DAVIS_PROBLEM"
| summarize minutes_to_resolve=avg(toDouble(resolved_problem_duration)/60000), by:{bin(timestamp, 1m)}
```

```
fetch events
| filter event.kind == "DAVIS_PROBLEM"
| filter (toDouble(resolved_problem_duration)/60000) < 60
| summarize count()
```


```
fetch events
| filter event.kind == "DAVIS_PROBLEM"
| filter (toDouble(resolved_problem_duration)/60000) > 60 and (toDouble(resolved_problem_duration)/60000) < 1440 
| summarize count()
```

```
fetch events
| filter event.kind == "DAVIS_PROBLEM"
| filter (toDouble(resolved_problem_duration)/60000) > 1400
| summarize count()
```

---

# Next Steps: Dynatrace is working on more out-of-the-box capabilities
While you can extract all the DORA metrics yourself by querying the events through DQL Dynatrace is working on more out-of-the-box solutions to provide you DORA, SPACE and other DevOps, SRE & Platform Engineering Maturity Metrics.

If you are interested let us know by sending us a quick note: [devrel@dynatrace.com](mailto:devrel@dynatrace.com?subect=Better%20DORA%20Monitoring)

![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_dora_doradashboard.png)