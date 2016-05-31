#!/bin/bash
source /data/env
eval $(weave proxy-env)
docker run -d \
	-v /data:/data \
	-p 8888:8888 -p 3369:3369/udp \
	--name btsync aostanin/btsync
