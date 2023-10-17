# easyTradeContentCreator

Java service that creates the pricing data each minute.

## Technologies used

- Docker
- Java
- SQL
- Stock exchange information - candle data

## Logic

1. **ONCE:** Clear the database.
1. **ONCE:** Generate data for the last 24h.
1. **REPEAT:** Generate 1 row for each instrument. If we generated second 24h of data, remove last days data. Wait 60 seconds.
