#!/bin/bash

docker run -d -p 8090:8080 -p 50000:50000 -p 9022:22 \
--name devops --hostname devops.aos.com --net demo-net admpresales/devops:1.1.2.0
