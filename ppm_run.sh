#!/bin/bash

if [[ $# -gt 0 ]]
then
   IMAGE=$1
else
   IMAGE=`grep "ppm " env|awk '{print $2}'`
fi
echo -e "Starting image: \n\t${IMAGE}"

docker run --name ppm -d --shm-size=2g \
   --hostname=ppm.aos.com -p 8087:8080 -p 1098:1099 \
   --net demo-net --add-host nimbusserver.aos.com:172.50.0.1 --ip 172.50.10.20 
   ${IMAGE}

