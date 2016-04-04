FROM google/debian:jessie

MAINTAINER Günter Zöchbauer <gunter@gzoechbauer.com>

RUN echo "deb http://ftp.de.debian.org/debian/ jessie main non-free contrib" >> /etc/apt/sources.list

RUN \
  apt-get -q update && \
  DEBIAN_FRONTEND=noninteractive && \
  apt-get install --no-install-recommends -y -q \
    curl \
    git \
    git-core \
    # npm \ 1.4.21 but requires >= 3.5.3 < 4.0.0
    # nodejs \ 0.10.29 but requires >=5.4.1 < 6.0.0
    apt-transport-https \
    ca-certificates \
    make \
    build-essential \
    g++ && \
  apt-get upgrade -y

RUN \
  curl -sL https://deb.nodesource.com/setup_5.x | bash - && \
  apt-get install -y nodejs

RUN \
  sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
  # Set up the location of the stable repository.
  sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive && \
  apt-get install --no-install-recommends -y -q \
    dart/stable

ENV DART_SDK /usr/lib/dart
ENV PATH $DART_SDK/bin:$PATH

RUN git clone --recursive https://github.com/angular/angular.git

WORKDIR /angular


RUN \
  npm install bower -g && \
  npm install tsd -g

RUN \
  npm install && \
  bower --allow-root install && \
  cd tools && npm install && tsd install && \
  cd ../modules/angular2 && npm install && tsd install

RUN node --max-old-space-size=4096 $(npm bin)/gulp build  # --projects=angular2,benchpress,bundle_deps

# docker run -ti -v $(pwd)/dist:/angular/dist zoechi/angular_build sh
# node --max-old-space-size=4096 $(npm bin)/gulp build
# creates the build output in $(pwd)/dist
