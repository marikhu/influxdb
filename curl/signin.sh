#!/bin/bash
set -e

INFLUX_URL="http://localhost:8086"
INFLUX_API_TOKEN=wnkbA0w5G6jeWv0fJ6KAYj2NB9u7IpDwavixltFyAqjZn7kqK7L1A041PWLdofITt7kZUrc6ljEtNUmMKrNWRA==

curl --get "http://localhost:8086/api/v2/signin" \
    --header "Authorization: Token $INFLUX_API_TOKEN"
