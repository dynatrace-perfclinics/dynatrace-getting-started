# What is Dynatrace and How to get started
This repository contains supporting material for the episode *What is Dynatrace and How to get started!*

[![Watch it on YouTube](https://img.youtube.com/vi/rw8u3oZ4RdY/0.jpg)](https://www.youtube.com/watch?v=rw8u3oZ4RdY)

[>> More tutorials on YouTube](https://bit.ly/dtsaastrial)

**Table of Contents:**
* [Step 1: Get your own Dynatrace Trial](#step-1-get-your-own-dynatrace-trial)
* [Step 2: Discover Dynatrace Playground Tenant](#step-2-discover-dynatrace-playground-tenant)
* [Step 3: Ingest Data into your own Tenant](#step-3-ingest-data-into-your-own-tenant)
* [Step 4: Analyze your Data](#step-4-analyze-your-data)
* [Step 5: Integrate and Automate based on your data](#step-5-integrate-and-automate-based-on-your-data)
* [Step 6: Extend Dynatrace with an Extension or App](#step-6-extend-dynatrace-with-an-extension-or-app)

If you have questions or feedback:
* Create an issue on this GitHub Repository if you found an issue with the tutorial:
* Ask the Dynatrace community on https://community.dynatrace.com
* For everything else: [devrel@dynatrace.com](mailto:devrel@dynatrace.com)


## Step 1: Get your own Dynatrace Trial

Sign up for a new Dynatrace trial: https://bit.ly/dtsaastrial

## Step 2: Discover Dynatrace Playground Tenant

Every Dynatrace Trial user has access to a special [Discover Dynatrace (Playground) Tenant](https://wkf10640.apps.dynatrace.com/) that allows you to explore Dynatrace and all our use cases and capabilities.
The Playground tenant is observing several applications running on k8s clusters. 

Some shared **read-only Dynatraced Dashboards** I've uploaded for you:
* [(Live Dashboard) Getting Started Dashboard](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=eaa07354-fcf8-4723-8c26-8ca2b0f120a4)
* [(Live Dashboard) K8s Cluster Overview](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=906052ed-d03c-4a33-a302-6f7e55f5e4bd)
* [(Live Dashboard) K8s Namespace Overview](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=19014900-50c3-4239-9ffa-3888cef882b4)
* [(Live Dashboard) EasyTrade Dashboard](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=d2ae8659-2b0a-4b10-9546-5114b2fbf3a6)
* [(Live Dashboard) How to get Ownership Overview](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=19de7d7b-477e-4134-ba2a-3d1ee776096b)

And some **read only Dynatrace Notebooks** to play around with (more to come):
* [(Live Notebook) Getting Started Notebook](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=bc440f34-626b-4303-b591-923d722d5600)
* [(Live Notebook)Sample Log Notebook](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=f90a132b-36fd-4735-9d75-66e5a84a7ea2)

I also added some **Hands-On Tutorial Notebooks** with Step-by-Step instructions:
* [(Live Tutorial Notebook) How to do Distributed Trace and Database Diagnostics](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=fc1ff600-6819-4aee-b771-0f3219c4532c)
* [(Live Tutorial Notebook) How to Anlayze Infrastructure with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=28daf510-286f-4761-b681-659ab072a6f2)
* [(Live Tutorial Notebook) How to Analyze Kubernetes Clusters and Workloads with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b1a22f8e-4e3e-4c5a-90b0-f072b53c5f91)
* [(Live Tutorial Notebook) How to Analyze Synthetic Tests with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=8cb9e594-b3c6-482f-b560-4c127cc80688)
* [(Live Tutorial Notebook) How to work with Davis-detected Problems](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=529dc6b6-db2d-4cdc-94fc-d4b5b9146a13)
* [(Live Tutorial Notebook) How to do Application Security with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=73c1c847-5e49-4bdf-9ece-365404fa2e28)
* [(Live Tutorial Notebook) How to analyze logs relevant to me](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=ad531ecd-ad5d-4249-a095-df5bc8a0a97e)
* [(Live Tutorial Notebook) How to make your K8s Platform Observable](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b82b694c-e137-4654-ac43-36ba212efa62)
* [(Live Tutorial Notebook) How to analyze DORA Metrics with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=7f5c269b-48bc-4346-8935-15ccca3bc5ea)
* [(Live Tutorial Notebook) How to enable Release Observability with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b457adab-eea1-43fb-bffe-450e4dbd4649)
* [(Live Tutorial Notebook) How to define Ownership in Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=6f991064-9a32-454a-b837-2beb8012c0bb)


Also make sure to explore the following **Dynatrace Apps** and Use Cases:
* [(App) Davis Detected Problems](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.problems/ui/problems?gtf=-24h+to+now) explore the power of automated root cause detection
* Kubernetes [(App) Clusters](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.kubernetes/ui/kubernetes/KUBERNETES_CLUSTER-279D12C72068548C) & [(App) Workloads](s://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.kubernetes.workloads/ui/entity/list/CLOUD_APPLICATION)
* Understand your [(App) SLOs (Service Level Objectives)](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.slo/ui/slo)
* [(App) A service](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.kubernetes.workloads/ui/entity/CLOUD_APPLICATION-CA2305D4EC324955) running in a K8s workload 
* [(App) Application Security Overview](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.security.overview/ui/security/overview), [(App) Vulnerabilities](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.vulnerabilities/ui/security/vulnerabilities) and [(App) Attacks](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.attacks/ui/security/attacks)
* Diagnose and analyze [(App) distributed traces](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.distributed.traces/ui/diagnostictools/purepaths)
* Explore your [(App) logs in a Notebook](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=f90a132b-36fd-4735-9d75-66e5a84a7ea2)
* Understand [(App) Real End Users Performance](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.frontend/#uemapplications/uemappmetrics;gtf=-24h%20to%20now;gf=all;uemapplicationId=APPLICATION-A97880B9A9D5EAE6) and analyze indvidual users through [(App) Session Replay](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.session.segmentation/ui/user-sessions)
* Monitor your SLAs and functionality through [(App) Dynatrace Synthetics](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.synthetic/)
* Build custom [(App) Dashboards](https://wkf10640.apps.dynatrace.com/ui/openApp/dynatrace.dashboards/), [(App) Notebooks](https://wkf10640.apps.dynatrace.com/ui/openApp/dynatrace.notebooks/) to analyze your logs, metrics, events, traces ...
* Automate and Integrate through Data & Event Driven [(App) Dynatrace Workflows](https://wkf10640.apps.dynatrace.com/ui/openApp/dynatrace.automations/)
* ... and more

## Step 3: Ingest data into your own Tenant

In your own tenant simply follow the steps to data into Dynatrace. The most popular options are
* Deploy the [Dynatrace OneAgent](https://www.dynatrace.com/support/help/setup-and-configuration/dynatrace-oneagent) on VMs, [Kubernetes](https://www.dynatrace.com/support/help/setup-and-configuration/setup-on-k8s), OpenShift or CloudFoundry
* Ingest [OpenTelemetry](https://www.dynatrace.com/support/help/extend-dynatrace/opentelemetry), Prometheus(https://www.dynatrace.com/support/help/extend-dynatrace/extend-metrics/ingestion-methods/prometheus) or [external logs](https://www.dynatrace.com/support/help/extend-dynatrace/extend-logs)
* Monitor your [Cloud Platforms](https://www.dynatrace.com/support/help/setup-and-configuration/setup-on-cloud-platforms) such as AWS, Google Cloud Platform, Azure or Heroku
* Enable 600+ extensions such as SNMP, WMI, JMX, SQL and many more through the [Dynatrace Hub](https://www.dynatrace.com/hub/)

## Step 4: Analyze your data

Like we did on the Playground Tenant - start exploring your data by opening the respective Dynatrace App for your Use Case.

You can also follow my **Hands-On Tutorial Notebooks** on the **Discover Dynatrace Tenant**:
* [(Live Tutorial Notebooks) How to do Distributed Trace and Database Diagnostics](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=fc1ff600-6819-4aee-b771-0f3219c4532c)
* [(Live Tutorial Notebooks) How to Anlayze Infrastructure with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=28daf510-286f-4761-b681-659ab072a6f2)
* [(Live Tutorial Notebooks) How to Analyze Kubernetes Clusters and Workloads with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b1a22f8e-4e3e-4c5a-90b0-f072b53c5f91)
* [(Live Tutorial Notebook) How to Analyze Synthetic Tests with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=8cb9e594-b3c6-482f-b560-4c127cc80688)
* [(Live Tutorial Notebook) How to work with Davis-detected Problems](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=529dc6b6-db2d-4cdc-94fc-d4b5b9146a13)
* [(Live Tutorial Notebook) How to do Application Security with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=73c1c847-5e49-4bdf-9ece-365404fa2e28)
* [(Live Tutorial Notebook) How to analyze logs relevant to me](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=ad531ecd-ad5d-4249-a095-df5bc8a0a97e)
* [(Live Tutorial Notebook) How to make your K8s Platform Observable](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b82b694c-e137-4654-ac43-36ba212efa62)
* [(Live Tutorial Notebook) How to analyze DORA Metrics with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=7f5c269b-48bc-4346-8935-15ccca3bc5ea)
* [(Live Tutorial Notebook) How to enable Release Observability with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b457adab-eea1-43fb-bffe-450e4dbd4649)
* [(Live Tutorial Notebook) How to define Ownership in Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=6f991064-9a32-454a-b837-2beb8012c0bb)



If you **dont have access** to the Discover Dynatrace Tenant then **check them out in these readme's**:
* [(Readme) How to do Distributed Trace and Database Diagnostics](./how-to-diagnostics/how-to-distributed-trace-database.md)
* [(Readme) How to Anlayze Infrastructure with Dynatrace](./how-to-diagnostics/how-to-analyze-infrastructure.md)
* [(Readme) How to Analyze Kubernetes Clusters and Workloads with Dynatrace](./how-to-diagnostics/how-to-analyze-k8s.md)
* [(Readme) How to Analyze Synthethic Tests with Dynatrace](./how-to-diagnostics/how-to-analyze-synthetic.md)
* [(Readme) How to work with Davis-detected Problems](./how-to-diagnostics/how-to-analyze-problems.md)
* [(Readme) How to do Application Security with Dynatrace](./how-to-diagnostics/how-to-analyze-appsec.md)
* [(Readme) How to Analyze Logs relevant for me](./how-to-diagnostics/how-to-analyze-logs-relevant-forme.md)
* [(Readme) How to make your K8s Platform Observable](./how-to-diagnostics/how-to-analyze-platform-k8s.md)
* [(Readme) How to analyze DORA with Dynatrace](./how-to-diagnostics/how-to-analyze-dora.md)
* [(Readme) How to enable Release Observability with Dynatrace](./how-to-diagnostics/how-to-release-observability.md)
* [(Readme) How to define Ownership in Dynatrace](./how-to-diagnostics/how-to-define-ownership.md)


## Step 5: Integrate and Automate based on your data

Start by building workflows to connect Dynatrace with your tool ecosystem.

The Playground Tenant has [some Workflows](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.automations/workflows) setup to showcase automated release validation with the [(App) Site Reliability Guardian](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.site.reliability.guardian/)

In your own tenant feel free to explore all the capabilities of Dynatrace Workflows.
To learn more about Workflows check out:
* [Dynatrace Workflows Tutorial Video](https://www.youtube.com/watch?v=W3dt8LFsEdQ)
* [Dynatrace Workflows Quickstart Documentation](https://www.dynatrace.com/support/help/platform-modules/cloud-automation/workflows/quickstart)

## Step 6: Extend Dynatrace with an Extension or App

Learn more about building your own Dynatrace App based on AppEngine on the [Dynatrace Developer Portal](https://developer.dynatrace.com)

Also explore the [(App) Dynatrace Hub](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.hub/) with apps that are already available

# Learn more ...

To learn more go to:
* [Dynatrace Observability Clinics](https://bit.ly/oneagenttutorials)
* [Dynatrace How To's](https://bit.ly/dthowto)
* [Dynatrace Tips & Tricks](https://bit.ly/dttipstricks)
* [Dynatrace University](https://university.dynatrace.com)
* [Dynatrace Community](https://community.dynatrace.com)
