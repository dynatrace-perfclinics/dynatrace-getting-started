# What is Dynatrace and How to get started
This repository contains supporting material for the episode *What is Dynatrace and How to get started!*
* [Register for the Live Webinar](https://info.dynatrace.com/global-all-wc-observability-clinic-how-to-get-started-with-dynatrace-22392-registration.html)
* [Watch it on YouTube (once available!](https://bit.ly/dtoneagenttutorials)

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

And some **read only Dynatrace Notebooks** to play around with (more to come):
* [(Live Notebook) Getting Started Notebook](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=bc440f34-626b-4303-b591-923d722d5600)
* [(Live Notebook)Sample Log Notebook](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=f90a132b-36fd-4735-9d75-66e5a84a7ea2)

I also added some **Hands-On Tutorial Notebooks** with Step-by-Step instructions:
* [(Live Tutorial Notebook) How to do Distributed Trace and Database Diagnostics](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=fc1ff600-6819-4aee-b771-0f3219c4532c)
* [(Live Tutorial Notebook) How to Anlayze Infrastructure with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=28daf510-286f-4761-b681-659ab072a6f2)
* [(Live Tutorial Notebook) How to Analyze Kubernetes Clusters and Workloads with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b1a22f8e-4e3e-4c5a-90b0-f072b53c5f91)


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

If you **dont have access** to the Discover Dynatrace Tenant then **check them out in these readme's**:
* [(Readme) How to do Distributed Trace and Database Diagnostics](./how-to-diagnostics/how-to-distributed-trace-database.md)
* [(Readme) How to Anlayze Infrastructure with Dynatrace](./how-to-diagnostics/how-to-analyze-infrastructure.md)
* [(Readme) How to Analyze Kubernetes Clusters and Workloads with Dynatrace](./how-to-diagnostics/how-to-analyze-k8s.md)

## Step 5: Integrate and Automate based on your data

Start by building workflows to connect Dynatrace with your tool ecosystem.

The Playground Tenant has some Workflows setup to showcase automated release validation with the Site Reliability Guardian

In your own tenant feel free to explore all the capabilities of Dynatrace Workflows.
To learn more about Workflows check out:
* [Dynatrace Workflows Tutorial Video](https://www.youtube.com/watch?v=W3dt8LFsEdQ)
* [Dynatrace Workflows Quickstart Documentation](https://www.dynatrace.com/support/help/platform-modules/cloud-automation/workflows/quickstart)

## Step 6: Extend Dynatrace with an Extension or App

Learn more about building your own Dynatrace App based on AppEngine on the [Dynatrace Developer Portal](https://developer.dynatrace.com)

# Learn more ...

To learn more go to:
* [Dynatrace Observability Clinics](https://bit.ly/oneagenttutorials)
* [Dynatrace How To's](https://bit.ly/dthowto)
* [Dynatrace Tips & Tricks](https://bit.ly/dttipstricks)
* [Dynatrace University](https://university.dynatrace.com)
* [Dynatrace Community](https://community.dynatrace.com)
