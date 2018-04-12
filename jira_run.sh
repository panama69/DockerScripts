#!/bin/bash

IMAGE=`grep "jira " env|awk '{print $2}'`
echo -e "Starting image: \n\t${IMAGE}"

#   cptactionhank/atlassian-jira-software:7.6.3
#   cptactionhank/atlassian-jira-software:7.8.0
docker run --name jira --hostname jira.aos.com \
   --net demo-net --detach --publish 9090:8080 \
   ${IMAGE}

