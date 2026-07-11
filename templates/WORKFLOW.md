# WORKFLOW.md

This workflow manages Changes and outcomes, not individual agent sessions. Agents may stop, restart, or hand work off; the issue, workpad, gates, and evidence preserve the state.

Keep only process that improves intent, execution, proof, recovery, or learning.

## Change lifecycle

```text
Proposed → Shaped → Ready → Running → Proving → Review → Released
                    ↘ Blocked / Cancelled when needed
```

Only the roles or automations named in this file may move a Change into `Ready`, `Review`, or `Released`.

## Readiness

A Change is ready when it has:

- a clear outcome
- acceptance criteria
- non-goals and forbidden changes
- risk, type, and gate-profile labels
- validation and evidence expectations
- no unresolved blocker
- `agent:eligible` when the orchestrator may claim it.

## Workpad

Every orchestrated Change has one canonical workpad.

Default GitHub location:

```text
One issue comment headed: ## Agent Workpad
```

Find or create that comment and update it in place. Do not post separate progress, validation, or handoff comments.

The workpad must include:

- status, run identity, branch, and environment
- outcome and mirrored acceptance criteria
- current plan
- gate and validation state
- discoveries and decisions that affect scope, risk, or approach
- blockers and builder questions
- evidence links
- handoff and learning checkpoint.

A local `.agent/workpads/<id>.md` file may mirror the workpad or serve as a fallback when no ticket exists. The ticket comment remains canonical for ticket-driven Changes.

## ExecPlans

Use an ExecPlan only for complex, ambiguous, risky, architecture-shaping, or long-running work.

Create it under:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow `docs/PLANS.md`, link it from the workpad, keep it current, and move it to `completed/` when the Change closes.

## Execution environment

Every Active Change receives an isolated enough environment:

- branch and worktree
- unique ports and service namespaces
- isolated mutable test data
- isolated browser profile for UI work
- Change-specific logs and artifacts
- startup and teardown commands.

## Gates

Run the profile named in the Change Intent.

A gate returns:

```text
pass | fail | not_applicable | blocked | waived
```

Loop on an actionable required failure while progress continues.

Stop and engage a builder when:

- intent is missing or conflicting
- risk increases
- a specialist decision is required
- forbidden scope is touched
- the environment cannot produce trustworthy evidence
- the same failure repeats without progress.

## Evidence

The workpad and PR should link to:

- gate summary
- targeted test output
- screenshots or video for UI behavior
- browser console/network summary when relevant
- logs or traces for runtime behavior
- preview or deployment link when available
- reviewer-agent findings
- known gaps
- run economics when the selected workflow measures cost and builder attention.

Large artifacts live in CI or the configured artifact store.

## Review

The PR is a review package, not the first record of the work.

Select builder review according to risk, observability, reversibility, and required judgment. Low-risk Changes may need evidence review; architecture, security, product, or design decisions require the appropriate specialist.

## Completion

A Change can move to `Released` when:

- acceptance criteria are met or the rejection is explicit
- required gates are validly resolved
- evidence is reviewable
- required builder decisions are recorded
- the issue, workpad, and PR agree on the outcome
- the learning checkpoint is complete.
