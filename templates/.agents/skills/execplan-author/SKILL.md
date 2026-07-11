---
name: execplan-author
description: Use when drafting or maintaining an ExecPlan for complex, ambiguous, risky, or long-running work. Do not use for routine Changes that can run from the workpad.
---

# ExecPlan Author

## Purpose

Create a self-contained, living plan that another agent or builder can follow without private chat history.

## Procedure

1. Read the Change Intent and workpad.
2. Confirm that an ExecPlan is warranted.
3. Read `docs/PLANS.md`.
4. Inspect relevant product, design, architecture, and code context.
5. Create or update `docs/exec-plans/active/<change-id>-<short-name>.md`.
6. Define observable validation before deep implementation.
7. Link the plan from the workpad.
8. Maintain progress, discoveries, decisions, recovery notes, and evidence as work proceeds.
9. Request builder review when the plan includes a material product, architecture, security, migration, or irreversible decision.
10. Move the completed plan to `docs/exec-plans/completed/`.

## Evidence

The ExecPlan names the required gates and proof. The workpad remains the concise live checklist and handoff surface.

## Escalation

Engage a builder when the Change Intent is underspecified, risk is unclear, or the plan requires a specialist decision.
