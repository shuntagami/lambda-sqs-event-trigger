# lambda-sqs-event-trigger

## What

When messages sent to SQS, Lambda Consumer triggered, and upload message body to S3. That's it!

## Requirements

Terraform, node v16.19.0

## Build

```
$ npm run build
```

## Deploy

```
$ cd terraform && make apply
```

## Run locally using localstack and download contents from it

```
$ docker compose up -d localstack
$ ./aws/buckets.sh
$ npm run local
$ curl -O http://localhost:4566/shuntagami-demo-data/sample/test.txt
```

## License

MIT
