# How to Analyze Synthetic Tests with Dynatrace
This notebook provides links and explanation for a handful or use cases when setting up and analyzing Synthetic Tests

**Target Audience**: SREs, App Owners, Developers

To learn more about Synthetic Monitoring with Dynatrace also see:
* [(Website) Synthetic monitoring](https://www.dynatrace.com/platform/synthetic-monitoring/)
* [(Doc) Synthetic Monitoring](https://www.dynatrace.com/support/help/platform-modules/digital-experience/synthetic-monitoring)

---

## 1. Analyze Synthetic Monitor Executions and Identify Root Causes of Failures
**Problem Statement:** As a Kubernetes Admin I need to quickly know whether my clusters and workloads are running as expected and whether there are no vulnerabilities!

**How Dynatrace helps:** Dynatrace provides some out-of-the-box dashboards and views to get a quick overview of K8s Cluster and Workload Health as well as highlights any known vulnerabilities.

**Steps**:
1. Open the [Synthetic App](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.kubernetes/ui/kubernetes)
2. Select a test of interesting (expand timeframe, locate tests that have issues, then click) ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_synthetic_monitoroverview.png)
3. Pick an Availability Issue timeframe to analyze ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_synthetic_availabilityoverview.png)
4. Focus on a specific synthetic check error ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_synthetic_executionoverview.png)
5. Analyze a failed execution and see which step failed ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_synthetic_executiondetails.png)
6. Understand the full waterfall of requests and see which one failed ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_synthetic_analyzewaterfall.png)
7. Get the full Distributed Trace of the failed request ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_synthetic_drilltotrace.png)