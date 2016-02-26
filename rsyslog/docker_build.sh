#!/bin/sh
VERSION=0.0.1
REPOSITORY_PREFIX=zoechi
NAME=rsyslog

#docker pull $(awk '/^FROM[ \t\r\n\v\f]/ { print /:/ ? $2 : $2":latest" }' Dockerfile)
echo "Building $REPOSITORY_PREFIX/$NAME:$VERSION"
docker build $1 -t $REPOSITORY_PREFIX/$NAME image
docker tag $REPOSITORY_PREFIX/$NAME $REPOSITORY_PREFIX/$NAME:$VERSION
