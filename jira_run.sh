#!/bin/bash

#   cptactionhank/atlassian-jira-software:7.6.3
docker run --name jira --hostname jira.aos.com \
   --net demo-net --detach --publish 9090:8080 \
   cptactionhank/atlassian-jira-software:7.8.0

