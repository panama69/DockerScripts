#!/bin/bash

SERVER_IP=$(grep 'DockerServer' /etc/hosts | awk '{print $1}')

docker run --name mc --hostname mc.aos.com --add-host DockerServer:$SERVER_IP --net demo-net -p 8084:8080 --shm-size=2g \
-d admpresales/mc
