#!/bin/bash
source /data/env
eval $(weave proxy-env)

docker run -d \
-p 6080:80 -p 9306:3306 \
--name testlink \
-v /data/volumes/testlink/mysql:/var/lib/mysql \
-v /data/volumes/testlink/upload:/var/testlink/upload_area \
-e MYSQL_PASS="admin" \
-e VIRTUAL_HOST=$TESTLINK_VIRTUAL_HOST \
adeo/testlink