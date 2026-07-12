---
name: evidence-package
description: Use before a Change enters Decision to assemble proof for a delivered or non-landed resolution. A PR is optional when nothing should land.
---

# Evidence Package

## Purpose

Create a concise decision package so builders can evaluate what happened, what proves it, what it consumed, and which disposition the evidence supports without reconstructing the work from transcripts.

## Procedure

1. Read the Change Intent, current workpad, and repository workflow.
2. Read the parent initiative and ExecPlan when they exist.
3. Confirm the resolution intent, decision question, landing expectation, and candidate disposition.
4. Map every applicable delivered or non-landed criterion to evidence.
5. Gather required gate, test, experiment, research, or feasibility results.
6. Gather browser, log, trace, API, benchmark, customer, or migration evidence as relevant.
7. Summarize reviewer-agent findings and contradictory evidence.
8. Confirm non-goals and forbidden surfaces were respected.
9. When resource use is measured, link the Change summary and confirm that material failed, discarded, superseded, and recovery attempts remain included.
10. Record forecast, actual, thresholds, variance, and data gaps when they matter to the decision.
11. State the proposed resolution status, class, disposition, landed state, released state, quality, decision owner, and basis.
12. For decision-class work, state what uncertainty was reduced and what decision or next action changed.
13. For administrative closure, state the external reason without claiming work-derived learning.
14. For unresolved loss, preserve remaining context and recovery ownership rather than manufacturing a positive conclusion.
15. Update the workpad and the PR only when a PR is useful.

## Output

Create or update:

```text
.agent/runs/<change-id>/<run-id>/artifacts/evidence.md
```

Link the artifact from the workpad and, when present, the PR.

## Quality test

The package should let a builder answer:

- What was supposed to change or be decided?
- What actually happened?
- What proves it?
- Which criteria were met, failed, waived, or not applicable?
- What did the complete Change consume, within the workflow’s measurement limits?
- What material variance or threshold decision occurred?
- Did anything land or release?
- Why does the evidence support the proposed class and disposition?
- What judgment is still required?

## Escalation

Engage a builder when required evidence or resource attribution is missing, contradictory, stale, double-counted, or too weak to support the proposed resolution.
