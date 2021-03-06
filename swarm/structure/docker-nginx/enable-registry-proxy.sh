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

function uninstall () {
  echo "remove registry network, secret and config files to proxy service."
  docker service update -d \
    --network-rm nexus_default \
    --secret-rm lb_registry.password \
    --secret-rm lb_domain.crt \
    --secret-rm lb_domain.key \
    --config-rm lb_registry.conf \
    lb_proxy
}

function install () {
  echo "update registry network, secret and config files to proxy service."
  docker service update -d \
    --network-add nexus_default \
    --secret-add source=lb_registry.password,target=/etc/nginx/auth/registry.password \
    --secret-add source=lb_domain.crt,target=/etc/nginx/certs/domain.crt \
    --secret-add source=lb_domain.key,target=/etc/nginx/certs/domain.key \
    --config-add source=lb_registry.conf,target=/etc/nginx/conf.d/registry.nginx.conf \
    lb_proxy
}

if [[ $# -gt 0 && "$1" == "uninstall" ]] ; then
  uninstall
else
  uninstall
  install
fi
