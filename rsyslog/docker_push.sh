#!/bin/sh
VERSION=0.0.1
REPOSITORY_PREFIX=zoechi
NAME=rsyslog

docker_build.sh

echo 'Push $REPOSITORY_PREFIX/$NAME:$VERSION'
docker push $REPOSITORY_PREFIX/$NAME

