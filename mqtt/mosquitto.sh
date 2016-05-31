#!/bin/bash
docker build -t vocinno/mosquitto .
docker run -d \
    --name mosquitto \
    -e VIRTUAL_HOST=$MOSQUITTO_HOST \
    -p 1883:1883 \
    vocinno/mosquitto