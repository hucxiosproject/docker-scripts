#!/bin/bash

source /data/env
eval $(weave proxy-env)

docker run --name=postgresql-teamcity -d \
	-e DB_NAME=teamcity \
	-e DB_USER=teamcity \
	-e DB_PASS=teamcity \
	-v /data/volumes/teamcity/postgresql:/var/lib/postgresql \
	sameersbn/postgresql:9.4

docker run --link postgresql-teamcity:postgres \
	-e VIRTUAL_HOST=$TEAMCITY_VIRTUAL_HOST \
	--name teamcity \
	-v /data/volumes/teamcity/teamcity:/var/lib/teamcity \
	-d sjoerdmulder/teamcity:latest
