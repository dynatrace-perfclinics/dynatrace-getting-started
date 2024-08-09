# Workflow to trigger Synthetics and Lookup Ownership Information

## Preparation
1. Ensure your synthetic scripts are tagged with a `Key:Value` pair to denote a team that owns that synthetic. For example: `SupportTeam: ABC`.
2.	Go to `Settings > Ownership > Config ([terraform can also be used](https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest/docs/resources/ownership_config))
3.	Add a key which matches your tag key. This tells DT to treat those tag values as the team ID.
4.	Go to `Settings > ownership > teams`
5.	For each tag value (eg. `ABC` define their email or other details)

That’s it. When the workflow runs it will look up the tags on each synthetic, from there look up the relevant ownership team and then look up the email address (for example).

## Trigger the Workflow

This workflow template is triggered by an incoming cloud event with the `source == githubactions` (DT auto translates this field to `event.provider`) and `type == "com.mycompany.synthetic.batch.triggered"` (DT auto translates this to `event.type`)

```
// Requires an API token with `bizevents.ingest` permission
curl -X POST -H "Content-Type: application/json" https://abc12345.live.dynatrace.com/api/v2/bizevents/ingest \
  -d "{
        "specversion": "1.0",
        "id": "1",  // Generate a UUID here
        "source": "githubactions",
        "type": "com.mycompany.synthetic.batch.triggered",
        "data": {
            "monitors": ["HTTP_CHECK-DE1ACC402750B64F", "HTTP_CHECK-3940B2D3CC872C10"]
        }
      }"
```
## Workflow Step 1: Trigger Batch

The workflow begins by triggering a batch job for whichever `data.monitors` you want.

## Workflow Step 2: Retrieve Completion Details

When the synthetic batch has finished (remembering that inside the batch, multiple synthetics run and each of these can pass or fail independently).

## Workflow Step 3: Retrieve Synthetic Owners

Next the workflow uses the tags on each of the synthetic scripts and looks up the relevant team information.

## Workflow Step 4:  Output

The workflow template has two steps. 1 to send emails (if your tenant is enabled for this) and 1 to send an HTTPS request.
