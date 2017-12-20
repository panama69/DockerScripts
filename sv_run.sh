#!/bin/bash

SV_TAG="4.10-beta1"
SV_DB_TAG="xe11g"

echo "Using DB: $SV_DB_TAG"
echo "Using SV: $SV_TAG"

docker run -d --name sv-db --network demo-net admpresales/sv-db:$SV_DB_TAG

docker run -d --name sv-server \
    -e SV_SERVER_AGENT_PORTS=7000-7019 \
    -e SV_USER=demo \
    -e SV_PASSWORD=Password1 \
    -e SV_GROUPS="SVM Users,SV Server Administrators" \
    --network demo-net \
    -p 6085:6085 \
    -p 7000-7019:7000-7019 \
    -h NimbusServer \
    -v /etc/hpe-sv-server/ \
    -v /var/log/hpe-sv-server/ \
    -v /var/lib/hpe-sv-server/ \
    -v /var/cache/hpe-sv-server/ \
    admpresales/sv-server:$SV_TAG

docker run -d --name sv-svm \
    --network demo-net \
    -p 6086:6086 \
    -h NimbusServer \
    --volumes-from sv-server \
    admpresales/sv-svm:$SV_TAG
