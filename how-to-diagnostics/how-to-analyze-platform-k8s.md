# The Observability Guide to Platform Engineering - Part 1
This notebook was used in this [Observability Clinic](https://info.dynatrace.com/global-all-wc-observability-clinic-platform-engineering-22728-registration.html) and provides links, best practices and explanation for making your K8s-based IDP (Internal Development Platform) Observable with Dynatrace

**Got questions or feedback?**: [devrel@dynatrace.com](mailto:devrel@dynatrace.com?subject=Feedback%20on%20Platform%20Observability%20Tutorial)

**Target Audience**: Platform Engineers, Kubernetes Admins, SREs

![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_platform_k8s_referencearchitecture.png)

To learn more about Platform Engineering access my KCD Talk Resources on The Opportunity of Platform Engineering
* [(YouTube Video)Talk from KCD Munich](https://www.youtube.com/watch?v=5WDuVUFvELY)
* [(Slides)Talk from KCD Munich](https://www.slideshare.net/grabnerandi/kcd-munich-cloud-native-platform-dilemma-turning-it-into-an-opportunity)

To learn more about Kubernetes Monitoring with Dynatrace also see:
* [(Website) Kubernetes monitoring](https://www.dynatrace.com/technologies/kubernetes-monitoring/)
* [(Doc) Set up Dynatrace on Kubernetes](https://www.dynatrace.com/support/help/setup-and-configuration/setup-on-k8s)

---

# Step 1: Install Dynatrace Operator for K8s Observability & Security
The preferred way to get observability into your K8s cluster is by deploying the Dynatrace Operator. The operator gives you full Kubernetes observability including ingestion of Prometheus, OpenTelemetry, Logs and it will also cover K8s and Application Security.
If you don't want to install the Operator you can also leverage our ingest options for OpenTelemetry (Logs, Metrics and Traces). To learn more about this please see: [Ingesting OpenTelemetry Data with Dynatrace](https://www.dynatrace.com/support/help/extend-dynatrace/opentelemetry/getting-started)

For the operator its easiest to follow the following steps
1. Open the [Kubernetes App](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.kubernetes/ui/kubernetes)
2. Follow the Quick Start steps to [Connect automatically via Dynatrace Operator](https://www.dynatrace.com/support/help/setup-and-configuration/setup-on-k8s/quickstart)
3. Once the Dynatrace Operator is installed you will see your metrics, logs, events, traces, vulnerabilities ... in the Dynatrace Kubernetes screens. 

![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_platform_k8s_connect.png)

---

# Step 2: Optional Kubernetes settings
The default observability settings are a great start - but - there are some setting you may want to revisit as it allows you to tweak the level of observability as well as the level of anomaly detection.

## 1: To access the settings simply open the settings page through the Kubernetes Cluster screen:
![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_platform_k8s_accesssettings.png)

## 2: In the settings you can configure monitoring and anomaly detection for Kubernetes:
![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_platform_k8s_settings.png)

A couple of best practices:
1. Leverage the automatic Prometheus scraping as described in [Monitor Prometheus metrics](https://www.dynatrace.com/support/help/platform-modules/infrastructure-monitoring/container-platform-monitoring/kubernetes-monitoring/monitor-prometheus-metrics).
2. Enable Anomaly detection based on [Alert on common Kubernetes issues](https://www.dynatrace.com/support/help/platform-modules/infrastructure-monitoring/container-platform-monitoring/kubernetes-monitoring/alert-on-kubernetes-issues)

---

# Step 3: Validate core K8s Observability through default K8s Dashboards
Dynatrace automatically provides a set of additional Kubernetes dashboards that you can access from the Kubernetes App
![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_platform_k8s_accessdashboards.png)

---

# Next steps: More tutorials on K8s Observability & Platform Best Practices

Once we have basic observability for your K8s-based Platform we have additional use cases around Release Awareness & Release Observability, Ownership and DORA reporting:
* [How to enable Release Observability with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b457adab-eea1-43fb-bffe-450e4dbd4649)
* [How to define Ownership in Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=6f991064-9a32-454a-b837-2beb8012c0bb)
* [How to analyze DORA with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=7f5c269b-48bc-4346-8935-15ccca3bc5ea)

I also suggest that you look into setting up Synthetic Tests for each critical service and make yourself familiar with all diagnostics capabilities
* [How to Anlayze Infrastructure with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=28daf510-286f-4761-b681-659ab072a6f2)
* [How to Analyze Kubernetes Clusters and Workloads with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b1a22f8e-4e3e-4c5a-90b0-f072b53c5f91)
* [How to Analyze Synthetic Tests with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=8cb9e594-b3c6-482f-b560-4c127cc80688)
* [How to work with Davis-detected Problems](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=529dc6b6-db2d-4cdc-94fc-d4b5b9146a13)
* [How to do Application Security with Dynatrace](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=73c1c847-5e49-4bdf-9ece-365404fa2e28)
* [How to analyze logs relevant to me](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=ad531ecd-ad5d-4249-a095-df5bc8a0a97e)

## Feedback, Questions, Need more details?
To improve these tutorials please provide feedback by sending us an email: [devrel@dynatrace.com](mailto:devrel@dynatrace.com?subject=Feedback%20on%20Platform%20Observability%20Tutorial)