#!/bin/bash
source /data/env
eval $(weave proxy-env)
docker run -d --name www-vocinno-com \
-e VIRTUAL_HOST=$VOCINNO_VIRTUAL_HOST \
-v /data/www/vocinno:/usr/local/apache2/htdocs \
httpd:2.4
