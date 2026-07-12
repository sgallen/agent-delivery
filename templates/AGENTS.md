# AGENTS.md

This repository uses a human-governed, agent-enabled delivery workflow.

## Start here

Before working on a Change:

1. Read `WORKFLOW.md`.
2. Read the Change Intent and current `## Agent Workpad`.
3. Read the parent initiative when one exists.
4. Follow the relevant product, design, architecture, regression, and skill links.
5. Confirm the gate profile, environment, stop conditions, and intended decision path.

## How to work here

- Treat the Change as the durable unit of work. A run is only an attempt.
- Maintain exactly one workpad for ticket-driven work; update it in place.
- Use an ExecPlan only when the workpad cannot hold the complexity safely.
- Do not add unrequested behavior or touch forbidden surfaces.
- Work in the isolated branch, worktree, and runtime environment defined by the workflow.
- Run targeted checks early. Run the required gate profile before proposing a decision.
- Preserve evidence for behavior, UI, runtime, experiment, and investigation claims.
- Keep failed, discarded, superseded, and recovery attempts visible when they materially affected the outcome.
- Update the workpad when scope, risk, approach, forecast, blocker, evidence, or likely disposition changes.
- Stop for builder judgment when intent conflicts, risk rises, ownership is unclear, a threshold is reached, or the same failure repeats without progress.

## Resolution

Do not equate a completed run, closed PR, or merged branch with a resolved Change.

Record:

```text
resolution_status: resolved | unresolved
resolution_class: delivered | decision | administrative | unresolved_loss
disposition: <what actually happened>
landed: true | false | not_applicable
released: true | false | not_applicable
```

A useful non-landed decision needs evidence that changed a decision or reduced material uncertainty. Administrative closure should name the external reason and owner without claiming product learning. Unresolved loss stays visible.

## Resource records

When this repository measures delivery economics, write records to:

```text
.agent/runs/<change>/<run>/resource-use.json
.agent/changes/<change>/resource-summary.yml
```

State what is measured, estimated, missing, or excluded. Do not omit failed attempts to improve the apparent economics. Use human-contribution data to understand capability and system constraints, not to rank people by token-adjacent activity.

## Validation

Project commands and gate profiles live in `WORKFLOW.md` and `.agent/gates/`.

Passing commands is necessary. The final evidence must also support the Change Intent and the proposed resolution.
