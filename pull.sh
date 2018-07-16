#!/bin/bash

LOGGEDIN=`sudo cat ~/.docker/config.json|grep "https://index.docker.io/v1/"|wc -l`

if [ ${LOGGEDIN} -ne 1 ]
then
  echo "Please make sure you are logged in using:"
  echo "docker login"
  exit
fi

IFS=$'\n'       # make newlines the only separator
set -f          # disable globbing
for i in $(cat < "$1"); do
  IMAGE="$(cut -d' ' -f2 <<<"$i")"
  echo "Pulling: ${IMAGE}"
  docker pull ${IMAGE}
done
