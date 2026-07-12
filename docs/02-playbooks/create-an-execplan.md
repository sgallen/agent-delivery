# Playbook: Create an ExecPlan

Use this when a Change is too large, ambiguous, risky, materially constrained, or important to run from the workpad alone.

An ExecPlan is optional. It is not the default for every Change.

## Goal

Create a living, self-contained plan that lets an agent or builder continue the Change without relying on private chat history and preserves the reasoning behind material resource decisions.

## Inputs

- Change Intent
- parent initiative and value hypothesis, when one exists
- current workpad
- relevant product and customer context
- architecture and design docs
- gate profile
- current resource forecast, range, confidence, and thresholds
- known capacity constraints
- known risks
- expected evidence
- resolution intent, landing expectation, delivered criteria, useful non-landed criteria, and stop conditions.

## Step 1: Confirm it is warranted

Create an ExecPlan for:

- multi-hour work
- significant refactors
- complex migrations
- ambiguous behavior
- multiple implementation paths
- architecture-shaping work
- work that must be restartable
- work a builder should inspect before implementation
- work whose resource or scope decision materially affects an initiative.

Do not create one for a tiny Change merely because the repo contains a template.

## Step 2: Create the durable plan

Use:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow `docs/PLANS.md`.

The plan should cover:

- purpose and desired outcome
- initiative and value context
- context and current state
- implementation strategy
- concrete steps
- resource forecast and constraints
- soft and hard threshold behavior
- delivered and non-landed resolution criteria
- validation and evidence
- recovery and rollback
- progress
- discoveries
- decisions
- final outcome, actuals, and variance.

## Step 3: Review the plan when judgment matters

Before deep execution, request builder review when the plan includes:

- a product tradeoff
- new architecture
- migration or data risk
- material security implications
- irreversible choices
- a large or uncertain resource envelope
- a scarce human or environment constraint
- assumptions the team has not validated.

Do not require plan approval when no meaningful judgment is involved.

## Step 4: Link it from the workpad

The workpad remains the concise live state, threshold checkpoint, and handoff surface. Link the plan and summarize any current decision, variance, or blocker there.

## Step 5: Keep it current

Update the plan when discoveries, decisions, failures, validation results, or resource thresholds change the approach.

Preserve prior estimates. Add a dated revised forecast and explain what new information changed it.

A stale ExecPlan is worse than no ExecPlan because it looks authoritative while being wrong.

## Step 6: Close and archive it

At completion:

- record the resolution status, class, specific disposition, landing state, and release state
- record what shipped, what did not, and which decision question was answered
- link the evidence
- compare forecast with actual and explain material variance
- summarize important decisions
- update the parent initiative, when applicable
- capture learning
- move the file to `docs/exec-plans/completed/`.

## Definition of done

The plan is complete when a capable builder or agent can understand the problem, the chosen approach, the resource and threshold decisions, the proof, the outcome, and the important lessons without reading the original chat.
