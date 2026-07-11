---
name: workpad-maintainer
description: Use at the start of every orchestrated Change and after meaningful milestones to keep the canonical workpad accurate.
---

# Workpad Maintainer

## Purpose

Maintain one live surface so builders and agents can understand status, plan, validation, evidence, and handoff without reconstructing the work from transcripts.

## Default location

For ticket-driven work, use one persistent ticket comment headed:

```markdown
## Agent Workpad
```

Find and update the same comment throughout the Change. Do not create separate progress, validation, and handoff comments.

A local `.agent/workpads/<id>.md` file may mirror the comment or serve as a no-tracker fallback. It is not canonical when a ticket exists.

## Procedure

1. Find or create the canonical workpad.
2. Record status, runner, run ID, branch, commit, and environment.
3. Restate the observable outcome.
4. Mirror the acceptance criteria and validation requirements.
5. Create or refine the current plan.
6. Record discoveries and decisions only when they affect scope, risk, approach, or outcome.
7. Surface blockers and required builder judgment explicitly.
8. Update gate state and evidence links after meaningful milestones.
9. Before handoff, ensure the workpad reflects reality and names remaining gaps.
10. Close with the final outcome and learning checkpoint.

## Evidence

The workpad should link to tests, browser proof, logs, traces, CI, PR, preview/deployment, and any ExecPlan.

Do not paste large raw artifacts into the workpad.

## Escalation

Engage a builder when acceptance criteria conflict, required validation is missing, risk changes, tools are unavailable, or the workpad cannot be kept accurate.
