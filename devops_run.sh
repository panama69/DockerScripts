#!/bin/bash

SERVER_IP=$(grep 'DockerServer' /etc/hosts | awk '{print $1}')
CLIENT_IP=$(grep 'DockerClient' /etc/hosts | awk '{print $1}')

docker run -d -p 8090:8080 -p 50000:50000 -p 9022:22 --name devops --hostname devops.aos.com --net demo-net \
--add-host DockerServer.aos.com:$SERVER_IP --add-host DockerServer:$SERVER_IP --add-host DockerClient:$CLIENT_IP \
admpresales/devops
