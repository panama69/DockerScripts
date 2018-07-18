#!/bin/bash

PRODUCT="mc"
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

docker run -d --hostname nimbusserver --name mc --net demo-net -p 8084:8084 --shm-size=2g ${IMAGE}
