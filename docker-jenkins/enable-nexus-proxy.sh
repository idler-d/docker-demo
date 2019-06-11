#!/bin/bash

function uninstall () {
  echo "remove nexus host to registry service."
  docker service update -d \
      --host-rm nexus.idler.com \
      --host-rm registry.idler.com \
      --host-rm registry.group.idler.com \
      --secret-rm lb_domain.group.crt \
      --secret-rm lb_domain.group.key \
      jenkins_jenkins
}

function install () {
  echo "update nexus host to registry service."
  docker service update -d \
    --host-add nexus.idler.com:192.168.225.5 \
    --host-add registry.idler.com:192.168.225.5 \
    --host-add registry.group.idler.com:192.168.225.5 \
    --secret-add source=lb_domain.crt,target=/etc/docker/certs.d/registry.idler.com/ca.crt \
    --secret-add source=lb_domain.group.crt,target=/etc/docker/certs.d/registry.group.idler.com/ca.crt \
    jenkins_jenkins
}

if [[ $# -gt 0 && "$1" == "uninstall" ]] ; then
  uninstall
else
  uninstall
  install
fi