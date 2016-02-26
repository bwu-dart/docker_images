FROM google/debian:wheezy

MAINTAINER Günter Zöchbauer <guenter@gzoechbauer.com>

ENV DEBIAN_FRONTEND noninteractive


RUN \
  # this forces dpkg not to call sync() after package extraction and speeds up install
  echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
  # we don't need and apt cache in a container
  echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
  apt-get -q update && \
  DEBIAN_FRONTEND=noninteractive && \
  echo exit 101 > /usr/sbin/policy-rc.d && \
  chmod +x /usr/sbin/policy-rc.d && \
  apt-get install --no-install-recommends -y -q \
    curl \
    # needed by curl
    ca-certificates \
    apt-utils \
    net-tools \
    sudo \
    procps \
    telnet

RUN curl -tlsv1 -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine && \
  chmod +x /usr/local/bin/docker-machine

RUN \
  rm -rf /var/lib/apt/lists/* && \
  echo "alias la='ls -lahFLH --color --group-directories-first'" >> /root/.bashrc && \
  echo "PROMPT_COMMAND='PS1=\"\[\e]0;\W\007\e[38;5;69m\]\u@\h \[\e[38;5;36m\]\w\n\[\e[38;5;222m\]\[\e[38;5;47m\] $$\[\e[0m\] \"'" >> /root/.bashrc

# This container is a chrooted docker-machine
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/docker-machine"]
CMD ["--version"]
