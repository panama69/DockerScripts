#!/bin/bash

PRODUCT="devops"
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

docker run -d -p 8090:8080 -p 8091:80 -p 50000:50000 -p 9022:22 \
--name devops --hostname devops.aos.com --net demo-net ${IMAGE}
