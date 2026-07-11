# ExecPlans

An **ExecPlan** is an optional, self-contained execution plan for complex, ambiguous, risky, or long-running work.

It is not the default artifact for every Change.

The normal path is:

```text
Change Intent + WORKFLOW.md
  → workpad
  → Active Change
  → gates and evidence
  → review
```

An ExecPlan is added when the workpad is not enough to hold the technical reasoning, restart instructions, decisions, and validation plan.


## Why it is not the default

The [Symphony reference workflow](https://github.com/openai/symphony/blob/main/elixir/WORKFLOW.md) demonstrates a lighter default: the ticket provides specific intent and validation, `WORKFLOW.md` provides the standing process, and a persistent workpad carries the live plan and proof state. That is enough for many Changes.

Use an ExecPlan when the technical work itself needs to become a deeper, durable artifact—not because every agent run deserves another document.

## When an ExecPlan earns its keep

Use one for work such as:

- a significant refactor or architecture change
- a complex migration
- ambiguous behavior with multiple viable approaches
- a multi-hour investigation
- work that another agent or builder may need to resume
- work where the plan should be reviewed before implementation
- work with meaningful recovery or rollback concerns.

Do not create one for routine Changes because a template exists. Documents are not improved by being compulsory.

## Where it lives

ExecPlans should be durable, versioned repository documents:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
docs/exec-plans/completed/<change-id>-<short-name>.md
```

The workpad links to the active plan. When the Change is complete, move the plan to `completed/` and close it with outcomes and learning.

Runtime artifacts still belong under `.agent/runs/` or the configured artifact store.

## What it contains

A useful ExecPlan includes:

- purpose and big picture
- context and orientation
- current and desired state
- implementation strategy and concrete steps
- progress
- discoveries and surprises
- decision log
- validation and acceptance
- recovery and idempotence notes
- artifacts and evidence
- final outcome and retrospective.

The plan should be self-contained enough that a capable newcomer can continue without private chat history.

## Relationship to the workpad

Every orchestrated Change needs a workpad.

Only some Changes need an ExecPlan.

The workpad remains the concise live status and handoff surface. The ExecPlan carries the deeper implementation reasoning. A good workpad links to the plan; it does not slowly mutate into one by accident.
