#!/bin/bash

source ./utils/constants/vars.sh

RunWithSwarm() {
    export NGINX_REPO=${NGINX_REPO}
    export NGINX_VERSION=${NGINX_VERSION}
    export APP_URL=${APP_URL}
    [ -f "docker-swarm.tmp.yml" ] && rm docker-swarm.tmp.yml
    envsubst < docker-swarm.yml > docker-swarm.tmp.yml
    docker build --build-arg APP_URL=$APP_URL -t $NGINX_REPO:$NGINX_VERSION -f nginx/Dockerfile.swarm ./nginx && docker push $NGINX_REPO:$NGINX_VERSION && docker stack deploy -c docker-swarm.tmp.yml app --with-registry-auth
}

RunWithSwarm