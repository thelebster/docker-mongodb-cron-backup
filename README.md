An example of running a simple [mongodb backup](https://docs.mongodb.com/manual/reference/program/mongodump) service as a cron job in a docker container.

Copy `example.env` to `.env`.

```
cp example.env .env
```

Replace with a real credentials.

```
MONGODB_DATABASE=mongo
MONGODB_HOST=127.0.0.1
MONGODB_PORT=27017
MONGODB_USERNAME=root
MONGODB_PASSWORD=password
MONGODB_AUTH_DATABASE=admin
CRON_EXPRESSION=0 * * * *
LOCAL_PATH=/var/mongo/backups
DESTINATION_PATH=/var/mongo/backups
```

Check the https://crontab.guru to find more crontab expressions.

```
docker-compose build

docker-compose up -d
```
