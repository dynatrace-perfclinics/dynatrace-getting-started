# How to make your K8s-based Internal Development Platform Observable - Part 1
This notebook provides links and explanation for making your K8s-based Platform Observable. Its a tutorial used in the Observability Clinic called **The Observability Guide to Platform Engineering - Part 1**

**Got questions?**: [devrel@dynatrace.com](mailto:devrel@dynatrace.com?subject=Feedback%20on%20Platform%20Observability%20Tutorial)

**Target Audience**: Platform Engineers, Kubernetes Admins, SREs

To learn more about Platform Engineering access my KCD Talk Resources on The Opportunity of Platform Engineerig
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

# Step 3: Explore Default K8s Dashboards
Dynatrace automatically provides a set of additional Kubernetes dashboards that you can access from the Kubernetes App
![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_platform_k8s_accessdashboards.png)

---

# Step 4: More tutorials on K8s Observability

To learn more about how to explore logs, metrics, traces, events, security ... check out the Tutorial Notebook [How to analyze your K8s cluster](https://wkf10640.apps.dynatrace.com/ui/document/v0/#share=b1a22f8e-4e3e-4c5a-90b0-f072b53c5f91)