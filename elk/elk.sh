#!/bin/bash
source /data/env

docker rm -f elk
sudo docker run \
  -p 5601:5601 \
  -p 9200:9200 \
  -p 5044:5044 \
  -p 5000:5000 \
  -v /data/elk:/var/lib/elasticsearch \
  -v /data/elk/logstash:/etc/logstash/conf.d \
  -it --name elk sebp/elk
