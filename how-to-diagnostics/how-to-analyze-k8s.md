# How to Analyze Kubernetes Clusters and Workloads with Dynatrace
This notebook provides links and explanation for a handful or use cases when analyzing Kubernetes Cluster and Workloads

**Target Audience**: Kubernetes Admins, SREs, Platform Engineers

---

## 1. Kubernetes Cluster and Workload Overview
**Problem Statement:** As a Kubernetes Admin I need to quickly know whether my clusters and workloads are running as expected and whether there are no vulnerabilities!

**How Dynatrace helps:** Dynatrace provides some out-of-the-box dashboards and views to get a quick overview of K8s Cluster and Workload Health as well as highlights any known vulnerabilities.

**Steps**:
1. Open the [Kubernetes App](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.kubernetes/ui/kubernetes)
2. Select a K8s Cluster with high-level overview ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_k8s_overview.png)
3. Get access to all events, vulnerabilities ... ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_k8s_overview_2.png)
4. Get access to classic cluster overview dashboards ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_k8s_classicdashboard.png)
4. Open the shared K8s dashboard ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_k8s_dashboard_new.png)

---

# 2: Access Logs, Traces and Metrics of a specific K8s Workload
**Problem Statement:** As a developer I want to quickly understand if my K8s workloads is running as expected and get access to logs, traces and metrics for that workload!

**How Dynatrace helps:** Dynatrace's Kubernetes Workload App provides a single view per Workload with easy access to analyze logs, metrics, traces and events for each workload

**Steps**
1. Open the [Kubernetes Workload App](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.kubernetes.workloads)
2. Find a specific workload ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_k8sworkload_findworkload.png)
2. Understand workload health based on metrics ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_k8sworkload_workloadmetrics.png)
3. Analyze problematic logs ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_k8sworkload_logsevents.png)
4. Analyze service SRE metrics ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_k8sworkload_findservice.png)
5. Analyze service traces and dependencies ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_k8sworkload_svcdetails.png)
