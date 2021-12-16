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
 && apt-get update \
 && apt-get install -y ca-certificates jq openssl curl \
 && curl -L --output /tmp/vegeta.tar.gz "https://github.com/tsenart/vegeta/releases/download/v${VEGETA_VERSION}/vegeta_${VEGETA_VERSION}_linux_amd64.tar.gz" \
 && (cd /bin && tar xzf /tmp/vegeta.tar.gz) \
 && rm /tmp/vegeta.tar.gz \
 && apt-get clean

CMD [ "/bin/vegeta", "-help" ]
