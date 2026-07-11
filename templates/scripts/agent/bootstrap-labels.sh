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
create_label "state:shaped" "Intent and boundaries are being made ready" "C5DEF5"
create_label "state:ready" "Ready for the approved workflow to begin" "0E8A16"
create_label "state:running" "Implementation or investigation is active" "1D76DB"
create_label "state:proving" "Required gates and evidence are running" "5319E7"
create_label "state:review" "Ready for required builder judgment" "FBCA04"
create_label "state:released" "Merged or released according to policy" "2CBE4E"
create_label "state:blocked" "Cannot proceed without a resolved blocker" "B60205"
create_label "state:cancelled" "Deliberately stopped or rejected" "6A737D"

create_label "agent:eligible" "The orchestrator may claim this Change" "0E8A16"
create_label "agent:claimed" "An agent run currently owns this Change" "1D76DB"
create_label "agent:needs-review" "Agent work is ready for required review" "FBCA04"
create_label "agent:blocked" "Agent run requires intervention" "B60205"

create_label "risk:low" "Bounded, observable, and easy to reverse" "C2E0C6"
create_label "risk:medium" "Material impact or specialist review required" "FEF2C0"
create_label "risk:high" "High consequence, difficult to reverse, or sensitive" "F9D0C4"

for type in bug feature refactor docs design test chore exploration; do
  create_label "type:${type}" "Change type: ${type}" "DDEBF7"
done

for profile in docs-only low-risk-ui backend-change refactor security-sensitive; do
  create_label "gate:${profile}" "Gate profile: ${profile}" "BFDADC"
done

echo "Agent Delivery labels created or updated."
