# Operating Model

The Case explains why the shift matters. The operating model explains how to work differently without turning the repository into a haunted house of agent-generated branches.

The aim is not more process. It is enough structure for agents to do useful work, builders to apply judgment where it matters, resource use to be understood, and the system to improve rather than simply produce more output.

Manage Changes and outcomes, not interactive agent sessions. Let every artifact and ceremony earn its place by improving intent, execution, proof, resource visibility, recovery, or learning.

## The system at a glance

```text
Product investment
  Initiative value hypothesis + resource forecast, when warranted

Stable intent
  GitHub Issue / Change Intent

Standing process
  WORKFLOW.md + repo docs + skills + resource policy

Live execution
  Workpad + isolated worktree/environment + agent + run records

Proof and control
  Gates + evidence + resource checkpoints + reviewer agents

Handoff
  Builder decision + PR when work may land

Resolution and learning
  Delivered resolution, evidence-backed non-landing, accountable administrative closure, or unresolved loss
  + Change Record + initiative rollup + learning checkpoint + later outcome review
```

## Core concepts

- [**Builders**](builders.md) — humans who own outcomes, judgment, taste, risk, value, and system direction.
- [**Agents and harnesses**](agents-harnesses-and-operating-model.md) — the execution capability and the technical environment around it.
- [**Changes**](changes.md) — units of product work, from intent to evidence, actual resource use, explicit disposition, and learning.
- [**`WORKFLOW.md` and workpads**](workflow-and-workpads.md) — the standing process and the live per-Change execution surface.
- [**Gates**](gates.md) — durable expressions of quality, behavior, risk, architecture, taste, and resource policy.
- [**Evidence**](evidence.md) — the proof that makes a Change reviewable and its outcome credible.
- [**Resource observability and delivery economics**](resource-observability-and-delivery-economics.md) — how human, agent, infrastructure, time, and failure cost become attributable to outcomes and useful for estimation, routing, governance, and capacity planning.
- [**Initiatives and the value loop**](initiatives-and-value.md) — how major product bets forecast a Change funnel, preserve expected value and investment, roll up delivered and non-landed resolutions, and revisit outcomes after release or conclusion.
- [**Builder engagement**](builder-engagement.md) — how to place human attention where it creates leverage.
- [**Reviewer agents**](reviewer-agents.md) — narrow, independent judgment before scarce human review.
- [**Skills**](skills.md) — reusable procedures that encode the team’s preferred way to perform important steps.
- [**Execution environments**](execution-environments.md) — runtime isolation and metering for parallel, trustworthy work.
- [**Learning checkpoints**](learning-checkpoints.md) — how repeated judgment, variance, and product outcomes become a better system.

Supporting ideas include [architecture and legibility](architecture-and-legibility.md), [scaffolding posture](scaffolding-posture.md), [exploratory work](not-all-work-is-merge-bound.md), [optional ExecPlans](execplans.md), and [the system as a company asset](the-system-itself-becomes-an-asset.md).

## Default flow

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
```

The artifacts move with the Change:

```text
Change Intent
  + WORKFLOW.md
  + optional initiative and resource forecast
  → Workpad
  → Active Change in an isolated environment
  → Gates, evidence, and resource checkpoints
  → builder decision and PR when work may land
  → delivered resolution, evidence-backed non-landing, accountable administrative closure, or unresolved loss
  → Change Record with actuals, disposition, and landing status
  → Initiative rollup, when applicable
  → Learning Checkpoint
  → Outcome review at the initiative horizon
```

For complex work, a durable ExecPlan may be added. It is not the default path.

## Minimum viable operating model

A first implementation only needs:

1. a clear Change Intent;
2. a short `WORKFLOW.md`;
3. one persistent workpad;
4. an isolated worktree and runtime;
5. a handful of objective gates;
6. evidence tied to the applicable delivered or non-landed resolution criteria;
7. a lightweight note about the runs, builder attention, disposition, and whether anything landed;
8. a learning checkpoint that distinguishes productive resolution from unresolved loss.

Do not require a full initiative forecast, hard budget, or learned estimator before the team has one credible run record. Start with attribution. Add economic control and portfolio sophistication when real decisions need it.
