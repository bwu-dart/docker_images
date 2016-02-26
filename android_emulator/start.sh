#!/bin/bash
docker run --privileged -it \
 -v ~/dart/docker/android_emulator/project:/workspace \
 -v ~/.gradle/:/root/.gradle \
 dyhpoon/android-emulator-21 start-emulator \
 "./gradlew connectedAndroidTest"
