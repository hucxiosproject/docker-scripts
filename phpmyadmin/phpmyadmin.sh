#!/bin/bash
source /data/env
eval $(weave proxy-env)

docker run -d --name phpmyadmin \
--link mysql:mysql \
-e VIRTUAL_HOST=$PHPMYADMIN_VIRTUAL_HOST \
nazarpc/phpmyadmin
