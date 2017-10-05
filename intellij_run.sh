#!/bin/bash

cd
HOMEDIR=$(pwd)

#docker run -it --rm \
#--name intellij \
#-v /tmp/.X11-unix:/tmp/.X11-unix \
#-v ${HOMEDIR}/.m2:/home/intellij/.m2 \
#-v ${HOMEDIR}/IdeaProjects_docker:/home/intellij/IdeaProjects \
#-e DISPLAY=unix$DISPLAY \
#--net "host" \
#-p 8824:8824 \
#-p 5095:5095 \

docker run -d --name intellij \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${HOMEDIR}/.IdeaIC2017.2:/root/.IdeaIC2017.2 \
-v ${HOMEDIR}/IdeaProjects_docker:/root/IdeaProjects \
-e DISPLAY=unix$DISPLAY \
--net "host" -p 8824:8824 admpresales/intellij:1.1.2.0
