#!/bin/sh
OLD_VERSION=$(dart --version 2>&1)
docker run --rm -ti -v /usr/local/bin:/usr/local/bin zoechi/bwu_dart_installer
echo "Dart update from ${OLD_VERSION}" to
dart --version
