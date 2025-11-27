# Monitoring Goose CLI with Dynatrace

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

You can choose to [run it as a Docker container or download the binary](https://docs.dynatrace.com/docs/ingest-from/opentelemetry/collector#dt-collector-dist) and add it to your `PATH` then run it as a standalone binary (no install required).

Test the collector works by requesting its version:

```
c:\\path\\to\\
```
Once the collector 
