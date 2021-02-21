FROM debian:buster-slim

COPY docker/bin /usr/bin/
COPY . /usr/bin/tuya-convert

RUN apt-get update \ 
&& apt-get install -y sudo iproute2 iputils-ping \
&& echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections \
&& cd /usr/bin/tuya-convert && ./install_prereq.sh \
&& mkdir -p /etc/service/tuya && cd /etc/service/tuya && ln -s /usr/bin/config.sh run

CMD ["tuya", "start"]
