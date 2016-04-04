#!/bin/sh
VERSION=0.1.0
REPOSITORY_PREFIX=zoechi
NAME=google_cloud_sdk

docker_build.sh

echo 'Push $REPOSITORY_PREFIX/$NAME:$VERSION'
docker push $REPOSITORY_PREFIX/$NAME

