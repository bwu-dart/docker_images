#!/usr/bin/env bash

docker run -ti --rm -e DISPLAY=$DISPLAY --privileged  zoechi/mojo /bin/bash
# docker run -ti --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --privileged  zoechi/mojo /bin/bash

# see https://blog.jessfraz.com/post/docker-containers-on-the-desktop/ for
# how to run with X
# xhost +
# out/Debug/mojo_shell mojo:spinning_cube

## docker run -ti --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --privileged --net=host zoechi/mojo /bin/bash
# docker run -ti --rm -e DISPLAY=$DISPLAY --privileged --net=host zoechi/mojo /bin/bash
