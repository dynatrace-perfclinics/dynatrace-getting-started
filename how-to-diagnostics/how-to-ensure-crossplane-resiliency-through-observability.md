# How to ensure Crossplane Resiliency through Observability

Build trust in your platform by quickly achieving Crossplane observability with our step-by-step instructions and sample dashboard.

This was inspired by the talk [Crossplane Observability at KubeCon 2024](https://www.youtube.com/watch?v=R2NBPX2x9n4).

## Get Started

- **Scrape & Visualize Metrics**: Download and
  import [this notebook](../notebooks/crossplane/crossplane-for-platform-engineers-setup.json) for step-by-step
  instructions on scraping & visualizing Crossplane metrics with Dynatrace.
- **Visualize Your Data**: Download and
  import [this sample dashboard](../dashboards/crossplane/crossplane-for-platform-engineers.json) to gain insights
  about the health and performance of your Crossplane installation.

**Watch the full step-by-step guide on YouTube**: 

[![Watch it on YouTube](https://img.youtube.com/vi/1loc00LRYEw/0.jpg)](https://www.youtube.com/watch?v=1loc00LRYEw)

**This is the dashboard you get**
![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/dashboard_crossplane_for_platform_engineers.png)

# Prerequisites

- [A Crossplane installation](https://docs.crossplane.io/latest/software/install/)
- [Dynatrace configured on the Kubernetes cluster Crossplane is deployed to](https://docs.dynatrace.com/docs/setup-and-configuration/setup-on-k8s)

--- 

# Step 1: Expose Crossplane Metrics

To begin, configure Crossplane to expose metrics by adjusting values file of Helm chart you used to deploy Crossplane. Add the following entry to your `values.yaml`:

```yaml
metrics:
  enabled: true
```

After updating the configuration, redeploy Crossplane. If you installed Crossplane manually via Helm, use the following command to update your installation:

```sh
helm upgrade \
  --namespace crossplane-system \
  --values crossplane-values.yaml \
  crossplane crossplane-stable/crossplane
```

Once the Helm chart is reapplied, verify that the Crossplane deployment exposes port 8080:

```sh
kubectl \
  --namespace crossplane-system \
  --output yaml \
  get deployment crossplane \
  | grep -A 9 'ports:'
```

The output should show port 8080 is now available. If not, ensure the Crossplane Helm chart was successfully redeployed and all pods have restarted.

To inspect the metrics Crossplane exposes, set up port forwarding to the service on port 8080 and use curl to fetch the metrics:

```sh
kubectl \
  --namespace crossplane-system \
  port-forward deployment/crossplane 8080:8080
```

```sh
curl http://localhost:8080/metrics
```

---

# Step 2: Expose Crossplane Provider Metrics

Crossplane providers generated with [Upjet](https://github.com/crossplane/upjet/tree/main) automatically expose metrics by default. This applies to most providers, so additional configuration is typically not required.

## How to Verify if a Provider Was Generated with Upjet?

1. **Search in the Upbound Marketplace**: Look for the provider in the [Upbound Marketplace](https://marketplace.upbound.io/providers). Providers with the "Upbound Official" tag are managed by the official Crossplane team and automatically expose metrics.
2. **Check Provider Documentation**: If the provider does not have the "Upbound Official" tag, review the provider's README or documentation for mentions of upjet or metrics to confirm metrics exposure.

## What if My Provider Was Not Generated with Upjet?

If your provider was not generated with Upjet, you will need to refer to the provider's documentation or explore issues within the community for guidance on metric exposure. You might also consider contributing to the provider's development to include metric exposure. This guide assumes that the metrics defined in the [Upjet documentation](https://github.com/crossplane/upjet/blob/main/docs/monitoring.md) are exposed.

---

# Step 3: Collect All Metrics

In this step, we will configure Dynatrace to scrape metrics from Crossplane and its providers.

## Scrape Crossplane Metrics

Add the following entry to your `values.yaml` file used to configure your Crossplane Helm deployment:

```yaml
customAnnotations:
  metrics.dynatrace.com/scrape: 'true'
  metrics.dynatrace.com/port: '8080'
  metrics.dynatrace.com/path: '/metrics'
```

After updating the configuration, redeploy Crossplane. If you installed Crossplane manually via Helm, use the following command to update your installation:

```sh
helm upgrade \
  --namespace crossplane-system \
  --values crossplane-values.yaml \
  crossplane crossplane-stable/crossplane
```

To ensure the annotations are correctly applied, inspect the Crpssplane deployment again:

```sh
kubectl \
  --namespace crossplane-system \
  --output yaml \
  get deployment crossplane \
  | grep -A 6 'annotations:'
```

The output should display the annotations under the metadata section similar to this. If not, ensure the Crossplane Helm chart was successfully redeployed and all pods have restarted.

```yaml
annotations:
  metrics.dynatrace.com/scrape: "true"
  metrics.dynatrace.com/port: "8080"
  metrics.dynatrace.com/path: "/metrics"
```

## Scrape Crossplane Provider Metrics

Define a [DeploymentRuntimeConfig](https://docs.crossplane.io/latest/concepts/providers/#runtime-configuration) to apply Dynatrace scraping settings across all provider deployments and pods:

```yaml
apiVersion: pkg.crossplane.io/v1beta1
kind: DeploymentRuntimeConfig
metadata:
  name: default
  namespace: crossplane-system
spec:
  deploymentTemplate:
    metadata:
      annotations:
        metrics.dynatrace.com/scrape: "true"
        metrics.dynatrace.com/port: "8080"
        metrics.dynatrace.com/path: /metrics
    spec:
      selector: {}
      template:
        metadata:
          annotations:
            metrics.dynatrace.com/scrape: "true"
            metrics.dynatrace.com/port: "8080"
            metrics.dynatrace.com/path: /metrics
```

Deploy this configuration to your cluster:

```sh
kubectl apply -f deployment-runtime-config.yaml
```

After deploying, check the provider pods to confirm that the annotations are set. For the [Upbound AWS provider] you could inspect the pod with this command:

```sh
kubectl \
  --namespace crossplane-system \
  --output yaml \
  get deployment provider-aws \
  | grep 'annotations:' -A 6
```

You should see the necessary annotations listed similarly as shown for the Crossplane metrics.

---

# Step 4: Chart the Metrics

With Dynatrace configured to automatically scrape all Crossplane metrics, it's time to visualize these metrics. You can combine the freshly scraped Crossplane metrics with standard Kubernetes metrics, such as CPU and Memory usage, to create a comprehensive view.

> **Pro tip**: Crossplane heavily relies on Kubernetes events to emit information and problems, so consider including these to gain additional insights.

## Which Crossplane Metrics Are Available?

Crossplane and its providers expose a variety of metrics. For a detailed list of all available metrics, refer to their official documentation:

- [Crossplane metrics documentation](https://docs.upbound.io/xp-arch-framework/interface-integrations/monitoring-and-observability/)
- [Upjet provider metrics documentation](https://github.com/crossplane/upjet/blob/main/docs/monitoring.md)

## Use Our Sample Dashboard to Get Started

To assist you in getting started with building a Crossplane dashboard, we have created a sample dashboard. Feel free to [download its JSON definition](../dashboards/crossplane/crossplane-for-platform-engineers.json) and import it to your tenant to get started.

![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/dashboard_crossplane_for_platform_engineers.png)

---

# Where to go from here?

Now that you have all the metrics at your fingertips and know how to query them using DQL, it's time to get creative.

You can, for example, configure a [Site Reliability Guardian](https://docs.dynatrace.com/docs/platform-modules/automations/site-reliability-guardian) to regularly execute DQL queries nd monitor your system’s performance within specified thresholds. For instance, to ensure the maximum time to readiness is within an acceptable range, you could use the following DQL query:

```dql
timeseries {
  ttr_sum = avg(upjet_resource_ttr_sum),
  ttr_count = avg(upjet_resource_ttr_count)
},
filter: k8s.cluster.name == "your-cluster-name"
| fieldsAdd duration = ttr_sum[] / ttr_count[]
| fields ttr=arrayMax(duration)
```

Additionally, you can configure [Metric events](https://docs.dynatrace.com/docs/platform/davis-ai/anomaly-detection/metric-events) for automated alerts if a metric is above or below a certain threshold.
