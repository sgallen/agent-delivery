# AGENTS.md

This repository uses a human-governed, agent-enabled product delivery workflow.

## Start here

Before working on a Change:

1. Read `WORKFLOW.md`.
2. Read the Change Intent and current workpad.
3. Follow links to relevant product, design, architecture, and regression docs.
4. Confirm the gate profile and execution environment.

## Repository expectations

- Maintain exactly one persistent workpad comment for each orchestrated ticket-driven Change.
- Keep the issue body stable; record live execution state in the workpad.
- Use `docs/PLANS.md` and create an ExecPlan only when the workpad is not enough.
- Keep this file short. Durable context belongs in `docs/`. Reusable procedures belong in `.agents/skills/`.
- Do not add unrequested product behavior.
- Do not modify forbidden surfaces listed in the Change Intent.
- Update the workpad when the plan, risk, blocker, or validation state changes.
- Run the required gates before proposing review.
- Attach evidence for UI and runtime work.
- Stop and request builder judgment when intent conflicts, risk increases, or the same failure repeats without progress.

## Workpads

Use the workpad for:

- current status and environment
- plan and acceptance criteria
- gate and validation state
- discoveries and decisions that affect the Change
- blockers and builder questions
- evidence links
- handoff and learning checkpoint.

Do not create a thread of progress comments. Update the same workpad comment in place.

## ExecPlans

Use an ExecPlan for complex, ambiguous, risky, architecture-shaping, or long-running work.

Create it under:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow `docs/PLANS.md`, link it from the workpad, and move it to `completed/` when the Change is done.

Routine Changes should run from the workpad.

## Validation

Project-specific commands live in `WORKFLOW.md` and gate manifests. A typical baseline is:

```bash
pnpm format:check
pnpm lint
pnpm typecheck
pnpm test
pnpm agent:gates
```

Passing commands is necessary. The final outcome must also satisfy the Change Intent and evidence requirements.
