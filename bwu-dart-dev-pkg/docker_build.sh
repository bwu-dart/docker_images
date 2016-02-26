#!/bin/sh
VERSION=1.9.0-dev.4.0
#1.8.0-dev.4.6
REPOSITORY_PREFIX=zoechi
NAME=bwu-dart-dev-pkg
docker pull $(awk '/^FROM[ \t\r\n\v\f]/ { print /:/ ? $2 : $2":latest" }' Dockerfile)
cp /home/zoechi/source/dart/my/bwu_pub/bwu_model/pubspec.yaml .
echo "Building $REPOSITORY_PREFIX/$NAME:$VERSION"
docker build --no-cache=true -t $REPOSITORY_PREFIX/$NAME .
docker tag $REPOSITORY_PREFIX/$NAME $REPOSITORY_PREFIX/$NAME:$VERSION 
