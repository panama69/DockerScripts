#!/bin/bash

IMAGE=`grep "alm " env|awk '{print $2}'`
echo -e "Starting image: \n\t${IMAGE}"

docker run -d \
   -p 8082:8080 -p 1521:1521 \
   --name alm --hostname alm.aos.com --net demo-net --shm-size=2g \
   ${IMAGE}
