---
name: evidence-package
description: Use before a Change enters Decision to assemble proof for delivered work or a non-landed decision. A PR is optional when nothing should land.
---

# Evidence Package

## Purpose

Create a concise package so builders can judge what happened without reconstructing the work from transcripts.

## Procedure

1. Read the Change Intent, current workpad, and repository workflow.
2. Confirm the outcome or decision the evidence must support.
3. Map each applicable criterion to evidence.
4. Gather the required tests, gates, experiment results, research, or feasibility findings.
5. Gather browser, log, trace, API, benchmark, customer, or migration evidence as relevant.
6. Summarize reviewer findings and contradictory evidence.
7. Confirm that non-goals and forbidden surfaces were respected.
8. State what happened, whether anything should land or release, what remains uncertain, and whose judgment is still required.
9. For a non-landed decision, state what question was answered and what action changes because of the evidence.
10. For external closure or unresolved work, say so plainly rather than inventing a success story.
11. When initiative or resource records are enabled, link them and note material variance or data gaps.
12. Update the workpad and the PR only when a PR is useful.

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
- Did anything land or release?
- What judgment or follow-up remains?

## Escalation

Engage a builder when required evidence is missing, contradictory, stale, or too weak to support the proposed outcome.
