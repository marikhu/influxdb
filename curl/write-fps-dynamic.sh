#!/bin/bash

INFLUX_API_TOKEN=wnkbA0w5G6jeWv0fJ6KAYj2NB9u7IpDwavixltFyAqjZn7kqK7L1A041PWLdofITt7kZUrc6ljEtNUmMKrNWRA==
#TIMESTAMP=`date +%s%6N`
TIMESTAMP=`date +%s`
echo "TIMESTAMP: " $TIMESTAMP
FPS=$(shuf -i 10-15 -n1)
echo "FPS: " $FPS

sCommand="curl --request POST \
	\"http://localhost:8086/api/v2/write?org=Nubtse&bucket=nubtse&precision=s\" \
  	--header \"Authorization: Token $INFLUX_API_TOKEN\" \
  	--header \"Content-Type: text/plain; charset=utf-8\" \
  	--header \"Accept: application/json\" \
  	--data-binary ' analytic,project=bma,machine=BMA-PT1,container=bma_live-cam1,analytic=TA fps=$FPS,analyticEvents=1 $TIMESTAMP '"
echo $sCommand
response=`eval "$sCommand"`
#response=$($sCommand)
echo "Response: " $response

