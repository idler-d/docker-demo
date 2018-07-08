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
    --config-rm lb_registry.group.conf \
    --secret-rm lb_domain.group.crt \
    --secret-rm lb_domain.group.key \
    lb_proxy
}

function install () {
  echo "update registry network, secret and config files to proxy service."
  docker service update -d \
    --network-add nexus_default \
    --secret-add source=lb_domain.group.crt,target=/etc/nginx/certs/domain.group.crt \
    --secret-add source=lb_domain.group.key,target=/etc/nginx/certs/domain.group.key \
    --config-add source=lb_registry.group.conf,target=/etc/nginx/conf.d/registry.group.nginx.conf \
    lb_proxy
}


if [ $# -gt 0 -a $1 == "uninstall" ] ; then
  uninstall
else
  uninstall
  install
fi

