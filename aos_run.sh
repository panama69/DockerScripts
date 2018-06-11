#!/bin/bash

IMAGE_POSTGRES=`grep "aos-postgres " env|awk '{print $2}'`
IMAGE_ACCTSERVICE=`grep "aos-accountservice " env|awk '{print $2}'`
IMAGE_MAIN=`grep "aos-main-app " env|awk '{print $2}'`
echo -e "Starting AOS using images: \n\t${IMAGE_POSTGRES}\n\t${IMAGE_ACCTSERVICE}\n\t${IMAGE_MAIN}"

docker run -d -p 5432:5432 --name aos_postgres --hostname aosdb.aos.com --net demo-net ${IMAGE_POSTGRES}

docker run -p 8001:8080 --name aos_accountservice --hostname aosaccount.aos.com -e "POSTGRES_PORT=5432" -e "POSTGRES_IP=aos_postgres" -e "MAIN_PORT=8000" -e "ACCOUNT_PORT=8001" -e 'MAIN_IP=nimbusserver.aos.com' -e "ACCOUNT_IP=nimbusserver.aos.com" -e "PGPASSWORD=admin" --net demo-net -d ${IMAGE_ACCTSERVICE}

docker run -p 8000:8080 --name aos_main --hostname aosweb.aos.com -e "POSTGRES_PORT=5432" -e "POSTGRES_IP=aos_postgres" -e "MAIN_PORT=8000" -e "ACCOUNT_PORT=8001" -e 'MAIN_IP=nimbusserver.aos.com' -e "ACCOUNT_IP=nimbusserver.aos.com" -e "PGPASSWORD=admin" --net demo-net -d ${IMAGE_MAIN}
