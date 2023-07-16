# Vegeta Docker on Debian

[![](https://images.microbadger.com/badges/image/jujhars13/vegeta.svg)](https://microbadger.com/images/jujhars13/vegeta)

[![CircleCI](https://circleci.com/gh/jujhars13/vegeta-docker/tree/main.svg?style=svg)](https://circleci.com/gh/jujhars13/vegeta-docker/tree/main)

Docker image for the [Vegeta](https://github.com/tsenart/vegeta) HTTP load testing tool forked from [peter-evans/vegeta](https://hub.docker.com/r/peterevans/vegeta) to give us extra Debian based debug tools.

## Supported tags and respective `Dockerfile` links

- [`v1.2`, `latest`, `v1.2-vegeta12.9.0-bookworm-slim`, (*v1.2/Dockerfile*)](https://github.com/jujhars13/vegeta-docker/tree/v1.2/Dockerfile)
- [`v1.1`, `v1.1-vegeta12.8.4-bullseye-slim`, (*v1.1/Dockerfile*)](https://github.com/jujhars13/vegeta-docker/tree/v1.1/Dockerfile)
- [`v1.0`, `v1.0-vegeta12.8.4-bullseye-slim`, (*v1.0/Dockerfile*)](https://github.com/jujhars13/vegeta-docker/tree/v1.0/Dockerfile)

## Usage

To display help:

```bash
docker run --rm -i jujhars13/vegeta
```

Example:

```bash
docker run --rm -i jujhars13/vegeta \
/bin/bash -c \
  "echo 'GET http://www.example.com' | \
    vegeta attack -rate=10 -duration=30s | \
    tee results.bin | \
    vegeta report"
```

For full documentation see [Vegeta](https://github.com/tsenart/vegeta).

## Usage in Kubernetes

To display help:

```bash
kubectl run vegeta --rm --attach --restart=Never --image="jujhars13/vegeta"
```

Example:

```bash
kubectl run vegeta --rm --attach --restart=Never --image="jujhars13/vegeta" -- sh -c \
"echo 'GET http://<svc-name>' | \
    vegeta attack -rate=10 -duration=30s | \
    tee results.bin | \
    vegeta report"
```

## History

- 2022-02-14 `v1.1` version bump to pull in latest security updates to Debian 11 Bullseye

## License

MIT License - see the [LICENSE](LICENSE) file for details
