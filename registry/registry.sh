#!/bin/bash

source /data/env
eval $(weave proxy-env)

docker run -d \
	-e VIRTUAL_HOST=$REGISTRY_VIRTUAL_HOST \
	-v /data/registry:/tmp/registry \
	--name registry \
	registry

