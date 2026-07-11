#!/usr/bin/env bash
set -euo pipefail

ISSUE="${1:?Usage: run-change.sh <github-issue-number>}"
BASE_BRANCH="${BASE_BRANCH:-main}"
BRANCH="agent/issue-${ISSUE}"
WORKTREE_ROOT="${WORKTREE_ROOT:-../$(basename "$PWD").worktrees}"
WORKTREE="${WORKTREE_ROOT}/issue-${ISSUE}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"

for cmd in gh git; do
  if ! command -v "$cmd" >/dev/null; then
    echo "$cmd is required" >&2
    exit 1
  fi
done

REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
ISSUE_URL="https://github.com/${REPO}/issues/${ISSUE}"

TMP_WORKPAD="$(mktemp)"
trap 'rm -f "$TMP_WORKPAD"' EXIT

cat > "$TMP_WORKPAD" <<EOF2
## Agent Workpad

### Status

\`\`\`text
state: running
last_updated: $(date -u +%Y-%m-%dT%H:%M:%SZ)
runner: local-run-change
run_id: ${RUN_ID}
branch: ${BRANCH}
commit:
environment:
\`\`\`

### Outcome

Copy the observable outcome from issue #${ISSUE}.

### Acceptance criteria

- [ ] Copy from the issue.

### Plan

- [ ] Read the Change Intent and repository guidance.
- [ ] Mirror acceptance criteria and validation requirements here.
- [ ] Decide whether an ExecPlan is warranted.
- [ ] Implement within scope.
- [ ] Run required gates and repair actionable failures.
- [ ] Prepare evidence and review package.

### Validation and gates

- [ ] Scope
- [ ] Lint / typecheck / build
- [ ] Targeted tests
- [ ] Behavior proof
- [ ] Browser or runtime check, if applicable
- [ ] Evidence package

### Discoveries and decisions

-

### Blockers / builder judgment

-

### Evidence

- PR:
- CI:
- screenshots / video:
- logs / traces:
- preview / deployment:

### Handoff

- current outcome:
- remaining work:
- known gaps:
- recommended reviewer:

### Run economics

- record: `.agent/runs/${ISSUE}/${RUN_ID}/economics.json`
- builder minutes:
- notable cost/retry signal:

### Learning checkpoint

- no reusable learning / improvement included / follow-up Change:
EOF2

WORKPAD_ID="$(gh api "repos/${REPO}/issues/${ISSUE}/comments" --paginate --jq '.[] | select(.body | startswith("## Agent Workpad")) | .id' | head -n 1 || true)"

if [ -z "$WORKPAD_ID" ]; then
  echo "Creating persistent Agent Workpad comment..."
  WORKPAD_ID="$(gh api "repos/${REPO}/issues/${ISSUE}/comments" -f body="$(cat "$TMP_WORKPAD")" --jq '.id')"
else
  echo "Reusing Agent Workpad comment ${WORKPAD_ID}."
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
mkdir -p ".agent/workpads" ".agent/runs/${ISSUE}/${RUN_ID}/artifacts" ".agent/runs/${ISSUE}/${RUN_ID}/logs"
cp "$TMP_WORKPAD" ".agent/workpads/issue-${ISSUE}.md"

if [ -x "scripts/agent/start-env.sh" ]; then
  scripts/agent/start-env.sh "$ISSUE" "$RUN_ID"
else
  echo "No scripts/agent/start-env.sh found; create .agent/run.env manually."
fi

COMMIT="$(git rev-parse --short HEAD)"
python - <<PY2
from pathlib import Path
p = Path('.agent/workpads/issue-${ISSUE}.md')
s = p.read_text()
s = s.replace('commit:\n', 'commit: ${COMMIT}\n')
s += '\n<!-- Canonical workpad: ${WORKPAD_URL} -->\n'
p.write_text(s)
PY2

cat > ".agent/runs/${ISSUE}/${RUN_ID}/RUN.md" <<EOF2
# Change ${ISSUE} / Run ${RUN_ID}

Issue: ${ISSUE_URL}
Canonical workpad: ${WORKPAD_URL}
Branch: ${BRANCH}
Commit: ${COMMIT}
Worktree: ${WORKTREE}

Runtime logs and artifacts for this run live in this directory.

If the Change requires an ExecPlan, create it under:

docs/exec-plans/active/${ISSUE}-<short-name>.md

and follow docs/PLANS.md.
EOF2

cat > ".agent/runs/${ISSUE}/${RUN_ID}/economics.json" <<EOF2
{
  "change_id": "${ISSUE}",
  "run_id": "${RUN_ID}",
  "started_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "completed_at": "",
  "provider": "",
  "model": "",
  "pricing_snapshot_date": "",
  "input_tokens": 0,
  "cached_input_tokens": 0,
  "cache_write_tokens": 0,
  "output_tokens": 0,
  "model_cost_usd": 0,
  "tool_cost_usd": 0,
  "environment_cost_usd": 0,
  "attempt": 1,
  "gate_result": "",
  "failed_gates": [],
  "builder_minutes": {
    "intent": 0,
    "judgment": 0,
    "review": 0,
    "harness_recovery": 0
  },
  "final_disposition": "",
  "notes": ""
}
EOF2

echo "Worktree: ${WORKTREE}"
echo "Workpad: ${WORKPAD_URL}"
echo "Run record: .agent/runs/${ISSUE}/${RUN_ID}/RUN.md"
echo "Next: provide the issue, WORKFLOW.md, workpad, repo context, gate profile, and environment details to the implementation agent."
