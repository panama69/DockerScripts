#!/bin/bash


IDEA="IdeaProjects_docker"

# if the folder doesn't exist, create it so it is owned by the user
if [ ! -d "${HOME}/${IDEA}" ]
then
	mkdir ${HOME}/${IDEA}
fi

if [ ! -d "${HOME}/.m2" ]
then
        mkdir ${HOME}/.m2
fi

docker run -d --name intellij \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${HOME}/.m2:/home/demo/.m2 \
-v ${HOME}/${IDEA}:/home/demo/IdeaProjects \
-e DISPLAY=unix$DISPLAY \
--net "host" -p 8824:8824 -p 5095:5095 admpresales/intellij:1.1.2.2
