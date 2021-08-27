#!/bin/bash
set -e

release::replace_runner_images() {
  local -r tag="$1"

  for manifest in ./manifests/implementation/runner/**/*.yaml; do
    sed -i.bak -E "s|^(              image: ghcr.io/capactio/)(.+):(.+)|\1\2:${tag}" "${manifest}"
  done

  git add .
  git commit -m "Update runner images to tag ${tag}"
}

[ -z "${RELEASE_VERSION}" ] && echo "Need to set RELEASE_VERSION" && exit 1;
[ -z "${RUNNER_IMAGES_TAG}" ] && echo "Need to set RUNNER_IMAGES_TAG" && exit 1;

SOURCE_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
RELEASE_VERSION_MAJOR_MINOR="$(echo "${RELEASE_VERSION}" | sed -E 's/([0-9]+\.[0-9])\.[0-9]/\1/g')"
RELEASE_BRANCH="release-${RELEASE_VERSION_MAJOR_MINOR}"

main() {
  release::replace_runner_images "${RUNNER_IMAGES_TAG}"

  git tag "v${RELEASE_VERSION}"
  git push origin "${SOURCE_BRANCH}"

  if [ "${RELEASE_BRANCH}" != "${SOURCE_BRANCH}" ]; then
    git checkout -B "${RELEASE_BRANCH}"
    git push "${RELEASE_BRANCH}"
  fi
}

main
