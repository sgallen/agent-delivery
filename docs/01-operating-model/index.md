# Operating Model

The Case explains why the shift matters. The operating model explains how to respond without turning the repository into a haunted house of agent-generated branches.

The aim is not more process. It is enough structure for agents to do useful work, builders to apply judgment where it matters, and the team to improve from what actually happened.

Manage the work and the outcome—not a row of interactive sessions.

## The system at a glance

```text
customer or product intent
  → a bounded Change
  → agent execution inside a legible repository and isolated environment
  → gates and evidence
  → builder judgment where needed
  → an explicit outcome
  → learning folded back into the system
```

The system should make five things easier:

1. understand what the work is trying to accomplish;
2. let agents carry meaningful execution without constant supervision;
3. know when and why a builder should engage;
4. judge the result without reconstructing the session;
5. make the next similar Change better.

## The core model

- [**Builders**](builders.md) own outcomes, judgment, taste, risk, value, and the system itself.
- [**Agents and harnesses**](agents-harnesses-and-operating-model.md) provide execution capability and the technical conditions around it.
- [**Changes**](changes.md) carry one bounded piece of work from intent through execution, proof, decision, and learning.
- [**`WORKFLOW.md` and workpads**](workflow-and-workpads.md) separate the standing repository contract from the live state of one Change.
- [**Execution environments**](execution-environments.md) give agents a safe, observable place to run the product and its tools.
- [**Gates**](gates.md) make important quality, behavior, and risk rules durable.
- [**Evidence**](evidence.md) makes the outcome easier to judge.
- [**Builder engagement**](builder-engagement.md) places scarce human attention where it changes the result.
- [**Learning checkpoints**](learning-checkpoints.md) turn repeated friction into a better operating system.

Supporting ideas cover [reviewer agents](reviewer-agents.md), [skills](skills.md), [architecture and legibility](architecture-and-legibility.md), [scaffolding posture](scaffolding-posture.md), and [optional ExecPlans](execplans.md) for work too complex for the ordinary workpad.

## Honest endings

Most Changes are intended to deliver something. Some are investigations or experiments where the right outcome may be to stop, narrow, or take another path.

The operating model should preserve that distinction. A well-supported decision not to land can be useful. Work that merely drifted into abandonment is not the same thing.

[Not All Work Is Merge-Bound](not-all-work-is-merge-bound.md) explains the principle. The detailed resolution vocabulary belongs in [Changes](changes.md) and the supporting playbook, not in every daily conversation.

## What maturity unlocks

Once the basic path is trustworthy, the same records can support more ambitious questions:

- [**Resource observability and delivery economics**](resource-observability-and-delivery-economics.md) connect model use, infrastructure, retries, elapsed time, and builder attention to actual outcomes.
- [**Initiatives and the value loop**](initiatives-and-value.md) connect larger product bets to expected value, actual delivery, and later results.
- [**The system itself becomes an asset**](the-system-itself-becomes-an-asset.md) explains how context, gates, skills, evidence, routing history, and learning compound.

These are extensions of the same model. They should appear because the team has a decision to improve—not because a comprehensive diagram made them feel mandatory.

## The smallest credible version

A first implementation needs only:

1. a clear Change Intent;
2. a short `WORKFLOW.md`;
3. one persistent workpad;
4. an isolated enough environment;
5. a few meaningful gates;
6. evidence tied to the intended outcome;
7. an accountable decision about what happened;
8. one honest learning checkpoint.

Basic run attribution is useful when it is easy. Forecasts, hard budgets, resolution taxonomies, initiative records, and portfolio dashboards are later moves.

Start small enough to learn and serious enough to trust.
