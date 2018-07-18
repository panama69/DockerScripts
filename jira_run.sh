#!/bin/bash

PRODUCT="jira"
if [[ $# -gt 0 ]]
then
   IMAGE=$1
else
   if [ `grep "^${PRODUCT} " env| wc -l` -eq 1 ]
   then
      IMAGE=`grep "^${PRODUCT} " env|awk '{print $2}'`
   else
      echo "Your env file contains multiple entires for ${PRODUCT}"
      exit 1
   fi
fi
echo -e "Starting image: \n\t${IMAGE}"

#   cptactionhank/atlassian-jira-software:7.6.3
#   cptactionhank/atlassian-jira-software:7.8.0
docker run --name jira --hostname jira.aos.com \
   --net demo-net --detach --publish 9090:8080 \
   ${IMAGE}

