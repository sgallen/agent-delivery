#!/usr/bin/env bash
set -euo pipefail

if ! command -v gh >/dev/null; then
  echo "gh CLI is required" >&2
  exit 1
fi

create_label() {
  local name="$1"
  local description="$2"
  local color="$3"
  gh label create "$name" --description "$description" --color "$color" --force >/dev/null
}

create_label "state:proposed" "Change identified but not yet shaped" "D4C5F9"
create_label "state:shaped" "Intent, resolution paths, and boundaries are being made ready" "C5DEF5"
create_label "state:ready" "Ready for the approved workflow to begin" "0E8A16"
create_label "state:running" "Implementation, investigation, or experiment is active" "1D76DB"
create_label "state:proving" "Required gates, evidence, and actuals are being resolved" "5319E7"
create_label "state:decision" "Evidence is ready for an accountable disposition" "FBCA04"
create_label "state:resolved" "Delivered, decision, or administrative resolution is complete" "2CBE4E"
create_label "state:blocked" "Cannot proceed without a resolved blocker" "B60205"
create_label "state:paused" "Execution is deliberately paused and resumable" "D4C5F9"
create_label "state:abandoned" "Closed without sufficient evidence or accountable resolution" "6A737D"

create_label "resolution:delivered" "Resolution class: delivered capability" "0E8A16"
create_label "resolution:decision" "Resolution class: evidence-backed non-landed decision" "5319E7"
create_label "resolution:administrative" "Resolution class: accountable external closure" "FBCA04"
create_label "resolution:unresolved-loss" "Resolution class: unresolved loss" "B60205"

for disposition in \
  accepted \
  experiment-concluded \
  hypothesis-rejected \
  technically-infeasible \
  stopped-at-resource-gate \
  superseded \
  deprioritized \
  rejected-at-review \
  cancelled-external \
  abandoned-without-resolution; do
  create_label "disposition:${disposition}" "Final Change disposition: ${disposition}" "DDEBF7"
done

create_label "agent:eligible" "The orchestrator may claim this Change" "0E8A16"
create_label "agent:claimed" "An agent run currently owns this Change" "1D76DB"
create_label "agent:needs-decision" "Agent work is ready for an accountable disposition" "FBCA04"
create_label "agent:blocked" "Agent run requires intervention" "B60205"

create_label "risk:low" "Bounded, observable, and easy to reverse" "C2E0C6"
create_label "risk:medium" "Material impact or specialist review required" "FEF2C0"
create_label "risk:high" "High consequence, difficult to reverse, or sensitive" "F9D0C4"

for type in bug feature refactor docs design test chore experiment investigation; do
  create_label "type:${type}" "Change type: ${type}" "DDEBF7"
done

for profile in docs-only low-risk-ui backend-change refactor security-sensitive; do
  create_label "gate:${profile}" "Gate profile: ${profile}" "BFDADC"
done

create_label "resource:checkpoint" "Soft resource threshold or material reforecast requires a checkpoint" "F9D0C4"
create_label "resource:decision-needed" "Execution is preserved and waiting for an accountable resource decision" "B60205"
create_label "value-review:due" "A scheduled post-release initiative value review is due" "FBCA04"
create_label "decision-value-review:due" "A scheduled review of a non-release initiative decision is due" "FBCA04"

echo "Agent Delivery labels created or updated."
