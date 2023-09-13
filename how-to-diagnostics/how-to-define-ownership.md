# How to define Ownership with Dynatrace
This notebook provides best practices on defining ownership for monitored entities (hosts, processes, workloads, services ...). This feature allows you to not only see who owns a component but also allows targeted notifications as part of Workflows, e.g: send the right team a message in their slack channel when a problem comes up

**Got questions or feedback?**: [devrel@dynatrace.com](mailto:devrel@dynatrace.com?subject=Feedback%20on%20Ownership)

**Target Audience**: DevSecOps, Platform Engineers, SREs

**Documentation and Videos**
* [(Doc) Ownership](https://www.dynatrace.com/support/help/manage/ownership)
* [(Video Tutorial)Ownership driven observability](https://www.youtube.com/watch?v=YSE5WvKHxWs)

![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_ownership_overview.png)

---

# Step 2: Assigning Ownership of entities to team
As we have created teams with a team identifier we can now assign those teams as owners to entities.
To learn more check out [How to assign owners to entities](https://www.dynatrace.com/support/help/manage/ownership/assign-ownership) and [Best practices on ownership assignment](https://www.dynatrace.com/support/help/manage/ownership/best-practices)

In this tutorial we cover the core use cases

## Option 1: Through Kubernetes Labels
For Kubernetes deployments this is the best practice approach by defining the `dt.owner` label on deployments, namespaces, cronjobs, stateful or daemon sets.

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo
  labels:
    dt.owner: my-team
spec:
```

You can also assign multiple teams as different teams may have different responsibilities:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo
  labels:
    dt.owner-1: my-team-1 # Dual team ownership defined for the Deployment
    dt.owner-2: my-team-2
spec:
```

## Option 2: Through Environment Variables
As ownership is managed through Tags we can also specify the owner information as an environment variable. Here we can either use `DT_TAGS` or `DT_CUSTOM_PROPS` in combination with an auto-tagging rule.

## Option 3: Manually via Dynatrace UI
You can also assign teams to an entity on the entity screen in the owners section. Essentially this screen will create a tag called `owner` with the team identifier as its value:

![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_ownership_addmanually.png)

---

# Step 2: Use Ownership Information as part of a Workflow
When installing the [Ownership App](https://www.dynatrace.com/support/help/manage/ownership/ownership-app) your workflows can extract ownership information which can be used for targeted workflows, e.g: sending messages to the team slack channel that is specified in the team configuration.

For more examples please watch [Ownership driven observability](https://www.youtube.com/watch?v=YSE5WvKHxWs) and read up on [Ownership App](https://www.dynatrace.com/support/help/manage/ownership/ownership-app)

---

# Step 3: Query Ownership Information
Just as with everything in Dynatrace we can also query entities based on Ownership information. 

Here is an example DQL to query all kubernetes workloads (cloud_application) that are owned by team ninja

```
fetch dt.entity.cloud_application
| filter (isNotNull(tags) and indexOf(toString(tags),"owner:ninja")>=0) 
| fieldsAdd tags
```