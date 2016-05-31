#!/bin/bash

source /data/env
eval "$(weave env)"
docker build -t vocinno/jenkins .
docker run --name=jenkins -d \
        -v /data/volumes/jenkins:/var/jenkins_home \
        -e VIRTUAL_HOST="$JENKINS_VIRTUAL_HOST" \
        -e VIRTUAL_PORT="$JENKINS_VIRTUAL_PORT" \
        vocinno/jenkins