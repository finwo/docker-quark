#!/usr/bin/env bash

# docker buildx build \
#   --push \
#   --platform linux/386,linux/amd64,linux/arm/v6 \
#   --tag finwo/quark:latest \
#   .

docker build \
  --tag finwo/quark:latest \
  .

docker push finwo/quark:latest
