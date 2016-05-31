FROM elasticsearch
ADD elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
RUN /usr/share/elasticsearch/bin/plugin install elasticsearch/marvel/latest
RUN /usr/share/elasticsearch/bin/plugin install elasticsearch/elasticsearch-analysis-smartcn/2.7.0
