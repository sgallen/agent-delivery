---
name: execplan-author
description: Use when drafting or maintaining an ExecPlan for complex, ambiguous, risky, or long-running work. Do not use for routine Changes that can run from the workpad.
---

# ExecPlan Author

## Purpose

Create a self-contained, living plan that another agent or builder can follow without private chat history.

## Procedure

1. Read the Change Intent and current workpad.
2. Confirm that an ExecPlan is warranted.
3. Read `docs/PLANS.md`.
4. Inspect the relevant product, design, architecture, and code context.
5. Create or update `docs/exec-plans/active/<change-id>-<short-name>.md`.
6. Define the desired outcome or decision question and important boundaries.
7. Write the strategy, concrete steps, validation, recovery, and stop conditions.
8. Link the plan from the workpad.
9. Maintain progress, discoveries, decisions, and evidence as work proceeds.
10. Request builder review when the plan includes a material product, architecture, security, migration, or irreversible decision.
11. Add initiative context, forecasts, or thresholds only when they affect the work.
12. At the end, record the outcome, landing and release state, evidence, remaining uncertainty, and learning.
13. Move the plan to `docs/exec-plans/completed/` without deleting evidence of a path that did not land.

## Evidence

The plan should name the required proof and credible end states. The workpad remains the concise live checklist and handoff surface.

## Escalation

Engage a builder when intent is underspecified, the plan depends on a product or risk decision, evidence points toward stopping, or the proposed outcome is not supported by what the work revealed.
