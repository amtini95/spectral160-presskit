#!/bin/bash
# One-time setup on the Mac mini (run as serverpibes).
set -euo pipefail

REPO_DIR="${HOME}/macmini-vps/docker/spectral160-presskit"
DOCKER="/Applications/Docker.app/Contents/Resources/bin/docker"
PLIST="${REPO_DIR}/deploy/com.spectral160.autodeploy.plist"
LA="${HOME}/Library/LaunchAgents/com.spectral160.autodeploy.plist"

chmod +x "${REPO_DIR}/deploy/auto-deploy.sh"
mkdir -p "${HOME}/Library/LaunchAgents" "${HOME}/Library/Logs"

cp "${PLIST}" "${LA}"
launchctl unload "${LA}" 2>/dev/null || true
launchctl load -w "${LA}"

cd "${REPO_DIR}"
"${DOCKER}" compose up -d --build

echo "OK: container running on http://127.0.0.1:8080"
echo "OK: auto-deploy LaunchAgent loaded (checks GitHub every 2 min)"
