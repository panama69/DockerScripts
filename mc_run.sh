#!/bin/bash

docker run -d --hostname mc.aos.com --name mc --net demo-net -p 8084:8080 --shm-size=2g admpresales/mc:2.51_di
