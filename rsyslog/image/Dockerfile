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
    rsyslog \
    apt-utils \
    net-tools \
    sudo \
    procps \
    telnet


ADD ./rsyslog.conf /etc/rsyslog.conf
ADD ./start_service.sh /start_service.sh

EXPOSE 514
EXPOSE 514/udp

RUN \
  rm -rf /var/lib/apt/lists/* && \
  echo "alias la='ls -lahFLH --color --group-directories-first'" >> /root/.bashrc && \
  echo "PROMPT_COMMAND='PS1=\"\[\e]0;\W\007\e[38;5;69m\]\u@\h \[\e[38;5;36m\]\w\n\[\e[38;5;222m\]\[\e[38;5;47m\] $$\[\e[0m\] \"'" >> /root/.bashrc

CMD []
ENTRYPOINT ["/start_service.sh"]
