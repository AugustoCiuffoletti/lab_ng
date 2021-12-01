#!/bin/bash

docker container prune -f
for id in `docker images | grep nextgen | tr -s ' ' | cut -d" " -f3`
do
	docker rmi $id
done
