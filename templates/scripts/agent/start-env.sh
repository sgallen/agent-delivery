#!/usr/bin/env bash
set -euo pipefail

CHANGE_ID="${1:?Usage: start-env.sh <change-id> [run-id]}"
RUN_ID="${2:-$(date -u +%Y%m%dT%H%M%SZ)}"
INITIATIVE_ID="${INITIATIVE_ID:-}"
AGENT_HARNESS="${AGENT_HARNESS:-}"
WORKFLOW_VERSION="${WORKFLOW_VERSION:-}"
GATE_PROFILE="${GATE_PROFILE:-}"
ACTIVITY="${ACTIVITY:-implementation}"
DECISION_QUESTION="${DECISION_QUESTION:-}"
TRACK_RESOURCES="${TRACK_RESOURCES:-false}"
case "${TRACK_RESOURCES,,}" in
  1|true|yes|on) TRACK_RESOURCES=true ;;
  *) TRACK_RESOURCES=false ;;
esac

RUN_ROOT=".agent/runs/${CHANGE_ID}/${RUN_ID}"
RESOURCE_RECORD="${RESOURCE_RECORD:-${RUN_ROOT}/resource-use.json}"
CHANGE_RESOURCE_SUMMARY="${CHANGE_RESOURCE_SUMMARY:-.agent/changes/${CHANGE_ID}/resource-summary.yml}"

mkdir -p "${RUN_ROOT}/artifacts/browser" "${RUN_ROOT}/logs" "${RUN_ROOT}/browser/profile"

# Simple deterministic allocation for a first implementation. Replace with a
# real lease or registry before running enough parallel Changes to collide.
if [[ "${CHANGE_ID}" =~ ^[0-9]+$ ]]; then
  CHANGE_SLOT=$((CHANGE_ID % 1000))
else
  CHANGE_SLOT="$(printf '%s' "${CHANGE_ID}" | cksum | awk '{print $1 % 1000}')"
fi

APP_PORT=$((43000 + CHANGE_SLOT))
API_PORT=$((44000 + CHANGE_SLOT))
CHROME_DEBUG_PORT=$((45000 + CHANGE_SLOT))

write_env() {
  printf '%s=%q\n' "$1" "$2"
}

{
  write_env AGENT_CHANGE_ID "$CHANGE_ID"
  write_env AGENT_RUN_ID "$RUN_ID"
  write_env AGENT_GATE_PROFILE "$GATE_PROFILE"
  write_env AGENT_ACTIVITY "$ACTIVITY"
  write_env AGENT_INITIATIVE_ID "$INITIATIVE_ID"
  write_env AGENT_DECISION_QUESTION "$DECISION_QUESTION"
  write_env AGENT_HARNESS "$AGENT_HARNESS"
  write_env AGENT_WORKFLOW_VERSION "$WORKFLOW_VERSION"
  write_env AGENT_TRACK_RESOURCES "$TRACK_RESOURCES"
  if [ "$TRACK_RESOURCES" = true ]; then
    write_env AGENT_RESOURCE_RECORD "$RESOURCE_RECORD"
    write_env AGENT_CHANGE_RESOURCE_SUMMARY "$CHANGE_RESOURCE_SUMMARY"
  fi
  write_env APP_PORT "$APP_PORT"
  write_env API_PORT "$API_PORT"
  write_env CHROME_DEBUG_PORT "$CHROME_DEBUG_PORT"
  write_env CHROME_USER_DATA_DIR "${RUN_ROOT}/browser/profile"
  write_env ARTIFACT_DIR "${RUN_ROOT}/artifacts"
  write_env LOG_DIR "${RUN_ROOT}/logs"
} > .agent/run.env

echo "Wrote .agent/run.env"
cat .agent/run.env
