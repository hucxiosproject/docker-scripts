#!/bin/bash
source /data/env
eval "$(weave env)"


mkdir -p /data/volumes/rethinkdb
docker stop rethinkdb
docker rm rethinkdb
docker run -d \
	-P \
	-v /data/volumes/rethinkdb:/data \
	-e VIRTUAL_PORT=8080 \
	-e VIRTUAL_HOST="$RETHINK_DB_ADMIN" \
	--name rethinkdb \
	tokyo.vocinno.com/rethinkdb

