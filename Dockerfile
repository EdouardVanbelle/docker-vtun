FROM debian:buster

MAINTAINER Edouard Vanbelle <edouard@vanbelle.fr>

RUN \
	echo "LANG=C" > /etc/default/locale \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get upgrade -q -y \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
		nftables iptables tcpdump iproute2 \
		vtun bridge-utils vim net-tools procps rsyslog \
	&& apt-get clean \
	&& apt-get autoclean \
	&& rm -rf /var/lib/apt/lists/*

ADD conf/default-vtun /etc/default/vtun 
ADD conf/vtun.conf    /etc/vtund.conf 
ADD scripts/start.sh  /start.sh

EXPOSE 5055/tcp 5055/udp

ENTRYPOINT [ "/bin/bash", "/start.sh" ]

