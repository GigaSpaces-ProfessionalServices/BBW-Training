# Coupon Hub API service demo

## Swagger endpoint

In local environment, open in browser
http://localhost:8175/coupon-hub/swagger-ui/index.html#

## Building a Docker image

Use java 17

```shell
mvn clean package spring-boot:repackage
docker build -t coupon-hub-service .
```

## For dev testing

```shell
curl http://localhost:8175/coupon-hub/coupons/BR2GYG88Y4T4VSTTKA6
curl http://localhost:8175/coupon-hub/coupons\?emailId\=RIVER1869393373@GMAIL.COM
```