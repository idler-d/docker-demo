#!/bin/bash

echo "update nexus host to registry service."
docker service update -d \
--host-add nexus.idler.com:192.168.225.137 \
jenkins_jenkins

