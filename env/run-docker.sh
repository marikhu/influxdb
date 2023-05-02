docker run -it --rm \
	--name logfps \
        -v /sys/devices/virtual/dmi:/sys/devices/virtual/dmi:ro \
        -v /dev/disk/by-uuid:/dev/disk/by-uuid:ro \
        -e TZ=Asia/Bangkok \
        -v /media/marikhu/work/GitHub/influxdb:/influxdb \
        -w /influxdb \
	logfps:latest \
	bash
