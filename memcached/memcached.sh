#!/bin/bash
eval $(weave proxy-env)
docker run -d --name memcached \
-p 11211:11211 memcached
