#!/bin/sh
VERSION=1-2.1.1
#1.8.0-dev.4.6
REPOSITORY_PREFIX=zoechi
NAME=google-datastore-local-development-server

#docker pull $(awk '/^FROM[ \t\r\n\v\f]/ { print /:/ ? $2 : $2":latest" }' Dockerfile)
echo "Building $REPOSITORY_PREFIX/$NAME:$VERSION"
docker build -f image/Dockerfile -t $REPOSITORY_PREFIX/$NAME .
docker tag -f $REPOSITORY_PREFIX/$NAME $REPOSITORY_PREFIX/$NAME:$VERSION
