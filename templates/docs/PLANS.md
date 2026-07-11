# ExecPlan Standard

ExecPlans are optional, living documents for complex, ambiguous, risky, or long-running Changes.

The default execution surface is the workpad. Create an ExecPlan only when the workpad is not enough to hold the implementation reasoning, decisions, recovery plan, and validation detail.

## Locations

```text
docs/exec-plans/active/<change-id>-<short-name>.md
docs/exec-plans/completed/<change-id>-<short-name>.md
```

Link the active plan from the workpad. Move it to `completed/` when the Change closes.

## Use an ExecPlan for

- significant features or refactors
- architecture-shaping work
- complex migrations
- ambiguous behavior with multiple viable paths
- multi-hour investigations
- work that another agent or builder may need to resume
- work where the plan should be reviewed before implementation.

Do not create one for routine Changes merely to satisfy process.

## Requirements

Every ExecPlan must be:

- self-contained
- maintained as a living document
- understandable without private chat history
- focused on observable behavior and outcomes
- explicit about validation, evidence, recovery, and important decisions.

Keep these sections current:

- Progress
- Discoveries and surprises
- Decision log
- Outcome and retrospective

If the plan changes, update it. If a gate failure changes the approach, record the failure and revised plan.

## Skeleton

```markdown
# <Short, action-oriented title>

This ExecPlan is a living document maintained according to `docs/PLANS.md`.

## Purpose and desired outcome

## Context and orientation

## Current state

## Desired state

## Plan of work

## Concrete steps

## Validation and acceptance

## Progress

- [ ] (YYYY-MM-DD HH:MMZ) Drafted initial ExecPlan.

## Discoveries and surprises

## Decision log

## Idempotence, rollback, and recovery

## Artifacts and evidence

## Outcome and retrospective
```

## Completion

At completion, record:

- what shipped or was deliberately rejected
- the evidence that supports the outcome
- remaining gaps or follow-up Changes
- important decisions
- what the system should learn.
