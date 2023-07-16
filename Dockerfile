FROM debian:bookworm-slim as build

ENV VEGETA_VERSION 12.9.0

WORKDIR /tmp

RUN apt-get update \
 && apt-get install --no-install-recommends -y ca-certificates jq openssl curl \
 && curl -L --output /tmp/vegeta.tar.gz "https://github.com/tsenart/vegeta/releases/download/v${VEGETA_VERSION}/vegeta_${VEGETA_VERSION}_linux_amd64.tar.gz" \
 && tar xzf /tmp/vegeta.tar.gz

FROM debian:bookworm-slim as final

LABEL \
  maintainer="Jujhar Singh <mail@jujhar.com>" \
  org.opencontainers.image.title="vegeta w/ debian" \
  org.opencontainers.image.description="Docker image for the Vegeta HTTP load testing tool." \
  org.opencontainers.image.authors="Jujhar Singh <mail@jujhar.com>" \
  org.opencontainers.image.url="https://github.com/jujhars13/vegeta-docker" \
  org.opencontainers.image.vendor="https://jujhar.com" \
  org.opencontainers.image.licenses="MIT" \
  app.tag="vegeta$VEGETA_VERSION"

COPY --from=build /tmp/vegeta /bin

CMD [ "/bin/vegeta", "-help" ]
