#!/bin/bash
source /data/env
eval $(weave proxy-env)
docker run -d --name client \
-e VIRTUAL_HOST=$CLIENT_VIRTUAL_HOST \
-v /data/www/client:/var/www/html \
php:5.6-apache
