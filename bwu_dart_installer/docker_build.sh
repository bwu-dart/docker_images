#!/bin/sh
VERSION=$(date +"%Y%m%d")
#1.8.0-dev.4.6
REPOSITORY_PREFIX=zoechi
NAME=bwu_dart_installer
cd image
#docker pull $(awk '/^FROM[ \t\r\n\v\f]/ { print /:/ ? $2 : $2":latest" }' Dockerfile)
echo "Building $REPOSITORY_PREFIX/$NAME:$VERSION"
docker build --no-cache -t $REPOSITORY_PREFIX/$NAME .
docker tag -f $REPOSITORY_PREFIX/$NAME $REPOSITORY_PREFIX/$NAME:$VERSION
