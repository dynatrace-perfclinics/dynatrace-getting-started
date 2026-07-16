# Valkey Observability

Dashboard + Anomaly detectors for [Valkey](https://valkey.io).

![valkey dashboard 1](images/valkey-dashboard-1.png)
![valkey dashboard 2](images/valkey-dashboard-2.png)
![valkey dashboard 3](images/valkey-dashboard-3.png)
![valkey dashboard 4](images/valkey-dashboard-4.png)

```
Valkey  << Prometheus Exporter >> OTEL Collector >> Dynatrace
```

## Quick Start

How it works:

* Valkey runs as a Docker image
* The Prometheus exporter runs as a second Docker image and effectively does a periodic `valkey-cli info` call, translates the details into Prometheus metrics at `http://localhost:9121/metrics`
* An OpenTelemetry collector runs as a third Docker image and retrieves (scrapes) the valkey metrics. Teh collector sends those metrics into Dynatrace

Note: You'll need to generate a Dynatrace API Access token with `metrics.ingest` permissions.

### 0. Upload Dashboard and Anomaly Detectors

TODO

### 1. Start Valkey

Notice that you pass the [valkey.conf](valkey.conf) which sets the maximum memory. If max memory is unset, the dashboard will report `0` and the threshold and alerts won't work.

```
docker run --rm -d --name valkey -p 6379:6379 \
  -v $(pwd)/valkey.conf:/etc/valkey/valkey.conf \
  -p 6379:6379 \
  valkey/valkey:9.1.0 \
  /etc/valkey/valkey.conf
```

Add a key/value pair of foo=bar by exec'ing into the valkey container and using the built-in `valkey-cli`:

```
docker exec -it valkey /bin/sh
valkey-cli set foo "bar"
valkey-cli get foo
```

### 2. Start Prometheus Exporter

```
docker run -d --rm --name redis_exporter --network host -e REDIS_ADDR=redis://localhost:6379 oliver006/redis_exporter
```

You can make sure it works: `curl http://localhost:9121/metrics` should return a list of Prometheus metrics.

### 3. Start OTEL Collector

Start the OTEL collector which is configured via otel-collector-config.yaml to scrape the Prometheus metrics and send them into Dynatrace.
Notice that the collector configuration is set to automatically translate any cumulative metrics to delta format and to drop any metrics of type summary.

```
docker run --rm --network host \
  -v $(pwd)/otel-collector-config.yaml:/etc/otel/config.yaml \
  -e DT_API_TOKEN=dt0c01.******.******* \
  otel/opentelemetry-collector-contrib:latest \
  --config /etc/otel/config.yaml
```
