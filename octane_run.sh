#!/bin/bash

# -e DISABLE_VALIDATOR_MEMORY=true \

docker run -d -p 1099:1099 -p 8085:8080 -p 9081:9081 -p 9082:9082 \
--name octane --hostname octane.aos.com --net demo-net --shm-size=2g \
-e OCTANE_HOST=nimbusserver.aos.com \
 -e DISABLE_VALIDATOR_MEMORY=TRUE \
admpresales/octane:12.55.7.84_dis
