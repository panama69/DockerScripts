#!/bin/bash

if [[ $# -gt 0 ]]
then
   IMAGE=$1
else
   IMAGE=`grep "devops " env|awk '{print $2}'`
fi
echo -e "Starting image: \n\t${IMAGE}"

docker run -d -p 8090:8080 -p 8091:80 -p 50000:50000 -p 9022:22 \
--name devops --hostname devops.aos.com --net demo-net ${IMAGE}
