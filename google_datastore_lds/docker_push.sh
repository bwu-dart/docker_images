#!/bin/sh
VERSION=1-2.1.1
#1.8.0-dev.4.6
REPOSITORY_PREFIX=zoechi
NAME=google-datastore-local-development-server

docker_build.sh

echo 'Push $REPOSITORY_PREFIX/$NAME:$VERSION'
docker push $REPOSITORY_PREFIX/$NAME

