#!/bin/bash
source /data/env
eval "$(weave proxy-env)"

docker rm -f wordpress
docker run --name wordpress \
  -v /data/volumes/wordpress:/data \
  --link mysql:mysql \
  -e VIRTUAL_HOST="wordpress.captain.bengjiujie.com" \
  -e WORDPRESS_DB_USER="root" \
  -e WORDPRESS_DB_PASSWORD="vocinno1234" \
  -d wordpress
