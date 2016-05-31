#!/bin/bash
source /data/env
eval $(weave proxy-env)

docker run --name mysql -p 3306:3306 \
-v /etc/localtime:/etc/localtime \
-v /data/volumes/mysql/conf:/etc/mysql/ \
-v /data/volumes/mysql:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD -d mysql:5.5
