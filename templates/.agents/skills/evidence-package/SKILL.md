---
name: evidence-package
description: Use before opening or updating a PR to assemble proof that a Change achieved its outcome and resolved required gates.
---

# Evidence Package

## Purpose

Create a concise review package so builders can evaluate the outcome without reconstructing the work from transcripts.

## Procedure

1. Read the Change Intent and current workpad.
2. Read the ExecPlan if one exists.
3. Map every acceptance criterion to evidence.
4. Gather required gate results and targeted test output.
5. Gather browser evidence for UI work.
6. Gather log, trace, API, or migration proof for runtime work.
7. Summarize reviewer-agent findings.
8. Confirm non-goals and forbidden surfaces were respected.
9. Record known gaps and required builder judgment.
10. Update the workpad handoff and PR body.

## Output

Create or update:

```text
.agent/runs/<change-id>/<run-id>/artifacts/evidence.md
```

Link the artifact from the workpad and PR.

## Quality test

The package should let a builder answer:

- What was supposed to change?
- What actually changed?
- What proves it?
- What did not change?
- What judgment is still required?

## Escalation

Engage a builder when required evidence is missing, contradictory, stale, or too noisy to support a decision.
