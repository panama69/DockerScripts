#!/bin/bash

SERVER_IP=$(grep -i 'DockerServer' /etc/hosts | awk '{print $1}' | sort --unique)

docker run --name octane --hostname octane.aos.com --net demo-net -p 8085:8080 --add-host DockerServer:$SERVER_IP --add-host DockerServer.aos.com:$SERVER_IP \
--shm-size=2g -d -p 9081:9081 -p 9082:9082 -p 1099:1099 admpresales/octane