# How to Analyze Infrastructure with Dynatrace
This notebook provides links and explanation for a handful or use cases when analyzing infrastructure related issues such as high CPU, disk, logs, ....

**Target Audience**: ITOps, SREs

**Got questions or feedback?**: [devrel@dynatrace.com](mailto:devrel@dynatrace.com?subject=Feedback%20on%20Infra)

---

## 1. Access all relevant data when managing infrastructure: metrics, logs, vulnerabilities, ...
**Problem Statement:** When problems happen in the infrastructure its important to quickly have access to all relevant data!

**How Dynatrace helps:** Dynatrace' Host App provides a single point of view for everything needed when managing infrastructure such as hosts (physical, virtual or cloud): Metrics, Logs, Events, Vulnerabilities, Dependencies, Ownership

**Steps**:
1. Open the [Hosts App](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.hosts/#newhosts)
2. Select a host ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_host_selecthost.png)
3. Expand the timeframe ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_host_host_details_1.png)
4. Explore events and logs ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_host_host_details_2.png)
5. Understand current vulnerabilities ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_host_vulnerabilities.png)

---

# 2: Analyze Hosts and root cause of CPU, Memory, Disk or Network spikes
**Problem Statement:** When a host runs high on CPU, Memory, Disk or Network Utilization the question is what is causing this

**How Dynatrace helps:** Dynatrace's Host App provides full visibility into the host and all running processes. Davis Analyzer can be used for ad-hoc analysis of spikes of CPUs, Disk, Network (or any other metric) and finds the correlating metric

**Steps**
1. Select a host through the [Hosts App](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.hosts/#newhosts) 2. Select a host ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/)
2. Select a metric you want to explore, e.g: System Load
3. Select a significant enough timeframe that has the pattern in the middle of the data set
4. Once the Analyze button becomes available select the metric ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_host_davisondemand_selecttime.png)
5. Analyze the most relevant metrics that correlate with the reference metric  ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_host_davisondemand_result.png)