#!/bin/bash

docker run --name autopass --hostname autopass.aos.com --net demo-net -p 5814:5814 \
--ip=172.50.10.10 --restart=always -d admpresales/autopass
