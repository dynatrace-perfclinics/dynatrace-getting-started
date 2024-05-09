# How to monitor ArgoCD Metrics with Dynatrace
This notebook provides best practices on using Dynatrace to monitor your ArgoCD Instance!

**Got questions or feedback?**: [devrel@dynatrace.com](mailto:devrel@dynatrace.com?subject=Feedback%20on%20Release%20Validation)

**Target Audience**: DevSecOps, Platform Engineers, SREs

The goal of this How to is giving you all the metrics to build a Dynatrace dashboard with all relevant ArgoCD metrics like shown here:
| Dynatrace Platform | Dynatrace Classic
 --- | --- 
 ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_argocd_dashboard_dynatrace_new.png) | ![](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/images/howto_argocd_dashboard_dynatrace_classic.png)

[Download this Dynatrace Platform Dashboard](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/dashboards/ArgoCD-Platform-Observability.json) or the [Dynatrace Classic Dashboard](https://raw.githubusercontent.com/dynatrace-perfclinics/dynatrace-getting-started/main/dashboards/Platform-Services-ArgoCD-Overview.json) and import it in your Dynatrace Tenant!

## What metrics does ArgoCD provide?
ArgoCD exposes a lot of useful metrics via Prometheus. Learn more in [ArgoCD - Operator Manual - Metrics](https://argo-cd.readthedocs.io/en/stable/operator-manual/metrics/)

Dynatrace can ingest Prometheus metrics in various ways: 
* Dynatrace Operator to scrape metrics from services or pods or 
* via OpenTelemetry!

Most of our users use the Dynatrace Operator on Kubernetes so the easiest way is to follow the guidance on [Monitor Prometheus Metrics in K8s](https://docs.dynatrace.com/docs/platform-modules/infrastructure-monitoring/container-platform-monitoring/kubernetes-monitoring/monitor-prometheus-metrics) by adding the `metrics.dynatrace.com` annotations on your services that expose the `/metrics` scrape endpoint

## Annotating the ArgoCD Metrics Services
Based on the ArgoCD Metrics documentation there are 3 Services exposing Prometheus metrics:
| Type | Endpoint 
 --- | --- 
 Application Controller Metrics | `argocd-metrics:8082/metrics`
 API Server Metrics Metrics | `argocd-server-metrics:8083/metrics`
 Repo Server Metrics | `argocd-repo-server:8084/metrics`

When deploying ArgoCD you will automatically have those 3 services and all we need to do is add two lines to each service to tell Dynatrace to start scraping those metrics:

Here the example for the `argocd-repo-server`:
```
apiVersion: v1
kind: Service
metadata:
  annotations:
    metrics.dynatrace.com/port: "8084"
    metrics.dynatrace.com/scrape: "true"
  labels:
    app.kubernetes.io/component: repo-server
    app.kubernetes.io/name: argocd-repo-server
    app.kubernetes.io/part-of: argocd
  name: argocd-repo-server
  namespace: argocd
...
```

And the same two annotations can be added to `argocd-metrics` and `argocd-server-metrics`

## Chart your Metrics
From now on Dynatrace will automatically scrape all those metrics. You will see them show up in your List of Metrics. You can chart them on Dynatrace Classic Dashboards using the Data Explorer - or - put them on a new Dynatrace Dashboard using DQL for Metrics
