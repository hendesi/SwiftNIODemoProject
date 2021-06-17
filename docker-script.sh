#!/bin/sh
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t hendesi/master-thesis "/Users/felixdesiderato/Documents/Test" --push
# mkdir docker
# cd docker
# docker save deploy.123:latest | gzip > deploy.123.tar.gz
