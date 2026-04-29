#!/bin/bash
set -e
cd coupon-hub-api
kubectl apply -f coupon-hub-configmap.yaml -ndih
kubectl apply -f coupon-hub-deploy.yaml -ndih
kubectl apply -f coupon-hub-svc.yaml -ndih


