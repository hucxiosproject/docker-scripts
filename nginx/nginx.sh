#!/bin/bash
source /data/env
eval $(weave env)
docker run \
	-d \
	--name nginx-proxy \
	-p 80:80 \
	-v /var/run/docker.sock:/tmp/docker.sock:ro \
	tokyo.vocinno.com/jwilder/nginx-proxy
