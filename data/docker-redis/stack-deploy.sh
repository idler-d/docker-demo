#!/bin/bash
docker-compose build sentinel
docker-compose -f docker-compose.yml -f docker-compose.stack.yml config > docker-stack.yml
docker stack deploy -c docker-stack.yml --with-registry-auth cache
