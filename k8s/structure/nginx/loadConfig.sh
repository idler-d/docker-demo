#!/bin/bash

cd `dirname $0`
kubectl delete configmap confnginx
kubectl delete configmap confnginxfornexus
kubectl create configmap confnginx --from-file conf/nginx.conf
kubectl create configmap confnginxfornexus --from-file conf/nexus.nginx.conf