---
name: workpad-maintainer
description: Use at the start of every orchestrated Change and after meaningful milestones to keep the canonical live state accurate.
---

# Workpad Maintainer

## Purpose

Keep one surface current enough that the next builder or agent can understand the Change without reconstructing it from transcripts.

## Canonical location

For ticket-driven work, use one persistent comment headed:

```markdown
## Agent Workpad
```

Update the same comment throughout the Change. A local `.agent/workpads/<id>.md` may mirror it or serve as a no-tracker fallback.

## Procedure

1. Find or create the workpad.
2. Record the current state, run, branch, worktree, and environment.
3. Restate the outcome or decision in a few lines and link the stable Change Intent.
4. Keep the plan, next action, blockers, and builder questions current.
5. Record only discoveries that change scope, risk, approach, evidence, or likely outcome.
6. Update gates and evidence after meaningful milestones.
7. Before the final decision, make the proposed outcome, landing state, evidence basis, remaining uncertainty, and needed judgment explicit.
8. At the end, record the handoff and one honest learning checkpoint.
9. When the project uses initiative, forecast, threshold, or resource fields, update them only when they affect the next decision.

## Discipline

Do not create separate progress, validation, resource, resolution, and handoff comments. Do not paste large raw logs or provider payloads into the workpad; link the artifacts.

Engage a builder when intent conflicts, risk changes, a stop condition is reached, tools cannot produce trustworthy proof, or the proposed outcome is not supported by the evidence.
