# ExecPlans

An **ExecPlan** is an optional, self-contained execution plan for complex, ambiguous, risky, long-running, or materially constrained work.

It is not the default artifact for every Change.

The normal path is:

```text
Change Intent + WORKFLOW.md
  → workpad
  → Active Change
  → gates, resource record, and evidence
  → decision and resolution
```

An ExecPlan is added when the workpad is not enough to hold the technical reasoning, restart instructions, decisions, resource forecast, and validation plan.

## Why it is not the default

The [Symphony reference workflow](https://github.com/openai/symphony/blob/main/elixir/WORKFLOW.md) demonstrates a lighter default: the ticket provides specific intent and validation, `WORKFLOW.md` provides the standing process, and a persistent workpad carries the live plan and proof state. That is enough for many Changes.

Use an ExecPlan when the technical or economic shape of the work needs to become a deeper, durable artifact—not because every agent run deserves another document.

## When an ExecPlan earns its keep

Use one for work such as:

- a significant refactor or architecture change
- a complex migration
- ambiguous behavior with multiple viable approaches
- a multi-hour investigation
- work that another agent or builder may need to resume
- work where the plan should be reviewed before implementation
- work with meaningful recovery or rollback concerns
- work with a material resource envelope, scarce environment, or threshold decision
- a Change whose estimate materially affects an initiative forecast.

Do not create one for routine Changes because a template exists. Documents are not improved by being compulsory.

## Where it lives

ExecPlans should be durable, versioned repository documents:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
docs/exec-plans/completed/<change-id>-<short-name>.md
```

The workpad links to the active plan. When the Change is resolved, move the plan to `completed/` and close it with the resolution class, disposition, landing and release state, actuals, evidence, and learning. If it ends as unresolved loss, preserve that outcome rather than deleting the plan.

Runtime artifacts still belong under `.agent/runs/` or the configured artifact store. The Change resource summary links the execution records to the final resolution.

## What it contains

A useful ExecPlan includes:

- purpose and desired outcome
- parent initiative and value context, when applicable
- context and orientation
- current and desired state
- implementation strategy and concrete steps
- progress
- discoveries and surprises
- decision log
- forecast stage, range, confidence, and assumptions
- soft and hard resource thresholds
- likely capacity constraint
- delivered and non-landed resolution criteria
- recovery and idempotence notes
- artifacts and evidence
- final resolution status, class, disposition, landing and release state
- actual resource use, variance, resolution quality, learning value, and retrospective.

The plan should preserve earlier forecasts rather than replacing them with the latest view. It should be self-contained enough that a capable newcomer can continue without private chat history.

## Relationship to the workpad

Every orchestrated Change needs a workpad.

Only some Changes need an ExecPlan.

The workpad remains the concise live status, resource checkpoint, and handoff surface. The ExecPlan carries the deeper implementation and forecast reasoning. A good workpad links to the plan; it does not slowly mutate into one by accident.
