# ExecPlans

An **ExecPlan** is an optional, self-contained plan for complex, ambiguous, risky, or long-running work.

It is not the default artifact for every Change.

The normal path is:

```text
Change Intent + WORKFLOW.md
  → workpad
  → execution
  → gates and evidence
  → decision and resolution
```

Add an ExecPlan when the workpad is no longer enough to hold the technical reasoning, restart instructions, decisions, and validation path.

## Why it is not the default

Many Changes need specific intent, a standing workflow, one live workpad, and credible proof. Adding a second planning document to routine work does not make it more serious. It makes it longer.

Use an ExecPlan when another capable builder or agent would otherwise struggle to continue the work without private context.

## When an ExecPlan earns its keep

Good candidates include:

- a significant refactor or architecture Change;
- a complex migration;
- ambiguous behavior with several viable approaches;
- a multi-hour investigation;
- work that may pause and resume across people or agents;
- work whose plan deserves review before implementation;
- work with meaningful recovery or rollback concerns.

At greater maturity, a material resource envelope or initiative commitment may also justify one.

## Where it lives

Keep ExecPlans as durable, versioned repository documents:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
docs/exec-plans/completed/<change-id>-<short-name>.md
```

The workpad links to the active plan. When the Change ends, close the plan honestly and move it to `completed/`.

Runtime logs and artifacts still belong under `.agent/runs/` or the configured artifact store.

## What it contains

A useful ExecPlan includes:

- purpose and desired outcome;
- context and orientation;
- current and desired state;
- strategy and concrete steps;
- progress;
- discoveries and surprises;
- decision log;
- validation and evidence;
- recovery, idempotence, and rollback notes;
- final outcome and learning.

Add forecasts, thresholds, initiative context, or detailed actuals when they materially affect the work. Do not make every plan impersonate an investment memo.

The plan should be self-contained enough that a capable newcomer can continue without reading the original chat history.

## Relationship to the workpad

Every orchestrated Change needs a workpad.

Only some Changes need an ExecPlan.

The workpad remains the concise live status and handoff surface. The ExecPlan carries deeper reasoning. A good workpad links to the plan; it does not slowly mutate into one by accident.
