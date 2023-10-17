# easyTradePricingService

A .Net service that provides information about instruments prices.

## Technologies used

- Docker
- .Net 6

## Endpoints

**/swagger**

### `GET` **/api/Pricing/GetLastPrice** `(Returns the newest price record)`

##### Parameters

> | name | type | data type | description |
> | ---- | ---- | --------- | ----------- |
>
> None

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8083/api/Pricing/GetLastPrice" -H  "accept: text/plain"
> ```

### `GET` **/api/Pricing/GetLatestPrices** `(Get latest price of each instrument)`

##### Parameters

> | name | type | data type | description |
> | ---- | ---- | --------- | ----------- |
>
> None

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8083/api/Pricing/GetLatestPrices" -H  "accept: text/plain"
> ```

### `GET` **​/api​/Pricing​/GetPricingDataForInstrument​/{instrumentId}​/{records}** `(Get pricing data for a given instruments)`

##### Parameters

> | name           | type         | data type | description                                 |
> | -------------- | ------------ | --------- | ------------------------------------------- |
> | `instrumentId` | required     | int       | Instrument id                               |
> | `records`      | not required | int       | How many records to return. Defaults to 100 |

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8083/api/Pricing/GetPricingDataForInstrument/1/100" -H  "accept: text/plain"
> ```
