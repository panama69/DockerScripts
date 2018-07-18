#!/bin/bash

# 8824 - port for the brower agent to talk with LFT.  Without this port, you won't be able to use the OIC.

IDEA="IdeaProjects_docker"
PRODUCT="intellij"
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

# if the folder doesn't exist, create it so it is owned by the user
if [ ! -d "${HOME}/${IDEA}" ]
then
	mkdir ${HOME}/${IDEA}
fi

if [ ! -d "${HOME}/.m2" ]
then
        mkdir ${HOME}/.m2
fi

# -v ${HOME}/.m2:/home/demo/.m2 \
# -v ${HOME}/${IDEA}:/home/demo/IdeaProjects \
#-e LFT_LIC_SERVER=nimbusserver -e LFT_LIC_ID=23078 -e LFT_LIC_ID_VERSION=1 -e VERBOSE=true \

docker run -d --name intellij \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${HOME}/.m2:/home/demo/.m2 \
-v ${HOME}/${IDEA}:/home/demo/IdeaProjects \
-e DISPLAY=unix$DISPLAY \
-e LFT_LIC_SERVER=nimbusserver -e LFT_LIC_ID=23078 -e LFT_LIC_ID_VERSION=1 -e VERBOSE=true \
--net "host" -p 5095:5095 -p 8824:8824 ${IMAGE}


