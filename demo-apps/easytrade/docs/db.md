# easyTradeDb

MSSQL database service

## Technologies used

- Docker
- MSSQL
- Bash scripts
- JSON

## Logic

The MSSQL is initialized with:

- User: sa, password given in ENV
- Database: TradeManagement
- Tables:
  - Accounts -> around 100 rows,
  - BalanceHistory -> around 13000 rows,
  - Instruments -> 15 rows,
  - OwnedInstruments -> around 1500 rows,
  - Packages and Products -> 3 rows each,
  - Trades -> some initial trade data, around 13000 rows,
  - Pricing -> starts up empty, but gets filled with around 21000 rows by ContenCreator service after it starts
