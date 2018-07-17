#!/bin/bash

master_host='192.168.40.80 registry.group.idler.com'

function install () {
if cat /etc/hosts | grep "${master_host}">/dev/null
    then
      echo "hosts master_host exist"
    else
      echo "${master_host}" >> /etc/hosts
  fi
  curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s https://registry.group.idler.com

}

install

#sed -r "${master_host}/d"  filename