#!/bin/bash

IMAGE=`grep "mc " env|awk '{print $2}'`
echo -e "Starting image: \n\t${IMAGE}"

docker run -d --hostname mc.aos.com --name mc --net demo-net -p 8084:8084 --shm-size=2g ${IMAGE}
