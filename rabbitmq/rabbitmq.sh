#!/bin/bash

source /data/env
eval $(weave proxy-env)

docker run -d \
	-p 5672:5672 \
	--hostname rabbit \
	--name rabbit \
	-v /data/volumes/rabbitmq:/var/lib/rabbitmq \
	rabbitmq:3
