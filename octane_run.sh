#!/bin/bash

# -e DISABLE_VALIDATOR_MEMORY=true \

IMAGE=`grep "octane " env|awk '{print $2}'`
echo -e "Starting image: \n\t${IMAGE}"

docker run -d -p 1099:1099 -p 8085:8080 -p 9081:9081 -p 9082:9082 \
--name octane --hostname octane.aos.com --net demo-net --shm-size=2g \
-e OCTANE_HOST=nimbusserver.aos.com \
 -e DISABLE_VALIDATOR_MEMORY=TRUE \
${IMAGE}
