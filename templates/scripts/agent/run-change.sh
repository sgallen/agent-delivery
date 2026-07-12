#!/usr/bin/env bash
set -euo pipefail

ISSUE="${1:?Usage: run-change.sh <github-issue-number>}"
BASE_BRANCH="${BASE_BRANCH:-main}"
BRANCH="agent/issue-${ISSUE}"
WORKTREE_ROOT="${WORKTREE_ROOT:-../$(basename "$PWD").worktrees}"
WORKTREE="${WORKTREE_ROOT}/issue-${ISSUE}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
INITIATIVE_ID="${INITIATIVE_ID:-}"
AGENT_NAME="${AGENT_NAME:-}"
AGENT_HARNESS="${AGENT_HARNESS:-}"
WORKFLOW_VERSION="${WORKFLOW_VERSION:-}"
GATE_PROFILE="${GATE_PROFILE:-}"
ACTIVITY="${ACTIVITY:-implementation}"
RESOLUTION_INTENT="${RESOLUTION_INTENT:-${RESOLUTION_MODE:-delivery}}"
DECISION_QUESTION="${DECISION_QUESTION:-}"
EXPECTED_RESOLUTION_CLASS="${EXPECTED_RESOLUTION_CLASS:-}"
EXPECTED_DISPOSITION="${EXPECTED_DISPOSITION:-}"
LANDING_EXPECTATION="${LANDING_EXPECTATION:-}"
RELEASE_EXPECTATION="${RELEASE_EXPECTATION:-}"
STARTED_AT="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

for cmd in gh git python; do
  if ! command -v "$cmd" >/dev/null; then
    echo "$cmd is required" >&2
    exit 1
  fi
done

REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
ISSUE_URL="https://github.com/${REPO}/issues/${ISSUE}"
RUN_RESOURCE_RECORD=".agent/runs/${ISSUE}/${RUN_ID}/resource-use.json"
CHANGE_RESOURCE_SUMMARY=".agent/changes/${ISSUE}/resource-summary.yml"

TMP_WORKPAD="$(mktemp)"
trap 'rm -f "$TMP_WORKPAD"' EXIT

cat > "$TMP_WORKPAD" <<EOF2
## Agent Workpad

### Status

\`\`\`text
state: running
last_updated: ${STARTED_AT}
initiative_id: ${INITIATIVE_ID}
runner: local-run-change
run_id: ${RUN_ID}
branch: ${BRANCH}
commit:
worktree: ${WORKTREE}
environment:
gate_profile: ${GATE_PROFILE}
activity: ${ACTIVITY}
resolution_intent: ${RESOLUTION_INTENT}
decision_question: ${DECISION_QUESTION}
expected_resolution_class: ${EXPECTED_RESOLUTION_CLASS}
landing_expectation: ${LANDING_EXPECTATION}
release_expectation: ${RELEASE_EXPECTATION}
candidate_resolution_class: ${EXPECTED_RESOLUTION_CLASS}
candidate_disposition: ${EXPECTED_DISPOSITION}
\`\`\`

### Outcome or decision

Copy the observable outcome or decision question from issue #${ISSUE}.

- Stop conditions: copy from the issue

### Plan

- [ ] Read the Change Intent, parent initiative when present, and repository guidance.
- [ ] Confirm scope, proof, stop conditions, and the intended decision path.
- [ ] Decide whether an ExecPlan is warranted.
- [ ] Implement, investigate, or experiment within scope.
- [ ] Run required gates and repair actionable failures.
- [ ] Prepare the evidence, resource summary, and proposed disposition.

### Current state

- Progress: starting
- Material discovery or decision:
- Scope, risk, or approach change:
- Blocker or builder question:
- Next action: inspect the Change and repository context

### Gates and evidence

| Gate or criterion | Result | Evidence | Next action |
| --- | --- | --- | --- |
| Scope | pending |  |  |
| Targeted proof | pending |  |  |
| Required gate profile | pending |  |  |

- Tests / experiment output:
- UI, runtime, research, or benchmark evidence:
- Reviewer findings:
- Known gaps:

### Resource status — optional

- Forecast stage and likely range:
- Actual to date:
- Builder attention by capability:
- Threshold state and action:
- Material variance:
- Run record: \`${RUN_RESOURCE_RECORD}\`
- Change summary: \`${CHANGE_RESOURCE_SUMMARY}\`
- Data gaps:

### Run history

| Run | Contribution | Outcome | Resource use |
| --- | --- | --- | ---: |
| ${RUN_ID} | in progress |  |  |

### Decision and handoff

- Proposed resolution class: delivered / decision / administrative / unresolved_loss
- Disposition:
- Landed: true / false / not_applicable
- Released: true / false / not_applicable
- Evidence basis:
- Decision owner:
- Remaining uncertainty:
- Final summary:
- Follow-up:
- Initiative updated:

### Learning checkpoint

> What should become easier, safer, faster, less wasteful, easier to estimate, or more valuable next time?

- Durable improvement:
EOF2

WORKPAD_ID="$(gh api "repos/${REPO}/issues/${ISSUE}/comments" --paginate --jq '.[] | select(.body | startswith("## Agent Workpad")) | .id' | head -n 1 || true)"

if [ -z "$WORKPAD_ID" ]; then
  echo "Creating persistent Agent Workpad comment..."
  WORKPAD_ID="$(gh api "repos/${REPO}/issues/${ISSUE}/comments" -f body="$(cat "$TMP_WORKPAD")" --jq '.id')"
else
  echo "Reusing Agent Workpad comment ${WORKPAD_ID}."
  gh api "repos/${REPO}/issues/comments/${WORKPAD_ID}" --jq '.body' > "$TMP_WORKPAD"

  python - "$TMP_WORKPAD" "$STARTED_AT" "$INITIATIVE_ID" "$RUN_ID" "$BRANCH" "$RUN_RESOURCE_RECORD" "$CHANGE_RESOURCE_SUMMARY" "$ACTIVITY" "$RESOLUTION_INTENT" "$DECISION_QUESTION" "$EXPECTED_RESOLUTION_CLASS" "$EXPECTED_DISPOSITION" "$LANDING_EXPECTATION" "$RELEASE_EXPECTATION" "$WORKTREE" "$GATE_PROFILE" <<'PY2'
import re
import sys
from pathlib import Path

path = Path(sys.argv[1])
text = path.read_text()
status = {
    "state": "running",
    "last_updated": sys.argv[2],
    "initiative_id": sys.argv[3],
    "runner": "local-run-change",
    "run_id": sys.argv[4],
    "branch": sys.argv[5],
    "commit": "",
    "worktree": sys.argv[15],
    "gate_profile": sys.argv[16],
    "activity": sys.argv[8],
    "resolution_intent": sys.argv[9],
    "decision_question": sys.argv[10],
    "expected_resolution_class": sys.argv[11],
    "landing_expectation": sys.argv[13],
    "release_expectation": sys.argv[14],
    "candidate_resolution_class": sys.argv[11],
    "candidate_disposition": sys.argv[12],
}
run_record = sys.argv[6]
change_summary = sys.argv[7]
run_id = sys.argv[4]

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
            # A later run may update the forecast, but it should not erase an
            # accountable resolution candidate already recorded by the Change.
            if key in {"candidate_resolution_class", "candidate_disposition"} and current_value:
                existing.append(line)
            else:
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

if not re.search(r"(?m)^### Resource status(?:\s+—.*)?\s*$", text):
    section = f'''### Resource status — optional

- Forecast stage and likely range:
- Actual to date:
- Builder attention by capability:
- Threshold state and action:
- Material variance:
- Run record: `{run_record}`
- Change summary: `{change_summary}`
- Data gaps:

'''
    for marker in ("### Run history", "### Decision and handoff", "### Learning checkpoint"):
        if marker in text:
            text = text.replace(marker, section + marker, 1)
            break
    else:
        text += "\n" + section

for label, value in (("Run record", run_record), ("Change summary", change_summary)):
    pattern = rf"(?mi)^- {re.escape(label)}:.*$"
    replacement = f"- {label}: `{value}`"
    if re.search(pattern, text):
        text = re.sub(pattern, replacement, text, count=1)

if "### Decision and handoff" not in text and "### Resolution candidate" not in text:
    section = '''### Decision and handoff

- Proposed resolution class: delivered / decision / administrative / unresolved_loss
- Disposition:
- Landed: true / false / not_applicable
- Released: true / false / not_applicable
- Evidence basis:
- Decision owner:
- Remaining uncertainty:
- Final summary:
- Follow-up:
- Initiative updated:

'''
    marker = "### Learning checkpoint"
    text = text.replace(marker, section + marker, 1) if marker in text else text + "\n" + section

if "### Run history" in text and f"| {run_id} |" not in text:
    table_divider = "| --- | --- | --- | ---: |"
    if table_divider in text:
        text = text.replace(table_divider, table_divider + f"\n| {run_id} | in progress |  |  |", 1)

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
  ".agent/changes/${ISSUE}" \
  ".agent/runs/${ISSUE}/${RUN_ID}/artifacts" \
  ".agent/runs/${ISSUE}/${RUN_ID}/logs"
cp "$TMP_WORKPAD" ".agent/workpads/issue-${ISSUE}.md"

if [ -f ".agent/run-resource-use.json" ]; then
  cp ".agent/run-resource-use.json" "$RUN_RESOURCE_RECORD"
else
  echo "Missing .agent/run-resource-use.json starter schema" >&2
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

data["run_outcome"] = {
    "status": "",
    "contribution": "",
    "candidate_resolution_class": "",
    "candidate_disposition": "",
    "stop_reason": "",
    "summary": "",
}
path.write_text(json.dumps(data, indent=2) + "\n")
PY2

if [ ! -f "$CHANGE_RESOURCE_SUMMARY" ]; then
  if [ -f ".agent/change-resource-summary.yml" ]; then
    cp ".agent/change-resource-summary.yml" "$CHANGE_RESOURCE_SUMMARY"
  else
    echo "Missing .agent/change-resource-summary.yml starter schema" >&2
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

export INITIATIVE_ID AGENT_HARNESS WORKFLOW_VERSION GATE_PROFILE ACTIVITY
export RESOLUTION_INTENT DECISION_QUESTION EXPECTED_RESOLUTION_CLASS EXPECTED_DISPOSITION
export LANDING_EXPECTATION RELEASE_EXPECTATION
export RESOURCE_RECORD="$RUN_RESOURCE_RECORD"
export CHANGE_RESOURCE_SUMMARY

if [ -x "scripts/agent/start-env.sh" ]; then
  scripts/agent/start-env.sh "$ISSUE" "$RUN_ID"
else
  echo "No scripts/agent/start-env.sh found; create .agent/run.env manually."
fi

COMMIT="$(git rev-parse --short HEAD)"
python - ".agent/workpads/issue-${ISSUE}.md" "$RUN_RESOURCE_RECORD" "$COMMIT" "$WORKPAD_URL" <<'PY2'
import json
import re
import sys
from pathlib import Path

workpad = Path(sys.argv[1])
resource_record = Path(sys.argv[2])
commit = sys.argv[3]
workpad_url = sys.argv[4]

text = workpad.read_text()
text = re.sub(r'(?m)^commit:.*$', f'commit: {commit}', text, count=1)
if 'Canonical workpad:' not in text:
    text += f'\n<!-- Canonical workpad: {workpad_url} -->\n'
workpad.write_text(text)

data = json.loads(resource_record.read_text())
data['commit'] = commit
resource_record.write_text(json.dumps(data, indent=2) + '\n')
PY2

gh api "repos/${REPO}/issues/comments/${WORKPAD_ID}" \
  --method PATCH \
  -f body="$(cat ".agent/workpads/issue-${ISSUE}.md")" \
  >/dev/null

cat > ".agent/runs/${ISSUE}/${RUN_ID}/RUN.md" <<EOF2
# Change ${ISSUE} / Run ${RUN_ID}

Initiative: ${INITIATIVE_ID:-none}
Issue: ${ISSUE_URL}
Canonical workpad: ${WORKPAD_URL}
Branch: ${BRANCH}
Commit: ${COMMIT}
Worktree: ${WORKTREE}
Run resource record: ${RUN_RESOURCE_RECORD}
Change resource summary: ${CHANGE_RESOURCE_SUMMARY}

Runtime logs and artifacts for this run live in this directory.

Activity: ${ACTIVITY}
Resolution intent: ${RESOLUTION_INTENT}
Decision question: ${DECISION_QUESTION:-not set}
Expected resolution class: ${EXPECTED_RESOLUTION_CLASS:-not set}
Expected disposition: ${EXPECTED_DISPOSITION:-not set}
Landing expectation: ${LANDING_EXPECTATION:-not set}
Release expectation: ${RELEASE_EXPECTATION:-not set}

If the Change requires an ExecPlan, create it under:

\`\`\`text
docs/exec-plans/active/${ISSUE}-<short-name>.md
\`\`\`

and follow \`docs/PLANS.md\`.

At a resource threshold, update the workpad and Change summary, preserve this run state, and follow the decision rule in \`WORKFLOW.md\`.
EOF2

echo "Worktree: ${WORKTREE}"
echo "Workpad: ${WORKPAD_URL}"
echo "Run record: .agent/runs/${ISSUE}/${RUN_ID}/RUN.md"
echo "Run resource record: ${RUN_RESOURCE_RECORD}"
echo "Change resource summary: ${CHANGE_RESOURCE_SUMMARY}"
echo "Next: provide the issue, parent initiative when present, WORKFLOW.md, workpad, repo context, intended resolution, gate profile, resource policy, and environment details to the execution agent."
