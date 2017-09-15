#!/bin/bash

SERVER_IP=$(grep -i 'DockerServer' /etc/hosts | awk '{print $1}' | sort --unique)

docker run -d --name sv-db --network demo-net admpresales/sv-db:latest

docker run -d --name sv-server -e SV_SERVER_AGENT_PORTS=7000-7019 -e SV_USER=demo -e SV_PASSWORD=Password1 -e SV_GROUPS="SVM Users,SV Server Administrators" --network demo-net -p 6085:6085 -p 7000-7019:7000-7019 -h $SERVER_IP -v /etc/hpe-sv-server/ -v /var/log/hpe-sv-server/ -v /var/lib/hpe-sv-server/ -v /var/cache/hpe-sv-server/ admpresales/sv-server

docker run -d --name sv-svm --network demo-net -p 6086:6086 -h $SERVER_IP --volumes-from sv-server admpresales/sv-svm
