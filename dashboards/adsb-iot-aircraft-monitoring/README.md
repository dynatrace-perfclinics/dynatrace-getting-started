# IoT Dashboards for Aircraft monitoring using OpenTelemetry and Dynatrace 

This repository contains all the JSON files for dashboards related to the blog [Leverage Edge IoT Data with OpenTelemetry and Dynatrace](https://www.dynatrace.com/news/blog/leverage-edge-iot-data-with-opentelemetry-and-dynatrace/). These dashboards are designed to help visualize and analyze aircraft data using OpenTelemetry and Dynatrace.

## Blog

[Leverage Edge IoT Data with OpenTelemetry and Dynatrace](https://www.dynatrace.com/news/blog/leverage-edge-iot-data-with-opentelemetry-and-dynatrace/)

## Dashboards Included

Below are the screenshots of the dashboard tiles and dashboards included in this repository:

1. **Altitude of the Aircraft Tile**  
   ![Altitude of the Aircraft Tile](screenshots/06-Altitiude-of-the-aircraft-tile.png)

2. **Breakdown of Aircraft Categories**  
   ![Breakdown of Aircraft Categories](screenshots/07-Breakdown-of-Aircraft-Categories.png)

3. **Flight Count**  
   ![Flight Count](screenshots/08-flight-count.png)

4. **Flights Stats**  
   ![Flights Stats](screenshots/09-Flights-stats-1.png)

5. **Flight Analysis with Distance**  
   ![Flight Analysis with Distance](screenshots/10-flight-analysis-with-distance.png)

## How to Use

1. Set up the hardware and configure it to send the `aircraft.json` logs to Dynatrace by following the steps [outlined](https://www.dynatrace.com/news/blog/leverage-edge-iot-data-with-opentelemetry-and-dynatrace/).
2. Download the JSON files from this repository.
3. Import the JSON files into your Dynatrace environment.
4. Customize the dashboards as needed to suit your monitoring requirements.

NB: Use the Notebook to see the query and results without setting up any hardware or configuration. Do not `run` the Notebook as you it will try to fetch fresh data which you may not have.

For more details on setting up and using these dashboards, please refer to the blog post linked above.

Feel free to contribute to this repository by adding more dashboards or suggesting improvements!


## Additional Resources

This repository also contains a Dynatrace Notebook `Notebook-Flight_Stats.json` that provides additional analytics on flight data. The output of the Notebook is available in [`Notebook-PrintView.pdf`](screenshots/Notebook-PrintView.pdf)

