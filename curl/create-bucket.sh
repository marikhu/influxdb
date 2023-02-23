#!/bin/bash
set -e

INFLUX_API_TOKEN=wnkbA0w5G6jeWv0fJ6KAYj2NB9u7IpDwavixltFyAqjZn7kqK7L1A041PWLdofITt7kZUrc6ljEtNUmMKrNWRA==

curl --request GET "http://localhost:8086/api/v2/buckets" \
    --header "Authorization: Token $INFLUX_API_TOKEN"

INFLUX_ORG_ID=27eaf34f66c7a05e
# NOTE: I got OrgID from the json from list-buckets.sh

curl --request POST \
	"http://localhost:8086/api/v2/buckets" \
	--header "Authorization: Token ${INFLUX_API_TOKEN}" \
  --header "Content-type: application/json" \
  --data '{
    "orgID": "'"${INFLUX_ORG_ID}"'",
    "name": "iot-center",
    "retentionRules": [
      {
        "type": "expire",
        "everySeconds": 0,
        "shardGroupDurationSeconds": 0
      }
    ]
  }'

