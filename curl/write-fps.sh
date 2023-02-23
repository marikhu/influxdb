#!/bin/bash

INFLUX_API_TOKEN=wnkbA0w5G6jeWv0fJ6KAYj2NB9u7IpDwavixltFyAqjZn7kqK7L1A041PWLdofITt7kZUrc6ljEtNUmMKrNWRA==


curl --request POST \
"http://localhost:8086/api/v2/write?org=Nubtse&bucket=nubtse&precision=ns" \
  --header "Authorization: Token $INFLUX_API_TOKEN" \
  --header "Content-Type: text/plain; charset=utf-8" \
  --header "Accept: application/json" \
  --data-binary '
    analytic,project=bma,machine=BMA-PT1,container=bma_live-cam1,analytic=TA fps=12.4,analyticEvents=1 1677128108000000
    '
