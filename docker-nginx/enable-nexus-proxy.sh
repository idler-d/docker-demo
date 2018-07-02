#!/bin/bash

#echo "remove old registry secret and config files from proxy service."
#docker service update -d \
#--config-rm registry.nginx.conf \
#--secret-rm registry.password \
#--secret-rm domain.crt \
#--secret-rm domain.key \
#lb_proxy
#
#echo "remove old registry secret and config files"
#docker config rm registry.nginx.conf lb_proxy
#docker secret rm egistry.password domain.crt domain.key lb_proxy
#
#echo "add registry network to proxy service."
#docker service update -d --network-add dockerhub_default lb_proxy

echo "update nexus network, secret and config files to proxy service."
docker service update -d \
--network-add nexus_default \
--config-add source=lb_nexus.conf,target=/etc/nginx/conf.d/nexus.nginx.conf \
lb_proxy