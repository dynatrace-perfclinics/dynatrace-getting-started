# Plugin Service

## Requirements

- Python 3.10
    ```bash
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install python3.10 python3.10-venv
    ```
- Poetry: [installation manual page](https://python-poetry.org/docs/master/#installing-with-the-official-installer)
    ```bash
    curl -sSL https://install.python-poetry.org | python3.10 -
    ```

## Environments
The environment variables can be placed in `.env` file in the root dir of `pluginservice`, **Pydantic** is responsible for parsing them and will look in the `.env` file for any unset variables.

### Env vars describing plugin providers (services):
> **NOTE:** after `{PROVIDER}` there is a double underscore, which is how Pydantic handles nested definitions in the `BaseSettings` class
- `{PROVIDER}__PROTOCOL`: protocol to use for this provider (defaults to: `http://`)
- `{PROVIDER}__DOMAIN`: domain used for this provider 
    - for dev most likely `localhost`
    - for prod a DNS name of the service (e.g. `manager`)
- `{PROVIDER}__PORT`: port to use for this provider
- Currently registered plugin providers:
    - `manager` - **MANAGER**
    - `offerservice` - **OFFER_SERVICE**
> *Example:* OFFER_SERVICE__DOMAIN=offerservice
## About
`PluginService` is designed as a single entrypoint for managing all plugins (problem patterns) across all services in `EasyTrade`. Currently it doesn't hold the state for plugins, but serves as a proxy to all registered plugin providers.

Documentation for endpoints available at

- **SWAGGER:** `/swagger`
- **REDOC:** `/redoc`

## Running
### Dev 
```bash
poetry install # this will install all dependencies including dev ones
poetry run pytest # run tests
poetry run dev # run the server with reload on save
```
The dev server is run on `localhost:8088` which will be the same when run with `docker-compose`
### Prod
```bash
poetry install --no-dev # this will only install the required dependencies
poetry run prod # run server without reload
```
> **NOTE:** entrypoint for prod is designed to work behind nginx proxy so it shouldn't be run alone locally, use `docker-compose` instead


