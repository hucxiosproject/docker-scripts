#!/bin/bash
source /data/env
docker rm -f voc-console 
docker build -t voc-console .
docker run -d --name voc-console \
	-e VIRTUAL_HOST="$CONSOLE_VIRTUAL_HOST" \
	voc-console

