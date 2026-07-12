# Reference: ExecPlan Template

Use this template when a Change is too complex, ambiguous, risky, or materially constrained to run from the workpad alone.

Suggested location:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow the target repository’s `docs/PLANS.md` standard.

```markdown
# <Short, action-oriented title>

This ExecPlan is a living document. Keep it current as progress, discoveries, decisions, forecasts, and validation change.

## Purpose and desired outcome

Why this work matters and what should be observably true when it is complete.

## Initiative and value context, if applicable

Parent initiative, expected contribution, and any value assumption this Change tests.

## Context and orientation

What a capable agent or builder needs to know before working.

## Current state

What exists now.

## Desired state

What should exist after the Change.

## Plan of work

The concrete sequence and affected areas.

## Resource forecast and constraints

Forecast stage:
Expected machine resources and likely range:
Expected builder attention by capability and likely range:
Elapsed-time range:
Confidence and assumptions:
Comparable Changes:
Soft and hard thresholds:
Likely bottleneck or scarce resource:

Preserve earlier forecasts and add dated revisions when new information changes the plan.

## Validation and resolution criteria

State the delivered acceptance criteria, the evidence required for a useful non-landed decision, and any stop conditions. Explain how each path will be proven with commands, behavior, logs, screenshots, research, comparisons, or other evidence.

## Progress

- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

## Discoveries and surprises

Facts learned during the work that affect the plan or forecast.

## Decision log

Meaningful decisions, alternatives, threshold decisions, and rationale.

## Idempotence, rollback, and recovery

How to resume, retry, reverse, or clean up safely. State what must be preserved if a resource limit stops execution.

## Artifacts and evidence

Links to tests, logs, screenshots, traces, resource records, PRs, or reports.

## Outcome and retrospective

Resolution status, class, disposition, landing and release state; what shipped or did not; which decision question was answered; what proved the result; forecast versus actual; material delivery and resolution variance; initiative implication; and what the system should learn.
```

At completion, move the plan to:

```text
docs/exec-plans/completed/<change-id>-<short-name>.md
```

## Rule

If the ExecPlan is not maintained, it stops being a plan and becomes historical fiction.
