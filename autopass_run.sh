#!/bin/bash

if [[ $# -gt 0 ]]
then
   IMAGE=$1
else
   IMAGE=`grep "autopass " env|awk '{print $2}'`
fi
echo -e "Starting image: \n\t${IMAGE}"

docker run --name autopass --hostname autopass.aos.com --net demo-net -p 5814:5814 --ip=172.50.10.10 --restart=always -d ${IMAGE} 
