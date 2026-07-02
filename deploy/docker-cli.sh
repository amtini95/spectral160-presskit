#!/bin/bash
# Docker helper for non-interactive SSH sessions (avoids locked macOS keychain
# by using the default context socket and a credential-free docker config).
set -euo pipefail

export PATH="/Applications/Docker.app/Contents/Resources/bin:${PATH}"
export DOCKER_HOST="unix:///var/run/docker.sock"

DC="${HOME}/macmini-vps/docker/.docker-nocreds"
mkdir -p "${DC}"
printf '%s\n' '{"auths":{}}' > "${DC}/config.json"

exec docker --config "${DC}" "$@"
