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
## Apply Configurations

### Dashboard
```bash
dtctl apply -f dashboards/valkey-dashboard.yaml --plain
```

### Anomaly Detectors
`dtctl apply` does not support `builtin:davis.anomaly-detectors`. Use `create` instead:

```bash
for f in anomaly-detectors/valkey-*.yaml; do
  echo "Creating $(basename $f)"
  dtctl create anomaly-detector -f "$f" --plain
done
```

Re-running is safe — each file carries its `objectId`, so dtctl will update the existing detector rather than create a duplicate.

> **Note:** Each detector file includes `executionSettings.actor: c235362c-eb2f-4157-b6da-6814fb842534`.
> This is the environment's automation service user and is required — the API rejects requests where this field is absent.
> If deploying to a different environment, replace this value with the target environment's service user ID,
> which you can find by running `dtctl get anomaly-detectors -o yaml | grep actor` against an existing detector.

