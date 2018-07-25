#!/bin/bash

PRODUCT="da"
if [[ $# -gt 0 ]]
then
   IMAGE=$1
else
   if [ `grep "^${PRODUCT} " env| wc -l` -eq 1 ]
   then
      IMAGE=`grep "^${PRODUCT} " env|awk '{print $2}'`
   else
      echo "Your env file contains multiple entires for ${PRODUCT}"
      exit 1
   fi
fi
echo -e "Starting image: \n\t${IMAGE}"
echo "open in a browser http://nimbusserver.aos.com:8089/da"

docker run -d -p 8089:8080 -p 7918:7918 --name da --net demo-net ${IMAGE}
