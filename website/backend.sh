#!/bin/bash
source /data/env
eval $(weave proxy-env)
docker run -d --name backend \
-e VIRTUAL_HOST=$BACKEND_VIRTUAL_HOST \
-v /data/www/backend:/var/www/html \
php:5.6-apache
