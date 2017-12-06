#!/bin/bash

docker run -d -p 8082:8080 -p 1521:1521 --name alm --hostname alm.aos.com --net demo-net --shm-size=2g admpresales/alm:12.55_di
