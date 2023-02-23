#!/bin/bash

INFLUX_API_TOKEN=wnkbA0w5G6jeWv0fJ6KAYj2NB9u7IpDwavixltFyAqjZn7kqK7L1A041PWLdofITt7kZUrc6ljEtNUmMKrNWRA==


curl --request POST \
"http://localhost:8086/api/v2/write?org=Nubtse&bucket=nubtse&precision=ns" \
  --header "Authorization: Token $INFLUX_API_TOKEN" \
  --header "Content-Type: text/plain; charset=utf-8" \
  --header "Accept: application/json" \
  --data-binary '
    airSensors,sensor_id=TLM0201 temperature=73.97038159354763,humidity=35.23103248356096,co=0.48445310567793615 1630424257000000000
    airSensors,sensor_id=TLM0202 temperature=75.30007505999716,humidity=35.651929918691714,co=0.5141876544505826 1630424257000000000
    '

