# Dynatrace + k6 Integration

![Dynatrace dashboard](images/dashboard_v2.png)

TLDR: Try a hands on demo here: `Coming soon...`

## Building k6 Binary
k6 requires that you build a custom binary with the Dynatrace output plugin installed. Instructions on how to do so can be found [here](https://github.com/Dynatrace/xk6-output-dynatrace).

## Import Dashboard
In Dynatrace, go to dashboards and import the dashboard JSON from this folder.

## Create Dynatrace API Token
Create a Dynatrace API token with `metrics.ingest` permissions.

## Run k6

The Dynatrace output plugin will stream metrics to Dynatrace at runtime:

```
export K6_DYNATRACE_URL=http://<environmentid>.live.dynatrace.com 
export K6_DYNATRACE_APITOKEN=<Dynatrace API token>
./k6 run script.js -o output-dynatrace
```
