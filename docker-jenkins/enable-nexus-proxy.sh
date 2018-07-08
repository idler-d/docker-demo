#!/bin/bash



function uninstall () {
  echo "remove nexus host to registry service."
  docker service update -d \
      --host-rm nexus.idler.com
      jenkins_jenkins
}

function install () {
  echo "update nexus host to registry service."
  docker service update -d \
    --host-add nexus.idler.com:192.168.225.5 \
    jenkins_jenkins
}

if [ $# -gt 0 -a $1 == "uninstall" ] ; then
  uninstall
else
  uninstall
  install
fi