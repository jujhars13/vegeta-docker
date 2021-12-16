FROM debian:bullseye-slim

ENV VEGETA_VERSION 12.8.4

LABEL \
  maintainer="Jujhar Singh <mail@jujhar.com>" \
  org.opencontainers.image.title="vegeta w/ debian" \
  org.opencontainers.image.description="Docker image for the Vegeta HTTP load testing tool." \
  org.opencontainers.image.authors="Jujhar Singh <mail@jujhar.com>" \
  org.opencontainers.image.url="https://github.com/jujhars13/vegeta-docker" \
  org.opencontainers.image.vendor="https://jujhar.com" \
  org.opencontainers.image.licenses="MIT" \
  app.tag="vegeta$VEGETA_VERSION"

RUN set -ex \
 && apk add --no-cache ca-certificates jq \
 && apk add --no-cache --virtual .build-deps \
    openssl \
 && wget -q "https://github.com/tsenart/vegeta/releases/download/v${VEGETA_VERSION}/vegeta_${VEGETA_VERSION}_linux_amd64.tar.gz" -O /tmp/vegeta.tar.gz \
 && cd bin \
 && tar xzf /tmp/vegeta.tar.gz \
 && rm /tmp/vegeta.tar.gz \
 && apk del .build-deps

CMD [ "/bin/vegeta", "-help" ]
