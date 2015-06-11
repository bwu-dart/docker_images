#!/bin/sh
VERSION=$(date +"%Y%m%d")
#1.8.0-dev.4.6
REPOSITORY_PREFIX=zoechi
NAME=mojo

docker_build.sh

echo 'Push $REPOSITORY_PREFIX/$NAME:$VERSION'
docker push $REPOSITORY_PREFIX/$NAME

