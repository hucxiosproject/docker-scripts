#!/bin/bash

source /data/env
eval $(weave proxy-env)

docker build -t elasticsearch .
DATADIR="/data/volumes/elasticsearch"

docker run -d \
	-e VIRTUAL_HOST=$ELASTICSEARCH_VIRTUAL_HOST \
	-e VIRTUAL_PORT=$ELASTICSEARCH_VIRTUAL_PORT \
	-p 9200:9200 \
	-p 9300:9300 \
	--name elasticsearch \
	-v $DATADIR:/data \
	elasticsearch \
	/usr/share/elasticsearch/bin/elasticsearch -Des.config=/usr/share/elasticsearch/config/elasticsearch.yml

