#!/bin/bash

if [[ $# -gt 0 ]]
then
   IMAGE=$1
else
   IMAGE=`grep "da " env|awk '{print $2}'`
fi
echo -e "Starting image: \n\t${IMAGE}"

docker run -d -p 8089:8080 -p 7918:7918 --name da --net demo-net admpresales/da-server:${IMAGE}
