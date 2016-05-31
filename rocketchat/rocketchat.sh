#!/bin/bash
source /data/env
eval $(weave proxy-env)

docker run -d --name rocketchat \
	-e MONGO_URL=mongodb://$ROCKETCHAT_MONGO_WEAVEHOST/rocketchat \
	-e ROOT_URL=http://$ROCKETCHAT_VIRTUAL_HOST \
	-e VIRTUAL_HOST=$ROCKETCHAT_VIRTUAL_HOST \
	rocketchat/rocket.chat
