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

## Service Users

Some configuration requires an actor which is a service user and can be found in the templates as `actor: <SERVICE_USER_ID>`. If required, first investigate the required permissions for whatever config is going to be deployed (see https://dynatrace-oss.github.io/dtctl/docs/token-scopes). Once you have the permisions, tell the user to go to `https://myaccount.dynatrace.com`, select their account, click on "Identity & Access Management" then "Service Users" and create a service user with the permssions that you provide. Then tell them to copy the service user UUID and give it to you. You use this UUID to replace the template in each file before uploading the file.
