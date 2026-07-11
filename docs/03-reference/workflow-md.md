# Reference: `WORKFLOW.md`

`WORKFLOW.md` describes how agents and builders move work through a repository.

It is the standing operating contract, not the per-Change plan.

The issue carries the Change Intent. The workpad carries live state. `WORKFLOW.md` defines the process they follow.

## What belongs in `WORKFLOW.md`

Minimum contents:

- Change lifecycle and state transitions
- readiness rules
- workpad requirements
- gate profiles
- evidence expectations by Change type
- retry, stop, and blocking behavior
- builder-engagement and escalation rules
- PR and review expectations
- release and learning-checkpoint behavior.

An orchestrator may also use YAML front matter for tracker, polling, workspace, concurrency, or runner configuration. Keep the operational prose readable even when machine configuration is present.

## What does not belong

Do not turn `WORKFLOW.md` into the whole company handbook.

Link to deeper docs for:

- architecture detail
- product strategy
- design principles
- historical decisions
- long tool manuals
- optional ExecPlan standards.

## Skeleton

```markdown
# WORKFLOW.md

## Change lifecycle

Proposed → Shaped → Ready → Running → Proving → Review → Released

## Readiness

A Change is ready when...

## Workpad

Every orchestrated Change maintains one persistent comment headed `## Agent Workpad`.

## Execution environment

Each Active Change receives...

## Gates and loop behavior

Required gates by profile...
Repair and retry when...
Stop and engage a builder when...

## Evidence

Required evidence by Change type...

## Review and release

Review requirements and state transitions...

## Learning checkpoint

Every meaningful Change asks what should improve in the system.
```

## Quality test

A capable agent should be able to answer these questions from `WORKFLOW.md`:

- Can I start this Change?
- Where do I record live state?
- What proof is required?
- When should I keep working?
- When must I stop?
- Who needs to review the result?
- What happens after release?

If agents repeatedly miss a workflow step, improve `WORKFLOW.md` or a skill.

If `WORKFLOW.md` becomes too long to follow, move deeper guidance into linked docs.
