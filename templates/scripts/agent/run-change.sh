#!/usr/bin/env bash
set -euo pipefail

ISSUE="${1:?Usage: run-change.sh <github-issue-number>}"
BASE_BRANCH="${BASE_BRANCH:-main}"
BRANCH="agent/issue-${ISSUE}"
WORKTREE_ROOT="${WORKTREE_ROOT:-../$(basename "$PWD").worktrees}"
WORKTREE="${WORKTREE_ROOT}/issue-${ISSUE}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
STARTED_AT="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

INITIATIVE_ID="${INITIATIVE_ID:-}"
GATE_PROFILE="${GATE_PROFILE:-}"
ACTIVITY="${ACTIVITY:-implementation}"
DECISION_QUESTION="${DECISION_QUESTION:-}"
AGENT_NAME="${AGENT_NAME:-}"
AGENT_HARNESS="${AGENT_HARNESS:-}"
WORKFLOW_VERSION="${WORKFLOW_VERSION:-}"

# Resource records are useful, but they are not required for the first credible
# Change. Enable them with TRACK_RESOURCES=true.
TRACK_RESOURCES="${TRACK_RESOURCES:-false}"
case "${TRACK_RESOURCES,,}" in
  1|true|yes|on) TRACK_RESOURCES=true ;;
  *) TRACK_RESOURCES=false ;;
esac

# Optional formal-resolution metadata. Repositories that do not use the full
# analytical model can leave these empty.
RESOLUTION_INTENT="${RESOLUTION_INTENT:-${RESOLUTION_MODE:-}}"
EXPECTED_RESOLUTION_CLASS="${EXPECTED_RESOLUTION_CLASS:-}"
EXPECTED_DISPOSITION="${EXPECTED_DISPOSITION:-}"
LANDING_EXPECTATION="${LANDING_EXPECTATION:-}"
RELEASE_EXPECTATION="${RELEASE_EXPECTATION:-}"

for cmd in gh git python; do
  if ! command -v "$cmd" >/dev/null; then
    echo "$cmd is required" >&2
    exit 1
  fi
done

REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
ISSUE_URL="https://github.com/${REPO}/issues/${ISSUE}"
RUN_ROOT=".agent/runs/${ISSUE}/${RUN_ID}"
RUN_RESOURCE_RECORD="${RUN_ROOT}/resource-use.json"
CHANGE_RESOURCE_SUMMARY=".agent/changes/${ISSUE}/resource-summary.yml"

TMP_WORKPAD="$(mktemp)"
trap 'rm -f "$TMP_WORKPAD"' EXIT

cat > "$TMP_WORKPAD" <<EOF2
## Agent Workpad

### Status

\`\`\`text
state: running
last_updated: ${STARTED_AT}
run_id: ${RUN_ID}
branch: ${BRANCH}
commit:
worktree: ${WORKTREE}
environment:
gate_profile: ${GATE_PROFILE}
\`\`\`

### Outcome

Copy the observable outcome from issue #${ISSUE}.
EOF2

if [ -n "$DECISION_QUESTION" ]; then
  printf '\n- Decision question: %s\n' "$DECISION_QUESTION" >> "$TMP_WORKPAD"
fi

cat >> "$TMP_WORKPAD" <<'EOF2'
- Important boundaries: copy from the issue
- Stop conditions: copy from the issue

### Plan

- [ ] Read the Change Intent and repository guidance.
- [ ] Confirm scope, proof, stop conditions, and the required gate profile.
- [ ] Decide whether an ExecPlan is warranted.
- [ ] Implement, investigate, or experiment within scope.
- [ ] Run required gates and repair actionable failures.
- [ ] Prepare the evidence and proposed outcome.

### Current state

- Progress: starting
- Material discovery:
- Scope, risk, or approach change:
- Blocker or builder question:
- Next action: inspect the Change and repository context

### Gates and evidence

| Gate or criterion | Result | Evidence | Next action |
| --- | --- | --- | --- |
| Scope | pending |  |  |
| Targeted proof | pending |  |  |
| Required gate profile | pending |  |  |

- Tests or experiment output:
- UI, runtime, research, or benchmark evidence:
- Reviewer findings:
- Known gaps:

### Decision and handoff

- Outcome: delivered / evidence-backed decision / external closure / unresolved
- Landed: true / false / not_applicable
- Released: true / false / not_applicable
- Evidence basis:
- Decision owner:
- Remaining uncertainty:
- Final summary:
- Follow-up:
EOF2

if [ "$TRACK_RESOURCES" = true ]; then
  cat >> "$TMP_WORKPAD" <<EOF2

### Resource status — optional

- Forecast and confidence:
- Actual to date:
- Threshold state and action:
- Material variance:
- Run record: \`${RUN_RESOURCE_RECORD}\`
- Change summary: \`${CHANGE_RESOURCE_SUMMARY}\`
- Data gaps:
EOF2
fi

cat >> "$TMP_WORKPAD" <<EOF2

### Run history — optional

| Run | Contribution | Outcome |
| --- | --- | --- |
| ${RUN_ID} | in progress |  |

### Learning checkpoint

> What should become easier, safer, faster, or easier to judge next time?

- Durable improvement:
EOF2

WORKPAD_ID="$(gh api "repos/${REPO}/issues/${ISSUE}/comments" --paginate --jq '.[] | select(.body | startswith("## Agent Workpad")) | .id' | head -n 1 || true)"

if [ -z "$WORKPAD_ID" ]; then
  echo "Creating persistent Agent Workpad comment..."
  WORKPAD_ID="$(gh api "repos/${REPO}/issues/${ISSUE}/comments" -f body="$(cat "$TMP_WORKPAD")" --jq '.id')"
else
  echo "Reusing Agent Workpad comment ${WORKPAD_ID}."
  gh api "repos/${REPO}/issues/comments/${WORKPAD_ID}" --jq '.body' > "$TMP_WORKPAD"

  python - "$TMP_WORKPAD" "$STARTED_AT" "$RUN_ID" "$BRANCH" "$WORKTREE" "$GATE_PROFILE" "$INITIATIVE_ID" "$ACTIVITY" "$DECISION_QUESTION" "$TRACK_RESOURCES" "$RUN_RESOURCE_RECORD" "$CHANGE_RESOURCE_SUMMARY" <<'PY2'
import re
import sys
from pathlib import Path

path = Path(sys.argv[1])
text = path.read_text()
started_at, run_id, branch, worktree, gate_profile = sys.argv[2:7]
initiative_id, activity, decision_question = sys.argv[7:10]
track_resources = sys.argv[10].lower() == "true"
run_record, change_summary = sys.argv[11:13]

status = {
    "state": "running",
    "last_updated": started_at,
    "run_id": run_id,
    "branch": branch,
    "commit": "",
    "worktree": worktree,
    "gate_profile": gate_profile,
}
if initiative_id:
    status["initiative_id"] = initiative_id
if activity and activity != "implementation":
    status["activity"] = activity
if decision_question:
    status["decision_question"] = decision_question

status_pattern = re.compile(r"(?ms)^### Status\s*\n\s*```text\s*\n(.*?)\n```\s*")
match = status_pattern.search(text)
if match:
    existing = []
    seen = set()
    for line in match.group(1).splitlines():
        if ":" not in line:
            existing.append(line)
            continue
        key, current_value = line.split(":", 1)
        key = key.strip()
        current_value = current_value.strip()
        if key in status:
            # Do not erase an accountable candidate resolution written by an
            # earlier run. Unknown fields are preserved untouched.
            existing.append(f"{key}: {status[key]}".rstrip())
            seen.add(key)
        else:
            existing.append(line)
    for key, value in status.items():
        if key not in seen:
            existing.append(f"{key}: {value}".rstrip())
    replacement = "### Status\n\n```text\n" + "\n".join(existing) + "\n```\n\n"
    text = status_pattern.sub(replacement, text, count=1)
else:
    block = "### Status\n\n```text\n" + "\n".join(
        f"{key}: {value}".rstrip() for key, value in status.items()
    ) + "\n```\n\n"
    marker = "## Agent Workpad\n"
    text = text.replace(marker, marker + "\n" + block, 1) if marker in text else marker + "\n" + block + text

if "### Decision and handoff" not in text:
    section = '''### Decision and handoff

- Outcome: delivered / evidence-backed decision / external closure / unresolved
- Landed: true / false / not_applicable
- Released: true / false / not_applicable
- Evidence basis:
- Decision owner:
- Remaining uncertainty:
- Final summary:
- Follow-up:

'''
    marker = "### Learning checkpoint"
    text = text.replace(marker, section + marker, 1) if marker in text else text + "\n" + section

if track_resources:
    if not re.search(r"(?m)^### Resource status(?:\s+—.*)?\s*$", text):
        section = f'''### Resource status — optional

- Forecast and confidence:
- Actual to date:
- Threshold state and action:
- Material variance:
- Run record: `{run_record}`
- Change summary: `{change_summary}`
- Data gaps:

'''
        marker = "### Run history"
        text = text.replace(marker, section + marker, 1) if marker in text else text + "\n" + section

    for label, value in (("Run record", run_record), ("Change summary", change_summary)):
        pattern = rf"(?mi)^- {re.escape(label)}:.*$"
        replacement = f"- {label}: `{value}`"
        if re.search(pattern, text):
            text = re.sub(pattern, replacement, text, count=1)

if "### Run history" not in text:
    section = '''### Run history — optional

| Run | Contribution | Outcome |
| --- | --- | --- |

'''
    marker = "### Learning checkpoint"
    text = text.replace(marker, section + marker, 1) if marker in text else text + "\n" + section

if f"| {run_id} |" not in text:
    # Support both the lean three-column table and older four-column tables.
    dividers = (
        "| --- | --- | --- |",
        "| --- | --- | --- | ---: |",
    )
    for divider in dividers:
        if divider in text:
            row = f"\n| {run_id} | in progress |  |"
            if divider.endswith("---: |"):
                row += "  |"
            text = text.replace(divider, divider + row, 1)
            break

path.write_text(text)
PY2
fi

WORKPAD_URL="${ISSUE_URL}#issuecomment-${WORKPAD_ID}"

mkdir -p "$WORKTREE_ROOT"
git fetch origin "$BASE_BRANCH" --prune

if [ -d "$WORKTREE" ]; then
  echo "Worktree already exists: ${WORKTREE}"
else
  if git show-ref --verify --quiet "refs/heads/${BRANCH}"; then
    git worktree add "$WORKTREE" "$BRANCH"
  else
    git worktree add -b "$BRANCH" "$WORKTREE" "origin/${BASE_BRANCH}"
  fi
fi

cd "$WORKTREE"
mkdir -p \
  ".agent/workpads" \
  "${RUN_ROOT}/artifacts" \
  "${RUN_ROOT}/logs"
cp "$TMP_WORKPAD" ".agent/workpads/issue-${ISSUE}.md"

if [ "$TRACK_RESOURCES" = true ]; then
  mkdir -p ".agent/changes/${ISSUE}"

  if [ -f ".agent/run-resource-use.json" ]; then
    cp ".agent/run-resource-use.json" "$RUN_RESOURCE_RECORD"
  else
    echo "TRACK_RESOURCES=true, but .agent/run-resource-use.json is missing" >&2
    exit 1
  fi

  python - "$RUN_RESOURCE_RECORD" "$REPO" "$INITIATIVE_ID" "$ISSUE" "$RUN_ID" "$BRANCH" "$STARTED_AT" "$AGENT_NAME" "$AGENT_HARNESS" "$WORKFLOW_VERSION" "$GATE_PROFILE" "$ACTIVITY" <<'PY2'
import json
import sys
from pathlib import Path

path = Path(sys.argv[1])
data = json.loads(path.read_text())
data.update(
    repository=sys.argv[2],
    initiative_id=sys.argv[3],
    change_id=sys.argv[4],
    run_id=sys.argv[5],
    branch=sys.argv[6],
    started_at=sys.argv[7],
    agent=sys.argv[8],
    harness=sys.argv[9],
    workflow_version=sys.argv[10],
    gate_profile=sys.argv[11],
    activity=sys.argv[12],
)
for event in data.get("model_usage", []):
    if not event.get("activity") or event.get("activity") == "implementation":
        event["activity"] = sys.argv[12]

path.write_text(json.dumps(data, indent=2) + "\n")
PY2

  if [ ! -f "$CHANGE_RESOURCE_SUMMARY" ]; then
    if [ -f ".agent/change-resource-summary.yml" ]; then
      cp ".agent/change-resource-summary.yml" "$CHANGE_RESOURCE_SUMMARY"
    else
      echo "TRACK_RESOURCES=true, but .agent/change-resource-summary.yml is missing" >&2
      exit 1
    fi

    python - "$CHANGE_RESOURCE_SUMMARY" "$REPO" "$INITIATIVE_ID" "$ISSUE" "$GATE_PROFILE" "$WORKFLOW_VERSION" "$RESOLUTION_INTENT" "$DECISION_QUESTION" "$EXPECTED_RESOLUTION_CLASS" "$EXPECTED_DISPOSITION" "$LANDING_EXPECTATION" "$RELEASE_EXPECTATION" <<'PY2'
import json
import sys
from pathlib import Path

path = Path(sys.argv[1])
text = path.read_text()
text = text.replace('repository: ""', f'repository: "{sys.argv[2]}"', 1)
text = text.replace('initiative_id: ""', f'initiative_id: "{sys.argv[3]}"', 1)
text = text.replace('change_id: ""', f'change_id: "{sys.argv[4]}"', 1)
text = text.replace('gate_profile: ""', f'gate_profile: "{sys.argv[5]}"', 1)
text = text.replace('workflow_version: ""', f'workflow_version: "{sys.argv[6]}"', 1)
text = text.replace('  mode: ""', f'  mode: {json.dumps(sys.argv[7])}', 1)
text = text.replace('  decision_question: ""', f'  decision_question: {json.dumps(sys.argv[8])}', 1)
text = text.replace('  expected_resolution_class: ""', f'  expected_resolution_class: {json.dumps(sys.argv[9])}', 1)
text = text.replace('  expected_disposition: ""', f'  expected_disposition: {json.dumps(sys.argv[10])}', 1)
text = text.replace('  landing_expectation: ""', f'  landing_expectation: {json.dumps(sys.argv[11])}', 1)
text = text.replace('  release_expectation: ""', f'  release_expectation: {json.dumps(sys.argv[12])}', 1)
path.write_text(text)
PY2
  fi
fi

export INITIATIVE_ID AGENT_HARNESS WORKFLOW_VERSION GATE_PROFILE ACTIVITY
export DECISION_QUESTION RESOLUTION_INTENT EXPECTED_RESOLUTION_CLASS EXPECTED_DISPOSITION
export LANDING_EXPECTATION RELEASE_EXPECTATION TRACK_RESOURCES
if [ "$TRACK_RESOURCES" = true ]; then
  export RESOURCE_RECORD="$RUN_RESOURCE_RECORD"
  export CHANGE_RESOURCE_SUMMARY
else
  unset RESOURCE_RECORD CHANGE_RESOURCE_SUMMARY 2>/dev/null || true
fi

if [ -x "scripts/agent/start-env.sh" ]; then
  scripts/agent/start-env.sh "$ISSUE" "$RUN_ID"
else
  echo "No scripts/agent/start-env.sh found; create .agent/run.env manually."
fi

COMMIT="$(git rev-parse --short HEAD)"
python - ".agent/workpads/issue-${ISSUE}.md" "$COMMIT" "$WORKPAD_URL" "$TRACK_RESOURCES" "$RUN_RESOURCE_RECORD" <<'PY2'
import json
import re
import sys
from pathlib import Path

workpad = Path(sys.argv[1])
commit = sys.argv[2]
workpad_url = sys.argv[3]
track_resources = sys.argv[4].lower() == "true"
resource_record = Path(sys.argv[5])

text = workpad.read_text()
text = re.sub(r"(?m)^commit:.*$", f"commit: {commit}", text, count=1)
if "Canonical workpad:" not in text:
    text += f"\n<!-- Canonical workpad: {workpad_url} -->\n"
workpad.write_text(text)

if track_resources and resource_record.exists():
    data = json.loads(resource_record.read_text())
    data["commit"] = commit
    resource_record.write_text(json.dumps(data, indent=2) + "\n")
PY2

gh api "repos/${REPO}/issues/comments/${WORKPAD_ID}" \
  --method PATCH \
  -f body="$(cat ".agent/workpads/issue-${ISSUE}.md")" \
  >/dev/null

{
  echo "# Change ${ISSUE} / Run ${RUN_ID}"
  echo
  echo "Issue: ${ISSUE_URL}"
  echo "Canonical workpad: ${WORKPAD_URL}"
  echo "Branch: ${BRANCH}"
  echo "Commit: ${COMMIT}"
  echo "Worktree: ${WORKTREE}"
  echo "Activity: ${ACTIVITY}"
  [ -n "$INITIATIVE_ID" ] && echo "Initiative: ${INITIATIVE_ID}"
  [ -n "$DECISION_QUESTION" ] && echo "Decision question: ${DECISION_QUESTION}"
  if [ "$TRACK_RESOURCES" = true ]; then
    echo "Run resource record: ${RUN_RESOURCE_RECORD}"
    echo "Change resource summary: ${CHANGE_RESOURCE_SUMMARY}"
  fi
  echo
  echo "Runtime logs and artifacts for this run live in this directory."
  echo
  echo "If the Change requires an ExecPlan, create it under:"
  echo
  echo '```text'
  echo "docs/exec-plans/active/${ISSUE}-<short-name>.md"
  echo '```'
  echo
  echo 'and follow `docs/PLANS.md`.'
} > "${RUN_ROOT}/RUN.md"

echo "Worktree: ${WORKTREE}"
echo "Workpad: ${WORKPAD_URL}"
echo "Run record: ${RUN_ROOT}/RUN.md"
if [ "$TRACK_RESOURCES" = true ]; then
  echo "Run resource record: ${RUN_RESOURCE_RECORD}"
  echo "Change resource summary: ${CHANGE_RESOURCE_SUMMARY}"
fi
echo "Next: provide the issue, WORKFLOW.md, workpad, repository context, gate profile, stop conditions, and environment details to the execution agent."
