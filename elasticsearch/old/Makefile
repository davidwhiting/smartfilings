TAG = 8.14.1
NETWORK = lawnetwork

pull:
	docker pull elasticsearch:$(TAG)

create_network:
	docker network create $(NETWORK)

run:
	docker run -d --name elasticsearch --net $(NETWORK) -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:$(TAG)

