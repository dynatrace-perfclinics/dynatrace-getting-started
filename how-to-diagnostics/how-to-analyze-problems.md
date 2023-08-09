# How to work with Davis-detected Problems
This notebook provides links and explanation on how to best navigate and work with Davis-detected problems, the impact and follow root cause

**Target Audience**: SREs, App Owners, Developers, IT Ops ...

To learn more about Dynatrace Davis and how the Root Cause detection works go here:
* [(Website) Meet Davis](https://www.dynatrace.com/platform/artificial-intelligence/)
* [(Doc) Davis AI](https://www.dynatrace.com/support/help/platform/davis-ai)

---

## 1. Analyze a Davis-detected Problem and find root cause information
**Problem Statement:** As an owner of an application, infrastructure or platform I need to know the impact and root cause of any ongoing issues.

**How Dynatrace helps:** Dynatrace Davis AI automatically detects anomalies across the entire stack and automatically captures all relevant impact and root cause information in a single Davis-detected Problem. This problem ticket is the start of your detailed investigation and can also be used to trigger an automation workflow to notify stakeholders or auto-remediate the problem.

**Steps**:
1. Open the [Problems App](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.problems/ui/problems)
2. Select a problem of interest (expand timeframe, filter on problem type or impact) ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_problems_overview.png)
3. Understand Impact and Root Cause ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_problems_problemdetails.png)
4. Navigate to root cause service ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_problems_rootcausesvc_overview.png)
5. Analyze root cause events and logs ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_problems_rootcausesvc_events_logs.png)
6. Analyze the root cause in the distributed trace ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_problems_rootcause_trace_1.png)
7. Analyze the root cause down to code level ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_problems_rootcause_trace_2.png)