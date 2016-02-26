FROM zoechi/mojo

COPY preseed.txt /preseed.txt

RUN debconf-set-selections -v /preseed.txt

RUN \
  apt-get -q update && \
  apt-get install --no-install-recommends -y -q \
    binutils \
    mesa-utils \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget --progress=dot:giga http://us.download.nvidia.com/XFree86/Linux-x86_64/340.76/NVIDIA-Linux-x86_64-340.76.run && \
  chmod +x NVIDIA-Linux-x86_64-340.76.run && \
  ./NVIDIA-Linux-x86_64-340.76.run -a -N --ui=none --no-kernel-module && \
  rm NVIDIA-Linux-x86_64-340.76.run

