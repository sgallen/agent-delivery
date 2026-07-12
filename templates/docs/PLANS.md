# ExecPlan Standard

ExecPlans are optional, living documents for complex, ambiguous, risky, or long-running Changes.

The default execution surface is the workpad. Create an ExecPlan only when the workpad is not enough to hold the execution reasoning, credible resolution paths, decisions, recovery plan, resource forecast, and validation detail.

## Locations

```text
docs/exec-plans/active/<change-id>-<short-name>.md
docs/exec-plans/completed/<change-id>-<short-name>.md
```

Link the active plan from the workpad. Move it to `completed/` when the Change resolves. If it ends as unresolved loss, preserve the final plan with an explicit abandonment note rather than deleting it.

## Use an ExecPlan for

- significant features or refactors
- architecture-shaping work
- complex migrations
- ambiguous behavior with multiple viable paths
- multi-hour investigations
- work that another agent or builder may need to resume
- work where the plan, investment, or threshold decision should be reviewed before implementation.

Do not create one for routine Changes merely to satisfy process.

## Requirements

Every ExecPlan must be:

- self-contained
- maintained as a living document
- understandable without private chat history
- focused on observable behavior and outcomes
- explicit about resolution intent, delivered and non-landed criteria, validation, evidence, recovery, material resource assumptions, and important decisions.

Keep these sections current:

- Progress
- Discoveries and surprises
- Decision log
- Resource forecast and constraints
- Outcome and retrospective

If the plan changes, update it. If a gate failure or resource threshold changes the approach, preserve the prior forecast and record the revised one.

## Skeleton

```markdown
# <Short, action-oriented title>

This ExecPlan is a living document maintained according to `docs/PLANS.md`.

## Purpose and desired outcome

## Initiative and value context, if applicable

## Context and orientation

## Current state

## Desired state or decision question

## Resolution paths and criteria

Delivered criteria:
Useful non-landed criteria:
Stop conditions:

## Plan of work

## Concrete steps

## Resource forecast and constraints

Forecast stage:
Expected and likely range:
Confidence and assumptions:
Soft and hard thresholds:
Likely bottleneck or scarce resource:

## Validation and resolution criteria

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

- resolution status, class, specific disposition, landing state, and release state
- what shipped, what did not, or which decision question was answered
- the evidence that supports the delivered or non-landed resolution
- original and final forecasts, actual resource use, and material variance when measured
- remaining gaps, continuing obligations, or follow-up Changes
- important decisions
- the parent initiative update, when applicable
- what the system should learn.
