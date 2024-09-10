# Load Testing

Capture and parse the `x-dynatrace-test` header to gather information from load testing tools.

See [this page](https://docs.dynatrace.com/docs/platform-modules/automations/cloud-automation/test-automation) for more information.

| Header Value | Description |
|-----|------|
| VU  | Virtual User ID of the unique user who sent the request. |
| SI  | Source ID identifies the product that triggered the request (JMeter, LoadRunner, Neotys, or other).|
| TSN | Test Step Name is a logical test step within your load testing script (for example, Login or Add to cart). |
| LSN | Load Script Name - name of the load testing script. This groups a set of test steps that make up a multistep transaction (for example, an online purchase). |
| LTN | The Load Test Name uniquely identifies a test execution (for example, 6h Load Test – June 25).|
| PC | Page Context provides information about the document that is loaded in the currently processed page.|