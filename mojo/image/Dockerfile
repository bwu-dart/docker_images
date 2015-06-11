FROM library/ubuntu:vivid

#Add multiverse repo
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ vivid multiverse" | tee -a /etc/apt/sources.list
# RUN apt-get -y update
# RUN apt-get -y dist-upgrade

RUN \
  apt-get -q update && \
  apt-get install --no-install-recommends -y -q \
    ca-certificates \
    git-core \
    git-svn \
    subversion \
    python \
    python-dev \
    python-pip \
    subversion \
    lsb-release \
    sudo \
    dialog

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
RUN apt-get install --no-install-recommends -y -q \
    ttf-mscorefonts-installer


#    gcc-arm-linux-gnueabihf  gcc-4.8-multilib gcc-4.8-multilib-arm-linux-gnueabihf \ # see https://code.google.com/p/chromium/issues/detail?id=435056

#RUN apt-get install --no-install-recommends -y -q subversion

# Google depot_tools
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH /depot_tools:$PATH

RUN mkdir /mojo
WORKDIR /mojo
RUN fetch --nohooks mojo
WORKDIR /mojo/src
RUN ./build/install-build-deps.sh --no-prompt --no-arm # workaround for https://code.google.com/p/chromium/issues/detail?id=435056
RUN ./build/install-build-deps.sh --no-prompt

WORKDIR /mojo
RUN gclient runhooks
WORKDIR /mojo/src
RUN mojo/tools/mojob.py gn
#RUN mojo/tools/mojob.py build
RUN ninja -C out/Debug -j 10
CMD ["out/Debug/mojo_shell", "mojo:spinning_cube"]

# see https://blog.jessfraz.com/post/docker-containers-on-the-desktop/ for
# how to run with X
