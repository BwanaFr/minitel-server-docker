FROM alpine:latest

MAINTAINER Mathieu Donze <mathieu.donze@cern.ch>

#Install python and our application
RUN apk add --no-cache \
      python3 \
      git \
&& pip3 install pyyaml \
&& git clone https://github.com/BwanaFr/minitel-server.git \
&& apk del --no-cache git \
&& rm -rf /var/cache/apk/* \
           /tmp/* \
           /var/tmp/*

WORKDIR /minitel-server

EXPOSE 3611/tcp 3614/tcp 3615/tcp

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
