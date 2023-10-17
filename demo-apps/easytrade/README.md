# EasyTrade

A project consisting of many small services that connect to each other.  
It is made like a stock broking application - it allows it's users to buy&sell some stocks/instruments.  
Of course it is all fake data and the price has a 24 hour cycle...

## Architecture diagram

![EasyTrade architecture](./img/architecture.jpg)

## Database diagram

![EasyTrade database](./img/database.jpg)

## Service list

EasyTrade consists of the following services/components:

| Service                                                  | Proxy endpoint    |
| -------------------------------------------------------- | ----------------- |
| [Account service](./docs/accountservice.md)              | `/accountservice` |
| [Aggregator service](./docs/aggregatorservice.md)        | `---`             |
| [Broker service](./docs/brokerservice.md)                | `/broker`         |
| [Calculation service](./docs/calculationservice.md)      | `---`             |
| [Content creator](./docs/contentcreator.md)              | `---`             |
| [Db](./docs/db.md)                                       | `---`             |
| [Engine](./docs/engine.md)                               | `/engine`         |
| [Frontend](./docs/frontend.md)                           | `/`               |
| [Frontend reverse-proxy](./docs/frontendreverseproxy.md) | `---`             |
| [Login service](./docs/loginservice.md)                  | `/login`          |
| [Manager](./docs/manager.md)                             | `---`             |
| [Offer service](./docs/offerservice.md)                  | `/offerservice`   |
| [Plugin service](./docs/pluginservice.md)                | `/pluginservice`  |
| [Pricing service](./docs/pricingservice.md)              | `/pricing`        |

> To learn more about endpoints / swagger for the services go to their respective readmes

## Docker compose

To run the easytrade using docker you can use provided `compose.yaml`.
To use it you need to have:

- Docker with minimal version **v20.10.13**
  - you can follow [this](https://docs.docker.com/engine/install/ubuntu/) guide to update Docker
  - this guide also covers installing Docker Compose Plugin
- Docker Compose Plugin
  ```bash
  sudo apt update
  sudo apt install docker-compose-plugin
  ```
  - more information in [this](https://docs.docker.com/compose/install/linux/) guide

With this you can run

```bash
docker compose up
# or to run in the background
docker compose up -d
```

You should be able to access the app at `localhost:80` or simply `localhost`.

> **NOTE:** It make take a few minutes for the app to stabilize, you may expirience errors in the frontend or see missing data before that happens.

> **NOTE:** Docker Compose V1 which came as a separate binary (`docker-compose`) will not work with this version. You can check this [guide](https://www.howtogeek.com/devops/how-to-upgrade-to-docker-compose-v2/) on how to upgrade.

## Kubernetes instructions

To deploy Easytrade in kubernetes you need to have:

- `kubectl` tool installed
  - here's a [guide](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) on how to get it
- `kubeconfig` to access the cluster you want to deploy it on
  - more info on it [here](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/)

```bash
# first create the namespace for it
kubectl create namespace easytrade

# then use the manifests to deploy
kubectl -n easytrade apply -f ./kubernetes-manifests

# to get the ip of reverse proxy
# look for EXTERNAL-IP of frontendreverseproxy
# it may take some time before it gets assigned
kubectl -n easytrade get svc

# to delete the deployment
kubectl delete namespace easytrade
```

## Where to start

After starting easyTrade application you can:

- go to the frontend and try it out. Just go to the machines IP address, or "localhost" and you should see the login page. You can either create a new user, or use one of superusers (with easy passwords) like "demouser/demopass" or "specialuser/specialpass". Remember that in order to buy stocks you need money, so visit the deposit page first.
- go to some services swagger endpoint - you will find proper instructions in the dedicated service readmes.
- after some time go to dynatrace to configure your application and see what is going on in easyTrade - to have it work you will need an agent on the machine where you started easyTrade :P

## EasyTrade users

If you want to use easyTrade, then you will need a user. You can either:

- use the existing user - he has some preinserted data and new data is being generated from time to time:

  - login: james_norton
  - pass: pass_james_123

- create a new user - click on "Sign up" on the login page and create a new user.

> **NOTE:** After creating a new user there is no confirmation given, no email sent and you are not redirected... Just go back to login page and try to login. It should work :)

## Problem patterns

Currently there are only 2 problem patterns supported in easyTrade:

1. DbNotRespondingPlugin - after turning it on no new trades can be created as the database will throw an error. This problem pattern is kind of proof on concept that problem patterns work. Running it for around 20 minutes should generate a problem in dynatrace.

2. ErgoAggregatorSlowdownPlugin - after turning it on 2 of the aggregators will start receiving slower responses which will make them stop sending requests after some time. A potential run could take:

   - 15 min - then we will notice a small slowdown (for 150 seconds) followed by 40% lower traffic for 15 minutes on some requests
   - 20 min - then we will notice a small slowdown (for 150 seconds) followed by 40% lower traffic for 30 minutes on some requests

To turn a plugin on/off send a request similar to the following:

```sh
curl -X 'PUT' \
  'http://ENDPOINT/pluginservice/api/plugins/ErgoAggregatorSlowdownPlugin' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "enabled": VALUE
}'
```

Of course please set the value of "ENDPOINT" to the correct host IP and VALUE to false/true.

## EasyTrade on Dynatrace - how to configure

1. Go to your tenant.

2. Create a new application. You can either make it based on the traffic detected in "My web application" or just manually. The application detection rule will most probably look like this:

   - "frontendreverseproxy" - in the case of docker-compose based application
   - "111.111.111.111" - in the case of kubernetes based application
     ![Detection rules](./img/dt/1.png)

3. Go to you new application. Click on "Edit".  
   ![Edit application 1](./img/dt/2.png)
   ![Edit application 2](./img/dt/3.png)

4. Go to "Capturing" → "Async web requests and SPAs".  
   ![Async web requests and SPAs](./img/dt/4.png)

5. Turn on the capturing of "XmlHttpRequest (XHR)" and "fetch() requests".

6. Click on the save button.  
   ![Save button](./img/dt/5.png)

7. Go to "Capturing" → "User tag".  
   ![User tag detection](./img/dt/6.png)

8. Click on the "Add user tag rule".

9. Select the "Source type" as "CSS selector" and fill in the value of "CSS selector" as "label.labelPositioning".

10. Turn on the cleanup rule and set the "Regex" as "Hi,.(.\*+)".

11. Click on the save button.

## Resolve **Span Default Service** showing instead of regular .NET services

If instead of regular .NET services, like this:

![Correct dotnet service names](./img/dt/correct_dotnet_services.png)

You see **Span Default Service** for all of them, like this:

![Spand default service names](./img/dt/wrong_dotnet_services.png)

Go into `Settings -> Server-side service monitoring -> Span capturing`, and click `Add item` to add rule that ignores span with name `Microsoft.AspNetCore.Hosting.HttpRequestIn`, like so:

![Ignore ASP.NET span](./img/dt/span_ignore_rule.png)
