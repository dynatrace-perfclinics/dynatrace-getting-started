# easyTradeEngine

Java service used to periodically run scheduled tasks.  
Right now it only tries to finalize long running transactions each 60 seconds.

## Technologies used

- Docker
- Java

## Endpoints

### Swagger

**/api/swagger-ui/**

> **NOTE:** `/` at the end is required

### `GET` **/api/trade/scheduler/start** `(Start long running transaction scheduler)`

##### Parameters

> | name | type | data type | description |
> | ---- | ---- | --------- | ----------- |
>
> None

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8090/api/trade/scheduler/start" -H "accept: */*"
> ```

### `GET` **/api/trade/scheduler/status** `(Check scheduler status)`

##### Parameters

> | name | type | data type | description |
> | ---- | ---- | --------- | ----------- |
>
> None

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8090/api/trade/scheduler/status" -H "accept: */*"
> ```

### `GET` **/api/trade/scheduler/stop** `(Stop long running transaction scheduler)`

##### Parameters

> | name | type | data type | description |
> | ---- | ---- | --------- | ----------- |
>
> None

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8090/api/trade/scheduler/stop" -H "accept: */*"
> ```
