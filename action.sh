#!/bin/sh

set -eux
env | sort
REGISTRY_USERNAME_IMAGE_TAG="$(echo "${INPUTS_REGISTRY}/${INPUTS_USERNAME}/${INPUTS_IMAGE:-${GITHUB_REPOSITORY##*/}}:${INPUTS_TAG:-${GITHUB_REF##*/}}" | tr '[:upper:]' '[:lower:]')"
docker login --username "${INPUTS_USERNAME}" --password "${INPUTS_PASSWORD}" "${INPUTS_REGISTRY}"
docker build --progress=plain --tag "${REGISTRY_USERNAME_IMAGE_TAG}" .
docker push "${REGISTRY_USERNAME_IMAGE_TAG}"
