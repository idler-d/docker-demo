#!/bin/bash

function uninstall () {
  echo "remove nexus host to registry service."
  docker service update -d \
      --host-rm nexus.idler.com \
      --host-rm registry.idler.com \
      --host-rm registry.group.idler.com \
      --host-rm docker.idler.com \
      --secret-rm lb_domain.group.crt \
      --secret-rm lb_domain.group.key \
#      --secret-rm jenkins_ca.pem \
#      --secret-rm jenkins_cert.pem \
#      --secret-rm jenkins_key.pem \
      jenkins_jenkins
}

function install () {
  echo "update nexus host to registry service."
  docker service update -d \
    --host-add nexus.idler.com:192.168.225.5 \
    --host-add registry.idler.com:192.168.225.5 \
    --host-add registry.group.idler.com:192.168.225.5 \
    --host-add docker.idler.com:192.168.225.5 \
    --secret-add source=lb_domain.crt,target=/etc/docker/certs.d/registry.idler.com/ca.crt \
    --secret-add source=lb_domain.group.crt,target=/etc/docker/certs.d/registry.group.idler.com/ca.crt \
#    --secret-add source=jenkins_ca.pem,target=/var/jenkins_home/.docker/ca.pem \
#    --secret-add source=jenkins_cert.pem,target=/var/jenkins_home/.docker/cert.pem \
#    --secret-add source=jenkins_key.pem,target=/var/jenkins_home/.docker/key.pem \
    jenkins_jenkins
}

if [[ $# -gt 0 && "$1" == "uninstall" ]] ; then
  uninstall
else
  uninstall
  install
fi