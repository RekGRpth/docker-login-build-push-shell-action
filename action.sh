#!/bin/sh

set -eux
REGISTRY_USERNAME_IMAGE_TAG="$(echo "${INPUTS_REGISTRY:-ghcr.io}/${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}/${INPUTS_IMAGE:-${GITHUB_REPOSITORY##*/}}:${INPUTS_TAG:-${GITHUB_REF##*/}}" | tr '[:upper:]' '[:lower:]')"
echo "${INPUTS_PASSWORD:-${GITHUB_TOKEN}}" | docker login --username "${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}" --password-stdin "${INPUTS_REGISTRY:-ghcr.io}"
docker build --progress=plain --tag "${REGISTRY_USERNAME_IMAGE_TAG}" $(env | grep -E '^DOCKER_' | grep -v ' ' | sort -u | sed 's@^@--build-arg @g' | paste -s -d ' ') --file "${INPUTS_DOCKERFILE:-Dockerfile}" .
docker push "${REGISTRY_USERNAME_IMAGE_TAG}"
