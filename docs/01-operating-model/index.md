# Operating Model

The Case explains why the shift matters. The operating model explains how to work differently without turning the repository into a haunted house of agent-generated branches.

The aim is not more process. It is enough structure for agents to do useful work, builders to apply judgment where it matters, and the system to improve rather than simply produce more output.

Manage Changes and outcomes, not interactive agent sessions. Let every artifact and ceremony earn its place by improving intent, execution, proof, recovery, or learning.

## The system at a glance

```text
Stable intent
  GitHub Issue / Change Intent

Standing process
  WORKFLOW.md + repo docs + skills

Live execution
  Workpad + isolated worktree/environment + agent

Proof
  Gates + evidence + reviewer agents

Handoff
  PR / release decision

Learning
  Change Record + learning checkpoint
```

## Core concepts

- [**Builders**](builders.md) — humans who own outcomes, judgment, taste, risk, and system direction.
- [**Agents and harnesses**](agents-harnesses-and-operating-model.md) — the execution capability and the technical environment around it.
- [**Changes**](changes.md) — units of product work, from intent to evidence to learning.
- [**`WORKFLOW.md` and workpads**](workflow-and-workpads.md) — the standing process and the live per-Change execution surface.
- [**Gates**](gates.md) — durable expressions of quality, behavior, risk, architecture, and taste.
- [**Evidence**](evidence.md) — the proof that makes a Change reviewable.
- [**Builder engagement**](builder-engagement.md) — how to place human attention where it creates leverage.
- [**Reviewer agents**](reviewer-agents.md) — narrow, independent judgment before scarce human review.
- [**Skills**](skills.md) — reusable procedures that encode the team’s preferred way to perform important steps.
- [**Execution environments**](execution-environments.md) — runtime isolation for parallel, trustworthy work.
- [**Learning checkpoints**](learning-checkpoints.md) — how repeated judgment becomes a better system.

Supporting ideas include [architecture and legibility](architecture-and-legibility.md), [scaffolding posture](scaffolding-posture.md), [exploratory work](not-all-work-is-merge-bound.md), [optional ExecPlans](execplans.md), and [the system as a company asset](the-system-itself-becomes-an-asset.md).

## Default flow

```text
Proposed → Shaped → Ready → Running → Proving → Review → Released
```

The artifacts move with the Change:

```text
Change Intent
  + WORKFLOW.md
  → Workpad
  → Active Change in an isolated environment
  → Gates and evidence
  → PR / review
  → Change Record
  → Learning Checkpoint
```

For complex work, a durable ExecPlan may be added. It is not the default path.

## Minimum viable operating model

A first implementation only needs:

1. a clear Change Intent;
2. a short `WORKFLOW.md`;
3. one persistent workpad;
4. an isolated worktree and runtime;
5. a handful of objective gates;
6. evidence tied to the acceptance criteria;
7. a learning checkpoint.

Start there. Add structure when real failures earn it.
