#!/bin/bash

INFLUX_API_TOKEN=7gxRqwmM3VgwWU0jKgVYjW2NZEBeASmpFUXdp8235-DxVUSLlJbD5yvMSB5JJjHGmX7uIYt9lpAaG1uK57ilYA==
#TIMESTAMP=`date +%s%6N`
TIMESTAMP=`date +%s`
echo "TIMESTAMP: " $TIMESTAMP
FPS=$(shuf -i 10-15 -n1)
echo "FPS: " $FPS

sCommand="curl --request POST \
       	\"http://192.168.5.222:8086/api/v2/write?org=AIC&bucket=bma&precision=s\" \
  	--header \"Authorization: Token $INFLUX_API_TOKEN\" \
  	--header \"Content-Type: text/plain; charset=utf-8\" \
  	--header \"Accept: application/json\" \
  	--data-binary ' analytic,project=bma,machine=BMA-PT1,container=bma_live-cam1,analytic=TA fps=$FPS,analyticEvents=1 $TIMESTAMP '"
echo $sCommand
response=`eval "$sCommand"`
#response=$($sCommand)
echo "Response: " $response

