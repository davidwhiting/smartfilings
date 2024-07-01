#!/bin/bash

export ELASTIC_PASSWORD="smartfilings"  # password for "elastic" username
export KIBANA_PASSWORD="smartfilings"   # Used _internally_ by Kibana, must be at least 6 characters long

TAG = 8.14.1
NETWORK = lawnetwork
ELASTIC_PASSWORD = "smartfilings"
KIBANA_PASSWORD = "smartfilings"

docker pull elasticsearch:$TAG
docker network create $NETWORK

# docker run -d \
#    --name elasticsearch \
#    --net $(NETWORK) \
#    -p 9200:9200 -p 9300:9300 \
#    -e "discovery.type=single-node" \
#    elasticsearch:$(TAG)

docker run -p 127.0.0.1:9200:9200 -d \
  --name elasticsearch \
  --network $NETWORK \
  -e ELASTIC_PASSWORD=$(ELASTIC_PASSWORD) \
  -e "discovery.type=single-node" \
  -e "xpack.security.http.ssl.enabled=false" \
  -e "xpack.license.self_generated.type=trial" \
  elasticsearch:$(TAG)
