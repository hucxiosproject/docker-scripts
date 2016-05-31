#!/bin/bash

source /data/env
eval $(weave proxy-env)

docker run -d \
	-p 6379:6379 \
	--hostname redis \
	--name redis \
	-v /data/volumes/redis:/data \
	redis
