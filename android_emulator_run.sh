#!/bin/bash

if [[ $# -gt 0 ]]
then
   IMAGE=$1
else
   IMAGE=`grep "android-emulator " env|awk '{print $2}'`
fi
echo -e "Starting image: \n\t${IMAGE}"

docker run -d --rm \
   -e "DEVICE=Nexus7-5.1.1" -e GPU="off" -e "CONSOLE_PORT=5554" \
   -p "5554:5554" -p "5555:5555" -p 6080:6080 -p 8080:8080 \
   --name nexus5 --net demo-net --privileged ${IMAGE}
