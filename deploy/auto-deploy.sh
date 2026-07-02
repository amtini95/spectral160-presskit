#!/bin/bash
# Pulls latest main from GitHub and rebuilds the Docker container when there are changes.
set -euo pipefail

REPO_DIR="${HOME}/macmini-vps/docker/spectral160-presskit"
DOCKER="/Applications/Docker.app/Contents/Resources/bin/docker"
LOG="${HOME}/Library/Logs/spectral160-deploy.log"
BRANCH="${SPECTRAL160_BRANCH:-main}"

mkdir -p "$(dirname "${LOG}")"

if [[ ! -d "${REPO_DIR}/.git" ]]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') missing repo at ${REPO_DIR}" >> "${LOG}"
  exit 1
fi

cd "${REPO_DIR}"
git fetch origin "${BRANCH}" --quiet

LOCAL="$(git rev-parse HEAD)"
REMOTE="$(git rev-parse "origin/${BRANCH}")"

if [[ "${LOCAL}" == "${REMOTE}" ]]; then
  exit 0
fi

git pull --ff-only origin "${BRANCH}"
"${DOCKER}" compose up -d --build --remove-orphans

echo "$(date '+%Y-%m-%d %H:%M:%S') deployed ${REMOTE}" >> "${LOG}"
