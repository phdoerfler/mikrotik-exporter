#!/usr/bin/env bash
set -e
set -x

DIR=`pwd`
NAME=`basename ${DIR}`
SHA=`git rev-parse --short HEAD`
VERSION=${VERSION:-$SHA}

mkdir -p dist/armhf
GOOS=linux GOARCH=arm go build . -o dist/armhf

docker build -t nshttpd/${NAME}:${VERSION}-armhf -f Dockerfile.armhf .
docker push nshttpd/${NAME}:${VERSION}-armhf

rm mikrotik-exporter
