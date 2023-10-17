# easyTradeBrokerService

This service is mainly used to get stock market information from the database and to provide support to trades - create and close short and long trades.

## Technologies used

- Docker
- .Net 6

If you want the service to work properly, you should try setting these ENV variables:

- MANAGER_HOSTANDPORT - manager host and port, for example "manager:80"
- ACCOUNTSERVICE_HOSTANDPORT - account service host and port, for example "accountservice:8080"
- PRICINGSERVICE_HOSTANDPORT - pricing service host and port, for example "pricingservice:80"

## Endpoints

### Swagger

**/swagger**

### `GET` **/api/account/{accountId}** `(Get account)`

##### Parameters

> | name        | type     | data type | description |
> | ----------- | -------- | --------- | ----------- |
> | `accountId` | required | int       | Account id  |

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/account/1" -H  "accept: */*"
> ```

### `PUT` **/api/account/PayPackageFee/{accountId}** `(Pay the package fee for an account with given id)`

##### Parameters

> | name        | type     | data type | description |
> | ----------- | -------- | --------- | ----------- |
> | `accountId` | required | int       | Account id  |

##### Example cURL

> ```bash
>  curl -X PUT "http://172.18.147.235:8084/api/account/PayPackageFee/2" -H  "accept: */*"
> ```

### `PUT` **/api/account/SelectPackage/{accountId}/{packageId}** `(Change package selected for an account)`

##### Parameters

> | name        | type     | data type | description |
> | ----------- | -------- | --------- | ----------- |
> | `accountId` | required | int       | Account id  |
> | `packageId` | required | int       | Package id  |

##### Example cURL

> ```bash
>  curl -X PUT "http://172.18.147.235:8084/api/account/SelectPackage/1/3" -H  "accept: */*"
> ```

### `GET` **/api/balancehistory/GetBalancehistoriesForAccount/{accountId}** `(Get balance history for given account id)`

##### Parameters

> | name        | type     | data type | description |
> | ----------- | -------- | --------- | ----------- |
> | `accountId` | required | int       | Account id  |

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/balancehistory/GetBalancehistoriesForAccount/1" -H  "accept: text/plain"
> ```

### `POST` **/api/creditcard/DepositMoney** `(Deposit money to account from the bank card)`

##### Parameters

> | name         | type     | data type | description                    |
> | ------------ | -------- | --------- | ------------------------------ |
> | `accountId`  | required | int       | Account id                     |
> | `amount`     | required | decimal   | The amount transfered          |
> | `name`       | required | string    | Name on the bank card          |
> | `address`    | required | string    | Address of card owner          |
> | `email`      | required | string    | Email of person doing transfer |
> | `cardNumber` | required | string    | Card number                    |
> | `cardType`   | required | string    | Card type                      |
> | `cvv`        | required | string    | The CVV code                   |

##### Example cURL

> ```bash
>  curl -X POST "http://172.18.147.235:8084/api/creditcard/DepositMoney" -H  "accept: text/plain" -H  "Content-Type: application/json" -d "{\"accountId\":1,\"amount\":1,\"name\":\"string\",\"address\":\"string\",\"email\":\"string@ab.cd\",\"cardNumber\":\"9879098093738475843\",\"cardType\":\"Visa\",\"cvv\":\"782\"}"
> ```

##### Example of JSON body

> ```json
> {
>   "accountId": 1,
>   "amount": 1,
>   "name": "string",
>   "address": "string",
>   "email": "string@ab.cd",
>   "cardNumber": "9879098093738475843",
>   "cardType": "Visa",
>   "cvv": "782"
> }
> ```

### `POST` **/api/creditcard/WithdrawMoney** `(Withdraw money from an account to some bank card)`

##### Parameters

> | name         | type     | data type | description                    |
> | ------------ | -------- | --------- | ------------------------------ |
> | `accountId`  | required | int       | Account id                     |
> | `amount`     | required | decimal   | The amount transfered          |
> | `name`       | required | string    | Name on the bank card          |
> | `address`    | required | string    | Address of card owner          |
> | `email`      | required | string    | Email of person doing transfer |
> | `cardNumber` | required | string    | Card number                    |
> | `cardType`   | required | string    | Card type                      |

##### Example cURL

> ```bash
>  curl -X POST "http://172.18.147.235:8084/api/creditcard/WithdrawMoney" -H  "accept: text/plain" -H  "Content-Type: application/json" -d "{  \"accountId\": 1,  \"amount\": 1,  \"name\": \"string\",  \"address\": \"string\",  \"email\": \"string@ab.cd\",  \"cardNumber\": \"9879098093738475843\",  \"cardType\": \"Visa\",}"
> ```

##### Example of JSON body

> ```json
> {
>   "accountId": 1,
>   "amount": 1,
>   "name": "string",
>   "address": "string",
>   "email": "string@ab.cd",
>   "cardNumber": "9879098093738475843",
>   "cardType": "Visa"
> }
> ```

### `GET` **​/api​/instruments** `(Get instrument list)`

##### Parameters

> | name | type | data type | description |
> | ---- | ---- | --------- | ----------- |
>
> None

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/instruments" -H  "accept: text/plain"
> ```

### `GET` **/api/ownedinstruments/{accountId}** `(Get instruments owned by an account)`

##### Parameters

> | name        | type     | data type | description |
> | ----------- | -------- | --------- | ----------- |
> | `accountId` | required | int       | Account id  |

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/ownedinstruments/1" -H  "accept: text/plain"
> ```

### `GET` **/api/package/{packageId}** `(Get package)`

##### Parameters

> | name        | type     | data type | description |
> | ----------- | -------- | --------- | ----------- |
> | `packageId` | required | int       | Package id  |

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/package/1" -H  "accept: text/plain"
> ```

### `GET` **/api/package/free** `(Get the free package)`

##### Parameters

> | name | type | data type | description |
> | ---- | ---- | --------- | ----------- |
>
> None

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/package/free" -H  "accept: text/plain"
> ```

### `GET` **/api/package/all** `(Get all packages list)`

##### Parameters

> | name | type | data type | description |
> | ---- | ---- | --------- | ----------- |
>
> None

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/package/all" -H  "accept: text/plain"
> ```

### `POST` **/api/trade/BuyAssets** `(Buy assets - short/instant action)`

##### Parameters

> | name           | type     | data type | description                   |
> | -------------- | -------- | --------- | ----------------------------- |
> | `accountId`    | required | int       | Account id                    |
> | `instrumentId` | required | int       | Instrument id to buy          |
> | `amount`       | required | decimal   | Amount to buy                 |
> | `price`        | required | decimal   | Price at which we are trading |

##### Example cURL

> ```bash
>  curl -X POST "http://172.18.147.235:8084/api/trade/BuyAssets" -H  "accept: */*" -H  "Content-Type: application/json" -d "{\"accountId\":6,\"instrumentId\":1,\"amount\":1,\"price\":1}"
> ```

##### Example of JSON body

> ```json
> {
>   "accountId": 6,
>   "instrumentId": 1,
>   "amount": 1,
>   "price": 1
> }
> ```

### `POST` **/api/trade/SellAssets** `(Sell assets - short/instant action)`

##### Parameters

> | name           | type     | data type | description                   |
> | -------------- | -------- | --------- | ----------------------------- |
> | `accountId`    | required | int       | Account id                    |
> | `instrumentId` | required | int       | Instrument id to sell         |
> | `amount`       | required | decimal   | Amount to sell                |
> | `price`        | required | decimal   | Price at which we are trading |

##### Example cURL

> ```bash
>  curl -X POST "http://172.18.147.235:8084/api/trade/SellAssets" -H  "accept: */*" -H  "Content-Type: application/json" -d "{\"accountId\":6,\"instrumentId\":1,\"amount\":1,\"price\":1}"
> ```

##### Example of JSON body

> ```json
> {
>   "accountId": 6,
>   "instrumentId": 1,
>   "amount": 1,
>   "price": 1
> }
> ```

### `POST` **/api/trade/LongBuyAssets** `(Long buy assets)`

##### Parameters

> | name           | type     | data type | description                             |
> | -------------- | -------- | --------- | --------------------------------------- |
> | `accountId`    | required | int       | Account id                              |
> | `instrumentId` | required | int       | Instrument id to buy                    |
> | `amount`       | required | decimal   | Amount to buy                           |
> | `price`        | required | decimal   | Price at which we are trading           |
> | `duration`     | required | int       | How many hours the trade should be open |

##### Example cURL

> ```bash
>  curl -X POST "http://172.18.147.235:8084/api/trade/LongBuyAssets" -H  "accept: */*" -H  "Content-Type: application/json" -d "{\"accountId\":6,\"instrumentId\":1,\"amount\":1,\"price\":1,\"duration\":1}"
> ```

##### Example of JSON body

> ```json
> {
>   "accountId": 6,
>   "instrumentId": 1,
>   "amount": 1,
>   "price": 1,
>   "duration": 1
> }
> ```

### `POST` **/api/trade/LongSellAssets** `(Long sell assets)`

##### Parameters

> | name           | type     | data type | description                             |
> | -------------- | -------- | --------- | --------------------------------------- |
> | `accountId`    | required | int       | Account id                              |
> | `instrumentId` | required | int       | Instrument id to sell                   |
> | `amount`       | required | decimal   | Amount to sell                          |
> | `price`        | required | decimal   | Price at which we are trading           |
> | `duration`     | required | int       | How many hours the trade should be open |

##### Example cURL

> ```bash
>  curl -X POST "http://172.18.147.235:8084/api/trade/LongSellAssets" -H  "accept: */*" -H  "Content-Type: application/json" -d "{\"accountId\":6,\"instrumentId\":1,\"amount\":1,\"price\":1,\"duration\":3}"
> ```

##### Example of JSON body

> ```json
> {
>   "accountId": 6,
>   "instrumentId": 1,
>   "amount": 1,
>   "price": 1,
>   "duration": 1
> }
> ```

### `POST` **/api/trade/ProcessLongRunningTransactions** `(Try to finalize long running transactions/trades)`

##### Parameters

> | name | type | data type | description |
> | ---- | ---- | --------- | ----------- |
>
> None

##### Example cURL

> ```bash
>  curl -X POST "http://172.18.147.235:8084/api/trade/ProcessLongRunningTransactions" -H  "accept: */*" -d ""
> ```

### `GET` **/api/trade/GetTrades/{records}** `(Get trades)`

##### Parameters

> | name      | type         | data type | description                                          |
> | --------- | ------------ | --------- | ---------------------------------------------------- |
> | `records` | not required | int       | How many records should be returned. Defaults to 100 |

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/trade/GetTrades/100" -H  "accept: text/plain"
> ```

### `GET` **/api/trade/GetAllTradesForInstrument/{instrument}/{records}** `(Get trades for given instrument)`

##### Parameters

> | name         | type         | data type | description                                          |
> | ------------ | ------------ | --------- | ---------------------------------------------------- |
> | `instrument` | required     | int       | Instrument id                                        |
> | `records`    | not required | int       | How many records should be returned. Defaults to 100 |

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/trade/GetAllTradesForInstrument/1/100" -H  "accept: text/plain"
> ```

### `GET` **/api/trade/GetAllTradesForAccount/{account}/{records}** `(Get trades for given account)`

##### Parameters

> | name      | type         | data type | description                                          |
> | --------- | ------------ | --------- | ---------------------------------------------------- |
> | `account` | required     | int       | Account id                                           |
> | `records` | not required | int       | How many records should be returned. Defaults to 100 |

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/trade/GetAllTradesForAccount/1/100" -H  "accept: text/plain"
> ```

### `GET` **/api/trade/GetLongRunningTransactionsForAccount/{account}/{records}** `(Get long trades for given account)`

##### Parameters

> | name      | type         | data type | description                                          |
> | --------- | ------------ | --------- | ---------------------------------------------------- |
> | `account` | required     | int       | Account id                                           |
> | `records` | not required | int       | How many records should be returned. Defaults to 100 |

##### Example cURL

> ```bash
>  curl -X GET "http://172.18.147.235:8084/api/trade/GetLongRunningTransactionsForAccount/1/100" -H  "accept: text/plain"
> ```
