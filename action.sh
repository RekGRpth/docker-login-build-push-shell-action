#!/bin/sh

set -eux
export BUILDKIT_STEP_LOG_MAX_SIZE=-1
export BUILDKIT_STEP_LOG_MAX_SPEED=-1
export DOCKER_BUILDKIT=1
REGISTRY_USERNAME_IMAGE_TAG="$(echo "${INPUTS_REGISTRY:-ghcr.io}/${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}/${INPUTS_IMAGE:-${GITHUB_REPOSITORY##*/}}:${INPUTS_TAG:-${GITHUB_REF##*/}}" | tr '[:upper:]' '[:lower:]')"
echo "${INPUTS_PASSWORD:-${GITHUB_TOKEN}}" | docker login --username "${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}" --password-stdin "${INPUTS_REGISTRY:-ghcr.io}"
docker build --progress=plain --tag "${REGISTRY_USERNAME_IMAGE_TAG}" .
docker push "${REGISTRY_USERNAME_IMAGE_TAG}"
