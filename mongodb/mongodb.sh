#!/bin/bash
source /data/env
eval $(weave env)

mkdir -p /data/volumes/mongodb
docker build -t vocinno/mongodb .
docker run -d \
	-e VIRTUAL_HOST=$MONGODB_HOST \
	-v /data/volumes/mongodb:/data/db \
	-p 27017:27017 \
	-p 28017:28017 \
	--name mongodb vocinno/mongodb
