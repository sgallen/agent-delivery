# AGENTS.md

This repository uses a human-governed, agent-enabled product delivery workflow.

## Start here

Before working on a Change:

1. Read `WORKFLOW.md`.
2. Read the Change Intent and current workpad.
3. Read the parent initiative record when one exists.
4. Follow links to relevant product, design, architecture, regression, and comparable-delivery records.
5. Confirm the intended resolution, gate profile, resource policy, and execution environment.

## Repository expectations

- Maintain exactly one persistent workpad comment for each orchestrated ticket-driven Change.
- Keep the issue body stable; record live execution state in the workpad.
- Use `docs/PLANS.md` and create an ExecPlan only when the workpad is not enough.
- Keep this file short. Durable context belongs in `docs/`. Reusable procedures belong in `.agents/skills/`.
- Do not add unrequested product behavior.
- Do not modify forbidden surfaces listed in the Change Intent.
- Update the workpad when the plan, risk, blocker, validation state, resource forecast, threshold state, or proposed resolution changes.
- Attribute run usage and environment activity to the current Change. Preserve provider pricing or billed amounts needed for historical reconciliation.
- Treat a run as an attempt, not the final Change outcome.
- Keep failed, discarded, superseded, and recovery attempts in the Change record.
- Run the required gates before proposing a decision.
- Attach evidence for UI, runtime, experiment, and investigation work.
- At a soft resource threshold, checkpoint, explain variance, and reforecast.
- At a hard threshold, preserve state and request the decision named in `WORKFLOW.md`.
- Stop and request builder judgment when intent conflicts, risk increases, a scarce-resource decision is required, ownership is unclear, or the same failure repeats without progress.

## Resolution expectations

Every Change that entered execution must eventually record:

```text
resolution_status: resolved | unresolved
resolution_class: delivered | decision | administrative | unresolved_loss
disposition: <specific conclusion>
landed: true | false | not_applicable
released: true | false | not_applicable
resolution_quality: weak | sufficient | strong | not_assessed
learning.value: none | low | material | high
```

Do not call a non-landed Change productive merely because effort was spent. Decision-class work needs evidence that changed a decision or reduced material uncertainty. Administrative closure should name the accountable owner and external basis without claiming product learning. Unresolved loss must remain visible.

## Workpads

Use the workpad for:

- current state, initiative, environment, and run identity;
- resolution intent, decision question, and candidate resolution;
- acceptance and non-landed resolution criteria;
- plan, gate, and validation state;
- resource forecast, actual to date, thresholds, and material variance;
- discoveries and decisions that affect the Change;
- blockers and builder questions;
- evidence links;
- final resolution, handoff, and learning checkpoint.

Do not create a thread of progress comments. Update the same workpad comment in place.

## ExecPlans

Use an ExecPlan for complex, ambiguous, risky, architecture-shaping, or long-running work.

Create it under:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow `docs/PLANS.md`, link it from the workpad, and move it to `completed/` when the Change resolves. Preserve incomplete plans when work becomes unresolved loss.

Routine Changes should run from the workpad.

## Resource records

Use the starter records when this repository measures delivery economics:

```text
.agent/runs/<change>/<run>/resource-use.json
.agent/changes/<change>/resource-summary.yml
```

A run record describes an attempt. The Change summary connects forecasts, actuals, thresholds, resolution, and data quality. Never imply completeness when direct-provider, subscription, local-compute, environment, or human data is missing.

Measure human contribution to understand capability and system constraints, not to create simplistic individual rankings.

## Validation

Project-specific commands live in `WORKFLOW.md` and gate manifests. A typical baseline is:

```bash
pnpm format:check
pnpm lint
pnpm typecheck
pnpm test
pnpm agent:gates
```

Passing commands is necessary. The final disposition must also satisfy the Change Intent, resource decisions, evidence requirements, and the proof appropriate to its resolution class.
