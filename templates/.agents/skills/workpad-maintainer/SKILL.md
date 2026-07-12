---
name: workpad-maintainer
description: Use at the start of every orchestrated Change and after meaningful milestones to keep the canonical execution and decision surface accurate.
---

# Workpad Maintainer

## Purpose

Maintain one live surface so builders and agents can understand lifecycle state, initiative context, resolution intent, plan, validation, resource state, evidence, candidate disposition, and handoff without reconstructing work from transcripts.

## Default location

For ticket-driven work, use one persistent ticket comment headed:

```markdown
## Agent Workpad
```

Find and update the same comment throughout the Change. Do not create separate progress, validation, resource, resolution, and handoff comments.

A local `.agent/workpads/<id>.md` file may mirror the comment or serve as a no-tracker fallback. It is not canonical when a ticket exists.

## Procedure

1. Find or create the canonical workpad.
2. Record initiative, lifecycle state, runner, run ID, branch, commit, and environment.
3. Restate the observable outcome or decision question.
4. Mirror resolution intent, landing expectation, delivered criteria, non-landed criteria, validation, and stop conditions.
5. Create or refine the current plan.
6. Record forecast stage, original range, confidence, expected resolution distribution, actual to date, completion forecast, thresholds, and data-quality gaps when measured.
7. Preserve original estimates; add revised forecasts rather than rewriting history.
8. Record discoveries only when they affect scope, risk, approach, estimate, evidence, or candidate disposition.
9. Surface blockers, resource approvals, stop decisions, and required builder judgment explicitly.
10. Update gate state, threshold state, run contribution, and evidence links after meaningful milestones.
11. Before Decision, state the candidate resolution class, disposition, landed state, released state, quality, and decision basis.
12. Before handoff, ensure the workpad reflects reality and names remaining gaps, uncertainty, and resource state.
13. At terminal state, record the final resolution or unresolved loss, estimate-versus-actual comparison, initiative rollup, and learning checkpoint.

## Evidence

The workpad should link to tests, browser proof, logs, traces, research, CI, PR when present, preview or deployment, resource records, and any ExecPlan.

Do not paste large raw artifacts or provider payloads into the workpad.

## Escalation

Engage a builder when criteria conflict, required evidence is missing, risk changes, a hard threshold is reached, a material variance needs a scope or resource decision, the proposed disposition is not supported, tools are unavailable, or the workpad cannot be kept accurate.
