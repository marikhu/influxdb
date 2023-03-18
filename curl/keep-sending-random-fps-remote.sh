#!/bin/bash
set -e

for i in $(seq 1 1 1000)
do
	printf $i
	sh write-fps-remote.sh
	sleep 5
done

