# How to do Distributed Trace and Database Diagnostics with Dynatrace
This notebook provides links and explanation for a handful or interesting use cases around Diagnostics with Dynatrace to identify hotspots in database access as well as hotspots in distributed traces.
**Target Audience**: Software & Performance Engineers, Architects, SREs

---

## 1: Identify Traces impacted by Database Queries (too many, too slow ...)
**Problem Statement:** A common performance problem are requests that either make a lot of database roundtrips or execute database queries that take a very long time.

**How Dynatrace helps:** Dynatrace makes it easy to find those traces so you can easily identify on whether to optimize your code to execute queries more efficient or talk with the database team to optimize those queries on the database engine.

**Steps**
1. Open the [Distributed Traces App](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.distributed.traces/ui/diagnostictools/purepaths)
2. Add and sort by database columns ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_trace_database.png)
3. Use filter to find outliers top contributors ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_trace_databasefilter.png)
4. Analyze the traces ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_trace_tracewithsqls.png)

---

## 2. Detecting inefficient  database queries (SQL, NoSQL, ...), root cause and impact
**Problem Statement:** Database performance problems can either be caused by inefficient queries or because services are making too many inefficient calls. 

**How Dynatrace helps:** Dynatrace identifies the top inefficient queries and inefficient query patterns (N+1 Query, too much data queried, ...). Dynatrace does this by analyzing distributed traces (captured through OneAgent or ingested through OpenTelemetry). This makes it easy to optimize the queries or the code that executes queries inefficiently!

**Steps**:
1. Open the [Database App](https://wkf10640.apps.dynatrace.com/ui/apps/dynatrace.classic.databases/ui/databases)
2. Click [Top database statements](https://wkf10640.live.dynatrace.com/ui/diagnostictools/mda?gtf=-2h&gf=all&mdaId=topdb) to analyze across all databases ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_database_opentopstatements.png)
3. Analyze by call frequency, response time, fetch count or errors! ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_database_topdbanalysis.png)
4. Open the backtrace to identify where those calls come from! ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_database_dbbacktrace.png)