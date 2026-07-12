# AGENTS.md

This repository uses a human-governed, agent-enabled delivery workflow.

## Start here

Before working on a Change:

1. Read `WORKFLOW.md`.
2. Read the Change Intent and current `## Agent Workpad`.
3. Follow the relevant product, design, architecture, regression, and skill links.
4. Confirm the gate profile, environment, boundaries, and stop conditions.
5. Read the parent initiative only when one exists.

## How to work here

- Treat the Change as the durable unit of work. A run is only an attempt.
- Maintain exactly one workpad for ticket-driven work; update it in place.
- Use an ExecPlan only when the workpad cannot hold the complexity safely.
- Do not add unrequested behavior or touch forbidden surfaces.
- Work in the isolated branch, worktree, and runtime environment defined by the workflow.
- Run targeted checks early. Run the required gate profile before proposing an outcome.
- Preserve evidence for behavior, UI, runtime, experiment, and investigation claims.
- Keep failed, discarded, superseded, and recovery attempts visible when they materially affect confidence or the final decision.
- Update the workpad when scope, risk, approach, blocker, evidence, or next action changes.
- Stop for builder judgment when intent conflicts, risk rises, ownership is unclear, a threshold is reached, or the same failure repeats without progress.

## Finish the Change honestly

A completed run, closed PR, or merged branch does not by itself resolve the Change.

Most Changes should end with delivered work. When nothing should land, record the question, evidence, decision, remaining uncertainty, and next action. When work closes for an external reason, say so plainly. When it ends without enough evidence or accountable judgment, keep that visible rather than inventing a learning story.

Use the formal resolution classes only when the repository’s reporting or analysis requires them.

## Resource records — when enabled

When this repository measures delivery economics, use the locations and fields defined in `WORKFLOW.md`.

State what is measured, estimated, missing, or excluded. Keep failed attempts in the record. Use human-contribution data to understand capability and system constraints, not to rank people by token-adjacent activity.

## Validation

Project commands and gate profiles live in `WORKFLOW.md` and `.agent/gates/`.

Passing commands is necessary. The final evidence must also support the Change Intent and the proposed outcome.
