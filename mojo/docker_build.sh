#!/bin/sh
VERSION=$(date +"%Y%m%d")
#1.8.0-dev.4.6
REPOSITORY_PREFIX=zoechi
NAME=mojo
echo $VERSION
exit
#docker pull $(awk '/^FROM[ \t\r\n\v\f]/ { print /:/ ? $2 : $2":latest" }' Dockerfile)
echo "Building $REPOSITORY_PREFIX/$NAME:$VERSION"
docker build $1 -t $REPOSITORY_PREFIX/$NAME .
docker tag $REPOSITORY_PREFIX/$NAME $REPOSITORY_PREFIX/$NAME:$VERSION
