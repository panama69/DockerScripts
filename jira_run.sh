#!/bin/bash

#-v /home/demo/atlassian/jira:/var/atlassian/jira -v /home/demo/atlassian/logs:/opt/atlassian/jira/logs \
#-v /home/demo/atlassian/jira:/var/atlassian/jira \
#-v /var/atlassian/jira:/var/atlassian/jira -v /opt/atlassian/jira \
#docker run --name jira --hostname jira.aos.com --net demo-net -d -p 8080:8080 -v /home/demo/jira:/var/Atlassian/jira -v /home/demo/jiralogs:/opt/Atlassian/jira/logs cptactionhank/Atlassian-jira-software:7.53

docker run --name jira --hostname jira.aos.com --net demo-net -d -p 8080:8080 \
-v /home/demo/jira:/var/Atlassian/jira -v /home/demo/jiralogs:/opt/Atlassian/jira/logs \
cptactionhank/atlassian-jira-software:7.5.3
