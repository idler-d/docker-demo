#!/bin/bash

function uninstall () {
  echo "remove mysql network, secret and config files to proxy service."
  docker service update -d \
      --network-rm mysql_default \
      --config-rm lb_mysql.conf \
      lb_proxy
}

function install () {
  echo "update mysql network, secret and config files to proxy service."
  docker service update -d \
    --network-add mysql_default \
    --config-add source=lb_mysql.conf,target=/etc/nginx/conf.d/steam/mysql.nginx.conf \
    lb_proxy
}


if [ $# -gt 0 -a $1 == "uninstall" ] ; then
  uninstall
else
  uninstall
  install
fi