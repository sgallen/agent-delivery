# ExecPlan Standard

ExecPlans are optional, living documents for complex, ambiguous, risky, or long-running Changes.

The default execution surface is the workpad. Create an ExecPlan only when the workpad is no longer enough to hold the reasoning, decisions, recovery path, and validation detail another capable person or agent would need.

## Locations

```text
docs/exec-plans/active/<change-id>-<short-name>.md
docs/exec-plans/completed/<change-id>-<short-name>.md
```

Link the active plan from the workpad. Move it to `completed/` when the Change ends. Preserve an honest final state even when the work does not land.

## Use an ExecPlan for

- significant features or refactors;
- architecture-shaping work;
- complex migrations;
- ambiguous behavior with several viable paths;
- multi-hour investigations;
- work another agent or builder may need to resume;
- work whose plan should be reviewed before implementation.

Do not create one for routine Changes merely to satisfy process.

## Requirements

Every ExecPlan must be:

- self-contained;
- maintained as a living document;
- understandable without private chat history;
- focused on observable behavior or a clear decision;
- explicit about validation, recovery, and important choices.

Keep these sections current:

- Progress;
- Discoveries and surprises;
- Decision log;
- Artifacts and evidence;
- Outcome and retrospective.

Add initiative context, forecasts, thresholds, or detailed actuals when they materially shape the work. Do not make them mandatory by habit.

## Skeleton

```markdown
# <Short, action-oriented title>

This ExecPlan is a living document maintained according to `docs/PLANS.md`.

## Purpose and desired outcome

## Context and orientation

## Current state

## Desired state or decision question

## Plan of work

## Concrete steps

## Validation and evidence

## Progress

- [ ] (YYYY-MM-DD HH:MMZ) Drafted initial ExecPlan.

## Discoveries and surprises

## Decision log

## Idempotence, rollback, and recovery

## Artifacts and evidence

## Optional initiative or resource context

## Outcome and retrospective
```

## Completion

At completion, record:

- what happened and whether anything landed or released;
- the evidence supporting the outcome;
- important decisions and remaining uncertainty;
- actual versus forecast when a forecast existed;
- continuing obligations or follow-up Changes;
- what the system should learn.
