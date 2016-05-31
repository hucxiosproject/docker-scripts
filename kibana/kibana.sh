#!/bin/bash

source /data/env
eval $(weave proxy-env)

docker run --link elasticsearch:elasticsearch -d \
	--name kibana \
	-e VIRTUAL_HOST=$KIBANA_VIRTUAL_HOST \
	kibana
