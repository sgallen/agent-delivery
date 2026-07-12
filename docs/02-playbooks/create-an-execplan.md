# Playbook: Create an ExecPlan

Use this when a Change is too large, ambiguous, risky, or long-running to remain coherent in the workpad alone.

An ExecPlan is optional. It is not the default for every Change.

## Goal

Create a living, self-contained plan that lets an agent or builder continue the work without relying on private chat history.

## Inputs

- Change Intent;
- current workpad;
- relevant product and customer context;
- architecture and design docs;
- gate profile;
- known risks and stop conditions;
- expected evidence;
- any initiative, forecast, or threshold that materially affects the decision.

## Step 1: Confirm it is warranted

Create an ExecPlan for work such as:

- a significant refactor;
- a complex migration;
- ambiguous behavior;
- several viable implementation paths;
- architecture-shaping work;
- a multi-hour investigation;
- work that must survive a pause or handoff;
- work a builder should inspect before deep implementation.

Do not create one for a tiny Change merely because the repository contains a template.

## Step 2: Create the durable plan

Use:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow `docs/PLANS.md`.

The plan should cover:

- purpose and desired outcome;
- context and current state;
- strategy and concrete steps;
- validation and evidence;
- recovery and rollback;
- progress;
- discoveries and decisions;
- final outcome and learning.

Add initiative context, forecasts, thresholds, or detailed actuals only when they shape the work.

## Step 3: Review the plan when judgment matters

Request builder review before deep execution when the plan includes:

- a product tradeoff;
- new architecture;
- migration or data risk;
- material security implications;
- an irreversible choice;
- a large uncertain commitment;
- assumptions the team has not validated.

Do not require plan approval when no meaningful judgment is involved.

## Step 4: Link it from the workpad

The workpad remains the concise live state and handoff surface. Link the plan and summarize the current decision, blocker, or material change there.

## Step 5: Keep it current

Update the plan when discoveries, decisions, failures, or validation results change the approach.

When the project uses forecasts, preserve the earlier view and add a dated revision. Do not rewrite history to make the final result look inevitable.

A stale ExecPlan is worse than no ExecPlan because it looks authoritative while being wrong.

## Step 6: Close and archive it

At completion:

- record what happened and whether anything landed;
- link the evidence;
- summarize important decisions and remaining uncertainty;
- compare forecast with actual when one existed;
- update the parent initiative when applicable;
- capture the durable lesson;
- move the file to `docs/exec-plans/completed/`.

## Definition of done

The plan is complete when a capable builder or agent can understand the problem, chosen approach, proof, outcome, and important lessons without reading the original chat.
