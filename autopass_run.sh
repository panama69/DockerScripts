#!/bin/bash

PRODUCT="autopass"
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

docker run --name autopass --hostname autopass.aos.com --net demo-net -p 5814:5814 --ip=172.50.10.10 --restart=always -d ${IMAGE} 
