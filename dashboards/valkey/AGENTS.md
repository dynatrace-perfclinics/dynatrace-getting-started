# Valkey Observability — Agent Instructions

This directory contains Dynatrace metric alert definitions and Dashboards for Valkey (Redis-compatible).
When working here, apply the configurations to Dynatrace using dtctl.

## Prerequisites

### 1. Install dtctl

Check first: if `dtctl version` succeeds, skip this step. Prompt the user before actioning this. Confirm with them they're happy for you to install dtctl.

**macOS / Linux (Homebrew):**
```bash
brew install dynatrace-oss/tap/dtctl
```

**macOS / Linux (shell script):**
```bash
curl -fsSL https://raw.githubusercontent.com/dynatrace-oss/dtctl/main/install.sh | sh
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/dynatrace-oss/dtctl/main/install.ps1 | iex
```

### 2. Authenticate

```bash
dtctl auth login --context my-env --environment "$DYNATRACE_BASE_URL"
dtctl doctor
```

`DYNATRACE_BASE_URL` is the environment URL (e.g. `https://abc12345.apps.dynatrace.com`).
The token must have `Read settings` and `Write settings` scopes.

### 3. Install Agent Skills

It's important to install the agent skills so you know how to work with Dynatrace via dtctl.

You can install using the standard `.agents` syntax or client specific (see `--for` flag).

Ask the user if unsure.

```
dtctl skills install --cross-client
```

## Apply Alert Configurations

```bash
for f in alerts/valkey-*.yaml; do
  echo "Applying $f"
  dtctl apply -f "$f" --plain
done
```

Creates five metric events under `builtin:anomaly-detection.metric-events`. Re-running is safe — `dtctl apply` is idempotent.

## Alert Reference

| File | Condition | Severity | Enabled |
|---|---|---|---|
| `alerts/valkey-memory-pressure.yaml` | `used_memory / maxmemory > 85%` | RESOURCE | yes |
| `alerts/valkey-connection-storm.yaml` | `connected_clients > 10,000` | RESOURCE | yes |
| `alerts/valkey-cluster-degraded.yaml` | `cluster_state != ok` | AVAILABILITY | **no** |
| `alerts/valkey-tail-latency.yaml` | `latency p99 > 1ms` | SLOWDOWN | yes |
| `alerts/valkey-io-threads-saturated.yaml` | `io_threads_active > 80%` | RESOURCE | yes |

## Known Limitations

- **Cluster alert is disabled.** `valkey-cluster-degraded.yaml` ships with `enabled: false` because this instance runs in standalone mode. Enable it and update the `metricSelector` only after cluster mode is configured in `valkey.conf`.
- **I/O thread alert requires `io-threads >= 4`.** With the default of 1 thread the utilisation metric is binary. Update `valkey.conf` before relying on this alert for capacity signals.
