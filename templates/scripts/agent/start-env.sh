#!/usr/bin/env bash
set -euo pipefail

CHANGE_ID="${1:?Usage: start-env.sh <change-id> [run-id]}"
RUN_ID="${2:-$(date -u +%Y%m%dT%H%M%SZ)}"
RUN_ROOT=".agent/runs/${CHANGE_ID}/${RUN_ID}"

mkdir -p "${RUN_ROOT}/artifacts/browser" "${RUN_ROOT}/logs" "${RUN_ROOT}/browser/profile"

# Simple deterministic allocation for a first implementation. Replace with a
# real lease/registry before running enough parallel Changes to create collisions.
APP_PORT=$((43000 + CHANGE_ID % 1000))
API_PORT=$((44000 + CHANGE_ID % 1000))
CHROME_DEBUG_PORT=$((45000 + CHANGE_ID % 1000))

cat > .agent/run.env <<EOF2
AGENT_CHANGE_ID=${CHANGE_ID}
AGENT_RUN_ID=${RUN_ID}
APP_PORT=${APP_PORT}
API_PORT=${API_PORT}
CHROME_DEBUG_PORT=${CHROME_DEBUG_PORT}
CHROME_USER_DATA_DIR=${RUN_ROOT}/browser/profile
ARTIFACT_DIR=${RUN_ROOT}/artifacts
LOG_DIR=${RUN_ROOT}/logs
EOF2

echo "Wrote .agent/run.env"
cat .agent/run.env
