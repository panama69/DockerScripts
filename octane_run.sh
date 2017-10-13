#!/bin/bash

docker run -d -p 1099:1099 -p 8085:8080 -p 9081:9081 -p 9082:9082 --name octane --hostname octane.aos.com --net demo-net -e OCTANE_HOST=nimbusserver.aos.com --shm-size=2g admpresales/octane:12.55.6.67_dis
