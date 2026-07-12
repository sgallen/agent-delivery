# Playbook: Run a Change with GitHub

GitHub can carry the operating model without pretending that a pull request *is* the operating model.

Use the Issue for stable intent, one persistent comment for live state, the branch and environment for the work, gates and artifacts for proof, and an explicit decision for the outcome. Open a PR when something may land or when the branch itself helps the review.

## Before you begin

The repository should have:

- a concise `AGENTS.md` and `WORKFLOW.md`;
- a Change Intent issue template;
- one workpad convention;
- branch, worktree, and runtime conventions;
- a small set of gate profiles;
- an evidence path.

ExecPlans, detailed run records, resource forecasts, and initiative links are optional. Add them when the work needs them.

## The flow

```text
Issue: stable Change Intent
  → Workpad: live plan and state
  → Branch + environment: isolated execution
  → Gates + artifacts: proof
  → Builder decision
  → Explicit outcome
  → Learning folded back into the system
```

## 1. Shape the Issue

The issue should answer:

- What outcome or decision matters?
- Why now?
- What is in and out of scope?
- What would count as proof?
- What risks or stop conditions matter?
- Is landing expected, optional, or irrelevant?

Move the issue to `state:ready` only when execution can begin without someone privately filling in the important parts.

For work that may not land, define the useful decision path before the result is known. See [Not All Work Is Merge-Bound](../01-operating-model/not-all-work-is-merge-bound.md).

## 2. Load the repository contract

The agent reads `WORKFLOW.md` for the standing rules: lifecycle, workpad behavior, environment setup, gates, evidence, retries, stopping, builder engagement, and completion.

The issue says what this Change needs. The workflow says how this repository works.

## 3. Create or reuse the workpad

Find one issue comment headed:

```md
## Agent Workpad
```

Create it once and update it in place. It should carry the current plan, environment, discoveries, blockers, evidence links, and proposed next decision.

Do not create a trail of progress comments that forces the next person to perform archaeology.

## 4. Claim and isolate the work

Record the run ID, branch, worktree, environment, and start time. Then move the issue to `state:running`.

Provision enough isolation for the behavior you need to prove:

- a dedicated branch and worktree;
- unique ports and mutable state where necessary;
- isolated browser state for UI work;
- Change-specific logs and artifacts;
- clear startup and teardown commands.

A worktree protects the files. It does not protect a shared database, port, browser session, or queue.

## 5. Execute and keep the state legible

Give the agent the issue, workflow, workpad, relevant product and architecture context, gate profile, environment details, skills, and stop policy.

The agent investigates, plans, executes, runs targeted checks early, repairs failures, and keeps the workpad current. Material changes in scope, risk, or likely outcome belong in the record while they are happening—not in a polished summary after everyone has forgotten the messy part.

Let the agent continue while failures are actionable and progress is visible. Pause for judgment when intent conflicts, risk rises, forbidden scope is touched, evidence points toward stopping, or the run is wandering.

## 6. Prove what happened

Move the issue to `state:proving` and run the gates appropriate to the claim.

For delivered work, that may include scope, build, tests, browser behavior, logs, regression checks, and reviewer findings. For experiments or investigations, the important proof may be research, benchmark results, feasibility constraints, or customer evidence.

A failed implementation check can be useful evidence for a decision not to proceed. It does not excuse weak reasoning or an incomplete evidence package.

The goal is not a wall of green badges. It is enough credible evidence for an accountable person to judge the outcome.

## 7. Assemble the decision package

Open a PR when an artifact may land or the branch materially helps review. Keep it concise:

- link the issue and workpad;
- explain what changed or what was learned;
- map the evidence to the original criteria;
- note scope, risk, rollout, rollback, and known gaps;
- state the proposed outcome and whether anything should land.

When nothing should land, the issue, workpad, and evidence artifacts may be enough.

The package should make four questions easy to answer: *What did we set out to do? What happened? Why should we accept this result? What remains?*

## 8. Decide and close the record

Move the issue to `state:decision` and involve the builders whose judgment the consequence requires.

Record what actually happened. The work may deliver capability, produce a well-supported decision, close for an external reason, or end without a defensible conclusion. Landing and release are separate facts.

Update the workpad and learning checkpoint. Preserve failed or discarded attempts when they materially affected confidence or the next decision.

When initiative or resource tracking is enabled, reconcile those records now rather than making them somebody else’s archaeology project.

## Definition of done

The Change can leave the workflow when:

- its outcome is explicit;
- the evidence supports the claim, or the record honestly names the gap;
- required builder judgment is recorded;
- the issue, workpad, and PR when present agree;
- landing and release are clear;
- the learning checkpoint is complete;
- optional initiative, run, or resource records are current when the project uses them.

Closing the GitHub Issue is housekeeping. The outcome is the decision and the evidence behind it.
