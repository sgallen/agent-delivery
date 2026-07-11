# Reference: ExecPlan Template

Use this template when a Change is too complex to run from the workpad alone.

Suggested location:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow the target repository’s `docs/PLANS.md` standard.

```markdown
# <Short, action-oriented title>

This ExecPlan is a living document. Keep it current as progress, discoveries, decisions, and validation change.

## Purpose and desired outcome

Why this work matters and what should be observably true when it is complete.

## Context and orientation

What a capable agent or builder needs to know before working.

## Current state

What exists now.

## Desired state

What should exist after the Change.

## Plan of work

The concrete sequence and affected areas.

## Validation and acceptance

How success will be proven, including commands, behavior, logs, screenshots, or other evidence.

## Progress

- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

## Discoveries and surprises

Facts learned during the work that affect the plan.

## Decision log

Meaningful decisions, alternatives, and rationale.

## Idempotence, rollback, and recovery

How to resume, retry, reverse, or clean up safely.

## Artifacts and evidence

Links to tests, logs, screenshots, traces, PRs, or reports.

## Outcome and retrospective

What shipped, what did not, what proved the result, and what the system should learn.
```

At completion, move the plan to:

```text
docs/exec-plans/completed/<change-id>-<short-name>.md
```

## Rule

If the ExecPlan is not maintained, it stops being a plan and becomes historical fiction.
