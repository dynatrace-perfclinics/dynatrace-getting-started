# How to enable Release Observability with Dynatrace
This notebook provides best practices on using Dynatrace to provide release version and ownership visibility!

**Got questions or feedback?**: [devrel@dynatrace.com](mailto:devrel@dynatrace.com?subject=Feedback%20on%20Release%20Validation)

**Target Audience**: DevSecOps, Platform Engineers, SREs

**Documentation on Release Management**
* [Version detection strategies](https://www.dynatrace.com/support/help/platform-modules/cloud-automation/release-monitoring/version-detection-strategies)
* [Ownership](https://www.dynatrace.com/support/help/manage/ownership)

---

# Step 1: Adding Release Version Meta Data to your Deployments
Dynatrace uses built-in version detection strategies to support different technology standards for versioning. 
The latest version detected can be influenced by environment variables, Kubernetes labels or by sending a deployment event.

## Option 1: Providing Release Information as Environment Variables
For any process you can pass version relevant information as environment variables. This works for both Windows and Linux. For examples in the [doc](https://www.dynatrace.com/support/help/platform-modules/cloud-automation/release-monitoring/version-detection-strategies#environment-variables)

```
set DT_RELEASE_VERSION=2.23
set DT_RELEASE_BUILD_VERSION=2023-09-13
set DT_RELEASE_PRODUCT=hipstershop
set DT_RELEASE_STAGE=production
```

## Option 2: Providing it as K8s Labels
On K8s Dynatrace can also extract this information from K8s labels as shown below. Additionally it is recommended to pass release version information as an enviornment-variable to the container. This allows Dynatrace to enrich captured distributed traces with version information on each trace!

More information in the [doc](https://www.dynatrace.com/support/help/platform-modules/cloud-automation/release-monitoring/version-detection-strategies#kubernetes).

```
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: production
  name: adservice
spec:
  template:
    metadata:
      labels:
        app.kubernetes.io/name: adservice
        app.kubernetes.io/version: 2.23          // will be identified as version
        app.kubernetes.io/part-of: hipstershop   // will be identified as product
        dt.owner: team-ninja                     // will be identified as owner

  ...
  
    spec:
      containers:
      - name: adservice
        image: adservice:2.23
        env:
        - name: DT_RELEASE_VERSION               // propagates version information on distributed trace
          valueFrom:
            fieldRef:
              fieldPath: metadata.labels['app.kubernetes.io/version'] 
  
```

## Option 3: Sending Deployment Events
Dynatrace also extracts version information through CUSTOM_DEPLOYMENT events that are sent to a Dynatrace Monitored entity. The mandatory field there is `dt.event.deployment.version`
Typically those events are sent by the CI/CD pipeline tools (Jenkins, GitLab, GitHub, ...) after a new version was deployed!
More details on the [doc](https://www.dynatrace.com/support/help/platform-modules/cloud-automation/release-monitoring/version-detection-strategies#events-ingestion)

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

---

# Step 2: Release Inventory: Overview of all release versions
The [Release inventory](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.releases/ui/releases?gtf=-2h&gf=all&invsc=releaseName&invsd=asc) gives you an overview of all deployed releases on the observed environment. There is also a [Release inventory (demo mode)](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.releases/ui/releases?gtf=-2h&gf=all&invsc=releaseName&invsd=asc&demo=true) available that shows you how this screen looks like in case you have enriched your deployments with release information.

![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_releaseobservability_releaseinventory.png)

---

# Step 3: Query Release Information from Smartscape via DQL
Its also possible to query release information directly via DQL from Smartscape entities
The following example shows getting a list of `process_group_instance` and the `app.kubernetes.io/version` tag

```
fetch dt.entity.process_group_instance
| expand tags
| parse tags, "ld:key ':' ld:tag_value"
| filter contains(key, "app.kubernetes.io/version")
| fields entity.name, tag_value 
```