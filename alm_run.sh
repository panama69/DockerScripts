#!/bin/bash

SERVER_IP=$(grep -i 'DockerServer' /etc/hosts | awk '{print $1}' | sort --unique)

docker run --name alm --hostname alm.aos.com --net demo-net -p 8082:8080 --shm-size=2g -d \
--add-host DockerServer:$SERVER_IP admpresales/alm