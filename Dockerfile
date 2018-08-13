FROM alpine:latest
LABEL original maintainer="Jason Wilder <mail@jasonwilder.com>"
LABEL fork maintainer="Andrey Zaplotnikov <thedronzik@gmail.com>"

RUN apk -U add openssl

ENV VERSION 0.7.3
ENV DOWNLOAD_URL https://github.com/thedronzik/docker-gen/releases/download/$VERSION/docker-gen-alpine-linux-amd64-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN wget -qO- $DOWNLOAD_URL | tar xvz -C /usr/local/bin

ENTRYPOINT ["/usr/local/bin/docker-gen"]
