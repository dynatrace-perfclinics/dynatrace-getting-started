# easyTradeCalculationService

C++ service that reads some data from RabbitMQ and puts the result on the default output

## Technologies used

- Docker
- C++
- RabbitMQ

## Logic

Service runs an endless loop that that tries to consume data from the message queue each 15 seconds.
