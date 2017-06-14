#!/bin/bash

n=ELK_kibana
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	--add-host="elasticsearch:127.0.0.1" \
       	docker.elastic.co/kibana/kibana:5.4.1

echo Visit http://localhost:5601
