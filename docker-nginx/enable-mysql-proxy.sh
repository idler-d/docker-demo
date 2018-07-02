#!/bin/bash

echo "update mysql network, secret and config files to proxy service."
docker service update -d \
--network-add mysql_default \
--config-add source=lb_mysql.conf,target=/etc/nginx/conf.d/steam/mysql.nginx.conf \
lb_proxy