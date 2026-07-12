---
name: execplan-author
description: Use when drafting or maintaining an ExecPlan for complex, ambiguous, risky, long-running, or materially constrained work. Do not use for routine Changes that can run from the workpad.
---

# ExecPlan Author

## Purpose

Create a self-contained, living plan that another agent or builder can follow without private chat history and that preserves resolution intent, material forecasts, stop conditions, decisions, and recovery state.

## Procedure

1. Read the Change Intent, parent initiative when present, and workpad.
2. Confirm that an ExecPlan is warranted.
3. Read `docs/PLANS.md`.
4. Inspect relevant product, design, architecture, delivery-history, and code context.
5. Create or update `docs/exec-plans/active/<change-id>-<short-name>.md`.
6. Define delivered and non-landed resolution criteria before deep execution.
7. Define observable validation and decision evidence.
8. Record forecast stage, expected range, confidence, expected resolution distribution, assumptions, thresholds, stop conditions, and likely constraint.
9. Link the plan from the workpad.
10. Maintain progress, discoveries, revised forecasts, candidate dispositions, decisions, recovery notes, and evidence as work proceeds.
11. Request builder review when the plan includes a material product, architecture, security, migration, resource, capacity, stop, or irreversible decision.
12. At terminal state, record actuals, final class and disposition, landing and release state, evidence, variance, unresolved context when any, and initiative impact.
13. Move the plan to `docs/exec-plans/completed/` for resolved work. For unresolved loss, preserve it according to the repository’s abandonment policy rather than deleting it.

## Evidence

The ExecPlan names the required gates, resource decisions, proof, and credible terminal paths. The workpad remains the concise live checklist, threshold state, candidate disposition, and handoff surface.

## Escalation

Engage a builder when intent is underspecified, resolution criteria are retrospective, risk is unclear, forecast confidence is too low for the commitment, a threshold requires approval, evidence supports stopping, or the plan requires a specialist decision.
