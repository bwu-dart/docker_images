#!/bin/sh
VERSION=0.1.0
REPOSITORY_PREFIX=zoechi
NAME=google_cloud_sdk

echo "Building $REPOSITORY_PREFIX/$NAME:$VERSION"
docker build -f image/Dockerfile -t $REPOSITORY_PREFIX/$NAME .
docker tag -f $REPOSITORY_PREFIX/$NAME $REPOSITORY_PREFIX/$NAME:$VERSION
