# run with
#   docker run -ti -v /usr/local/bin:/usr/local/bin zoechi/bwu_dart_installer
#
# required to run once
#   setfacl -Rm g:staff:rwX,d:g:staff:rwX /usr/local/bin

FROM google/dart

MAINTAINER Günter Zöchbauer <gunter@gzoechbauer.com>

RUN \
  apt-get -q update && \
  DEBIAN_FRONTEND=noninteractive && \
  apt-get install --no-install-recommends -y -q \
  unzip \
  xdg-utils \
  acl

COPY bwu_dart_installer /bwu_dart_installer
RUN pub global activate -spath /bwu_dart_installer

CMD ["bash", "-x", "/root/.pub-cache/bin/dartupdate"]