#!/bin/bash

function install () {
 sed -i '/registry.group.idler.com/d' /etc/hosts
 echo "${master_host}" >> /etc/hosts
 curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s https://registry.group.idler.com
}

function isIp () {
  if [[ "$1" =~ ^([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$ ]];then
    return 1
  else
    return 0
  fi
}

if [ $# == 1 ] ; then
  isIp "$1"
  if [ "$?" == "1" ] ; then
    master_host="$1 registry.group.idler.com"
    install
  else
    echo "$1 not a ip"
    exit 0
  fi
else
  echo "usage \"mirror.sh ip\", eg. mirror.sh 192.168.40.80"
fi