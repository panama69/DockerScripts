#!/bin/bash

docker exec devops bash -c "git init --bare /GitRepo/oscillating"

##
## Need to cd to the dir of the local project
##

git remote add origin ssh://root@nimbusserver:9022/GitRepo/oscillating

