FROM python:3-alpine

MAINTAINER Mathieu Donze <mathieu.donze@cern.ch>

#Install python and our application
RUN apk add --no-cache \
      git \
&& python3 -m pip install --upgrade pip \
&& pip3 install pyyaml \
&& git clone https://github.com/BwanaFr/minitel-server.git \
&& apk del --no-cache git \
&& rm -rf /var/cache/apk/* \
           /tmp/* \
           /var/tmp/* \
           /minitel-server/.git* \
           /minitel-server/README.md \
&& mkdir -p /pages \
&& mv /minitel-server/pages /pages

VOLUME /pages

WORKDIR /minitel-server

EXPOSE 3611/tcp 3614/tcp 3615/tcp

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ADD configuration.yaml .
ADD logging.yaml .

ENTRYPOINT ["/docker-entrypoint.sh"]
