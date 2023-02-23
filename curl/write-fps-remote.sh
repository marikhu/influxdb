#!/bin/bash

INFLUX_API_TOKEN=7gxRqwmM3VgwWU0jKgVYjW2NZEBeASmpFUXdp8235-DxVUSLlJbD5yvMSB5JJjHGmX7uIYt9lpAaG1uK57ilYA==


response=$(curl --request POST \
"http://192.168.5.222:8086/api/v2/write?org=AIC&bucket=bma&precision=ns" \
  --header "Authorization: Token $INFLUX_API_TOKEN" \
  --header "Content-Type: text/plain; charset=utf-8" \
  --header "Accept: application/json" \
  --data-binary '
    analytic,project=bma,machine=BMA-PT1,container=bma_live-cam1,analytic=TA fps=12.4,analyticEvents=1 1677128108000000
    ')
echo "Response: " $response


#response=$(curl -s -w "%{http_code}" $URL)

#http_code=$(tail -n1 <<< "$response")  # get the last line
#content=$(sed '$ d' <<< "$response")   # get all but the last line which contains the status code

#echo "$http_code"
#echo "$content"
