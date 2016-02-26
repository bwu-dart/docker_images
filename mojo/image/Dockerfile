FROM library/ubuntu:vivid

#Add multiverse repo
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ vivid multiverse" | tee -a /etc/apt/sources.list
# RUN apt-get -y update
# RUN apt-get -y dist-upgrade

COPY preseed.txt /preseed.txt

RUN debconf-set-selections -v /preseed.txt

RUN \
  apt-get -q update && \
  apt-get -y dist-upgrade && \
  apt-get install --no-install-recommends -y -q \
    ca-certificates \
    file \
    git-core \
    git-svn \
    python \
    subversion \
    lsb-release \
    sudo \
    dialog \
    ttf-mscorefonts-installer  \
    module-init-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Google depot_tools
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH /depot_tools:$PATH

RUN mkdir /mojo
WORKDIR /mojo
RUN fetch --nohooks mojo
WORKDIR /mojo/src

RUN apt-get -q update && \
  apt-get install --no-install-recommends -y -q \
  libbrlapi0.6

RUN ./build/install-build-deps.sh --no-prompt --no-arm # workaround for https://code.google.com/p/chromium/issues/detail?id=435056
RUN ./build/install-build-deps.sh --no-prompt

WORKDIR /mojo
RUN gclient runhooks
RUN gclient sync
WORKDIR /mojo/src
RUN mojo/tools/mojob.py gn
#RUN mojo/tools/mojob.py build
RUN ninja -C out/Debug -j 10

# Replace 1000 with your user / group id
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer

#USER developer
#ENV HOME /home/developer

CMD ["out/Debug/mojo_shell", "mojo:spinning_cube"]
