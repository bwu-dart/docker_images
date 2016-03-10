#!/bin/sh
VERSION=0.1.2
REPOSITORY_PREFIX=zoechi
NAME=dart-sass

docker_build.sh

echo 'Push $REPOSITORY_PREFIX/$NAME:$VERSION'
docker push $REPOSITORY_PREFIX/$NAME

