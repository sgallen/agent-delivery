# Reference: ExecPlan Template

Use this template when a Change is too complex, ambiguous, risky, or long-running to run from the workpad alone.

Suggested location:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow the target repository’s `docs/PLANS.md` standard.

```markdown
# <Short, action-oriented title>

This ExecPlan is a living document. Keep it current as progress, discoveries, decisions, and validation change.

## Purpose and desired outcome

Why this work matters and what should be observably true—or what decision should be possible—when it is complete.

## Context and orientation

What a capable agent or builder needs to know before working.

## Current state

What exists now.

## Desired state or decision question

What should exist after the Change, or what uncertainty the work must resolve.

## Plan of work

The sequence, affected areas, and important boundaries.

## Concrete steps

Commands or actions another capable agent can follow.

## Validation and evidence

How the outcome or decision will be proven with tests, behavior, logs, screenshots, research, comparisons, or other evidence.

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

## Optional initiative or resource context

Add value context, forecast stages, ranges, thresholds, or actuals only when they materially affect the work.

## Outcome and retrospective

What happened, what landed or released, what evidence supports the decision, what remains uncertain, and what the system should learn.
```

At completion, move the plan to:

```text
docs/exec-plans/completed/<change-id>-<short-name>.md
```

## Rule

If the ExecPlan is not maintained, it stops being a plan and becomes historical fiction.
