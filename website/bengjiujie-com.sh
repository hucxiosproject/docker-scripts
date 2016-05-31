#!/bin/bash
source /data/env
eval $(weave proxy-env)
docker run -d --name www-vocinno-com \
-e VIRTUAL_HOST=$BENGJIUJIE_VIRTUAL_HOST \
-v /data/www/bengjiujie:/usr/local/apache2/htdocs \
httpd:2.4
