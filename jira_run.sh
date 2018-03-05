#!/bin/bash

docker run --name jira --hostname jira.aos.com \
   --net demo-net --detach --publish 8080:8080 \
   cptactionhank/atlassian-jira-software:7.6.3

