#!/bin/bash

docker run -d --rm -e "DEVICE=Nexus7-5.1.1" -e GPU="off" -e "CONSOLE_PORT=5554" -p "5554:5554" -p "5555:5555" -p 6080:6080 -p 8080:8080 --net demo-net --name nexus5 --privileged --entrypoint=tail admpresales/android-emulator -f /dev/null
