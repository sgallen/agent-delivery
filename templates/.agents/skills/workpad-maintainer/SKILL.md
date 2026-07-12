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
2. Record the current state, run, branch, worktree, environment, and intended path.
3. Restate the outcome or decision in a few lines and link the stable Change Intent.
4. Keep the plan, next action, blockers, and builder questions current.
5. Record only discoveries that change scope, risk, approach, evidence, forecast, or likely disposition.
6. Update gates and evidence after meaningful milestones.
7. Update resource range, actuals, thresholds, and data gaps when the workflow measures them. Preserve earlier forecasts rather than polishing history.
8. Before Decision, make the proposed resolution, landing state, evidence basis, remaining uncertainty, and needed judgment explicit.
9. At the end, record the final handoff, initiative update when any, and one honest learning checkpoint.

## Discipline

Do not create separate progress, validation, resource, resolution, and handoff comments. Do not paste large raw logs or provider payloads into the workpad; link the artifacts.

Engage a builder when intent conflicts, risk changes, a threshold is reached, tools cannot produce trustworthy proof, or the proposed outcome is not supported by the evidence.
