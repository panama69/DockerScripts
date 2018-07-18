#!/bin/bash

show_usage() {
  echo "Usage:"
  echo "  pull.sh <file>"
  echo "  "
  echo "  The file contains the list of docker images to be pulled using the format:"
  echo "    myenvname americas/octane:myTag"
}

show_login_message() {
  echo "Please make sure you are logged in using:"
  echo "docker login"
}

# check if a file name was passed to pull all the images
# this could be enhanced to check to see if the file exists
# and/or make use of the env file as the default if nothing passed
if [ $# -ne 1 ]
then
  show_usage
  exit 1
fi

# Check if user has logged in to docker already.  If they have not
# exit and have them login first
LOGGEDIN=`sudo cat ~/.docker/config.json|grep "https://index.docker.io/v1/"|wc -l`
if [ ${LOGGEDIN} -ne 1 ]
then
  show_login_message
  exit 1
fi

IFS=$'\n'       # make newlines the only separator
set -f          # disable globbing
# the grep explained:
#  -v - invert so get all lines that do not match the expression
#  ^# - say lines that start with #
#  ^$ - says blank lines
for i in $(cat < "$1"|grep -v "^#\|^$"); do
  IMAGE="$(cut -d' ' -f2 <<<"$i")"
  echo "Pulling: ${IMAGE}"
  docker pull ${IMAGE}
done
