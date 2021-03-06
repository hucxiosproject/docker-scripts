#!/bin/bash
source /data/env
eval $(weave proxy-env)

docker build -t vocinno/neo4j .
docker run -d \
-e NEO4J_AUTH=$NEO4J_AUTHKEY \
-e VIRTUAL_PORT=7474 \
-e VIRTUAL_HOST=$NEO4J_CHAT_VIRTUAL_HOST \
--name neo4jchat \
-v /data/volumes/neo4j_abroad_chat/data:/var/lib/neo4j/data \
-v /data/volumes/neo4j_abroad_chat/conf:/etc/neo4j \
--cap-add=SYS_RESOURCE \
vocinno/neo4j