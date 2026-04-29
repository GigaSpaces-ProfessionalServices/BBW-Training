#!/bin/bash
set -e
cd coupon-hub-api
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 mvn clean package -DskipTests

docker build -t localhost:32000/coupon-hub-api:1.0 .
docker push localhost:32000/coupon-hub-api:1.0
