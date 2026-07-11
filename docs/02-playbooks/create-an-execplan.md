# Playbook: Create an ExecPlan

Use this when a Change is too large, ambiguous, risky, or important to run from the workpad alone.

An ExecPlan is optional. It is not the default for every Change.

## Goal

Create a living, self-contained plan that lets an agent or builder continue the Change without relying on private chat history.

## Inputs

- Change Intent
- current workpad
- relevant product and customer context
- architecture and design docs
- gate profile
- known risks
- expected evidence.

## Step 1: Confirm it is warranted

Create an ExecPlan for:

- multi-hour work
- significant refactors
- complex migrations
- ambiguous behavior
- multiple implementation paths
- architecture-shaping work
- work that must be restartable
- work a builder should inspect before implementation.

Do not create one for a tiny Change merely because the repo contains a template.

## Step 2: Create the durable plan

Use:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow `docs/PLANS.md`.

The plan should cover:

- purpose and desired outcome
- context and current state
- implementation strategy
- concrete steps
- validation and evidence
- recovery and rollback
- progress
- discoveries
- decisions
- final outcome.

## Step 3: Review the plan when judgment matters

Before deep execution, request builder review when the plan includes:

- a product tradeoff
- new architecture
- migration or data risk
- material security implications
- irreversible choices
- assumptions the team has not validated.

Do not require plan approval when no meaningful judgment is involved.

## Step 4: Link it from the workpad

The workpad remains the concise live state and handoff surface. Link the plan and summarize any current decision or blocker there.

## Step 5: Keep it current

Update the plan when discoveries, decisions, failures, or validation results change the approach.

A stale ExecPlan is worse than no ExecPlan because it looks authoritative while being wrong.

## Step 6: Close and archive it

At completion:

- record what shipped and what did not
- link the evidence
- summarize important decisions
- capture learning
- move the file to `docs/exec-plans/completed/`.

## Definition of done

The plan is complete when a capable builder or agent can understand the problem, the chosen approach, the proof, the outcome, and the important lessons without reading the original chat.
