#!/bin/sh

set -eux
env | sort
REGISTRY_USERNAME_IMAGE_TAG="$(echo "${INPUTS_REGISTRY:-ghcr.io}/${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}/${INPUTS_IMAGE:-${GITHUB_REPOSITORY##*/}}:${INPUTS_TAG:-${GITHUB_REF##*/}}" | tr '[:upper:]' '[:lower:]')"
docker login --username "${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}" --password "${INPUTS_PASSWORD:-${GITHUB_TOKEN}}" "${INPUTS_REGISTRY:-ghcr.io}"
docker build --progress=plain --tag "${REGISTRY_USERNAME_IMAGE_TAG}" .
docker push "${REGISTRY_USERNAME_IMAGE_TAG}"
