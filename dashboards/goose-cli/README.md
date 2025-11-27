# Monitoring Goose CLI with Dynatrace

⚠️ This is a work in progress

<img width="3173" height="1626" alt="Screenshot 2025-11-27 072708" src="https://github.com/user-attachments/assets/3a5a37cd-b04b-49b3-903a-713532751cac" />

[Goose](https://block.github.io/goose/) is an open source, locally installed CLI that lets you swap out backend models,
use multiple MCP servers and define re-usable "recipes" for common tasks.

Goose offers well structured JSONL logs and OpenTelemetry (OTLP) metrics and traces.

The contents of this folder demonstrate how to monitor Goose in Dynatrace.

## Prerequisites

To follow this guide you will need:

1. [Install Goose CLI](https://block.github.io/goose/docs/getting-started/installation)
1. [Have access to a Dynatrace account (sign up here)](https://dt-url.net/trial)

## Download Dashboard JSON

Later in the guide you will configure an OpenTelemetry collector to send telemetry into Dynatrace.

To visualise this data, we've prepared a dashboard.

1. Download this dashboard and save it to your computer
1. In Dynatrace, open `Dashboards` and upload the JSON file you just downloaded

It will be blank, of course, but we'll populate it with data soon!

## OpenTelemetry Collector

To get telemetry from Goose into Dynatrace we will use the OpenTelemetry collector.

The telemetry flow will be:

```
Goose (your machine) > Collector > Dynatrace
```

You can choose to [run it as a Docker container or download the binary](https://docs.dynatrace.com/docs/ingest-from/opentelemetry/collector#dt-collector-dist) and add it to your `PATH` then run it as a standalone binary (no install required).

Test the collector works by requesting its version:

```
c:\path\to\dynatrace-otel-collector.exe --version
v0.40.0
```

1. Download [collector.config.yaml](collector.config.yaml) to your computer
1. Modify the dummy path in this file to point you your Goose CLI logs (you can find the right paths for your platform [here](https://block.github.io/goose/docs/guides/logs/#cli-logs))

## Dynatrace API Token and URL

Before the collector can start, it needs authentication details for Dynatrace.

The Dynatrace URL should be in this format: `https://<ENVIRONMENT_ID>.live.dynatrace.com`
For example: `https://abc12345.live.dynatrace.com`

Formulate your URL and set this as an environment variables (use `set` instead of `export` on windows):

```
export DT_ENDPOINT=https://abc12345.live.dynatrace.com
```

The second piece of required information is an API token.

In Dynatrace, press `ctrl + k` and search for `access tokens` and go to that screen.

Create a new access token with these permissions:

* `logs.ingest`
* `metrics.ingest`
* `openTelemetryTrace.ingest`

Set the as an environment variable called `DT_API_TOKEN`:

```
export DT_API_TOKEN=dt0c01.*****.*****
```

Start the collector (and leave it running). Provide the config YAML file:

```
"c:\path\to\dynatrace-otel-collector.exe" --config=collector.config.yaml
```
