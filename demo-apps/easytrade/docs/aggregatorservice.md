# easyTradeAggregatorService

A small node service that periodically asks offer service for some data. Sometimes asks to register a new user. Based on the response speed the service behavior can change a bit for some time - too slow responses "freeze" the service for some time.

## Technologies used

- Docker
- Node.js

## Env vars

To customize how the aggregate service is working you can change these variables:

- STARTER_PACKAGE_PROBABILITY - probability of selecting **starter** package when registering new user
- LIGHT_PACKAGE_PROBABILITY - probability of selecting **light** package when registering new user
- PRO_PACKAGE_PROBABILITY - probability of selecting **pro** package when registering new user

> **NOTE:** All those probabilities should add to 1 (like: 0.5, 0.3, 0.2)
