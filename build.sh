#!/bin/bash

# bash lib
source ./lib.sh

# contants:
dockerfile=./Dockerfile
builder_name=test_builder


log "Build ARM container with current Dockerfile."

log "Check docker environments:"
if [[ $(docker buildx version) =~ ^github.com/docker/buildx* ]];
then
    log "Docker \"buildx\" command existed, continue..."
else
    error "Need docker buildx command, please install and set up properly."
    exit 1
fi

log "Creae builder:${builder_name}"
docker buildx create --name ${builder_name}
docker buildx use ${builder_name}

log "Build images for arm64"
docker buildx build --platform linux/amd64 -t alpine-amd64 --load .

log "Run built image and show kernel information:"
docker run alpine-arm64 uname -a

log "Build docker image by Dockerfile:${dockerfile}"



log "Exit."
exit 0