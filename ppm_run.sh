#!/bin/bash

PRODUCT="ppm"
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

docker run --name ppm -d --shm-size=2g \
   --hostname=ppm.aos.com -p 8087:8080 -p 1098:1099 \
   --net demo-net --add-host nimbusserver.aos.com:172.50.0.1 --ip 172.50.10.20 
   ${IMAGE}

