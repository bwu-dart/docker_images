#!/bin/sh
VERSION=1.9.0-dev.4.0
#1.8.0-dev.4.6
REPOSITORY_PREFIX=zoechi
NAME=bwu-dart-dev-pkg

docker_build.sh

echo "Push $REPOSITORY_PREFIX/$NAME:$VERSION"
docker push $REPOSITORY_PREFIX/$NAME 

