#!/bin/bash

PRODUCT="alm"
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

docker run -d \
   -p 8082:8080 -p 1521:1521 \
   --name alm --hostname alm.aos.com --net demo-net --shm-size=2g \
   ${IMAGE}
