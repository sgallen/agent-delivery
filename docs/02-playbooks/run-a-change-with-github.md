# Playbook: Run a Change with GitHub

GitHub can carry the operating model without pretending that a pull request *is* the operating model.

Use the Issue for stable intent, one persistent comment for live execution, the branch and environment for the work, gates and artifacts for proof, and an explicit decision for resolution. Open a PR when something may land or when the branch itself helps the decision.

## Before you begin

The repository should have:

- a concise `AGENTS.md` and `WORKFLOW.md`;
- a Change Intent issue template;
- one workpad convention;
- isolated branch, worktree, and runtime conventions;
- a small set of gate profiles;
- an evidence path;
- a way to associate runs and resource use with the Change.

ExecPlans are optional. Use one when the work is too complex, risky, or long-running to remain coherent in the workpad alone.

## The flow

```text
Issue: stable Change Intent
  → Workpad: live plan and state
  → Branch + environment: isolated execution
  → Gates + artifacts: proof
  → Builder decision
  → Resolved outcome or honestly recorded loss
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
- Which initiative does this support, if any?
- Is a resource range or threshold useful here?

Move the issue to `state:ready` only when execution can begin without someone privately filling in the important parts.

For work that may not land, define the useful decision path before the result is known. See [Not All Work Is Merge-Bound](../01-operating-model/not-all-work-is-merge-bound.md).

## 2. Load the repository contract

The agent reads `WORKFLOW.md` for the standing rules: lifecycle, workpad behavior, gates, evidence, retry and stop conditions, builder engagement, resource thresholds, and resolution.

The issue says what this Change needs. The workflow says how this repository works.

## 3. Create or reuse the workpad

Find one issue comment headed:

```md
## Agent Workpad
```

Create it once and update it in place. It should carry the current plan, environment, discoveries, blockers, evidence links, resource status, and proposed next decision.

Do not create a trail of progress comments that forces the next person to perform archaeology.

## 4. Claim and isolate the work

Record the run ID, agent or runner, branch, worktree, environment, and start time. Then move the issue to `state:running`.

Provision enough isolation for the behavior you need to prove:

- dedicated branch and worktree;
- unique ports and mutable state;
- isolated browser state for UI work;
- Change-specific logs and artifacts;
- clear startup and teardown commands;
- a resource identity when usage is being measured.

A worktree protects the files. It does not protect a shared database, port, browser session, or queue.

## 5. Execute and keep the state legible

Give the agent the issue, workflow, workpad, relevant product and architecture context, gate profile, environment details, skills, and stop policy.

The agent should investigate, plan, execute, run targeted checks early, repair failures, and keep the workpad current. Material changes in scope, risk, forecast, or likely disposition belong in the record while they are happening—not in a polished summary written after everyone has forgotten the messy part.

Loop while failures are actionable, progress continues, and the resource policy allows more work. Pause for judgment when intent conflicts, risk rises, forbidden scope is touched, evidence points toward stopping, or the run is burning effort without learning.

## 6. Prove what happened

Move the issue to `state:proving` and run the gates appropriate to the claim.

For delivered work, that may include scope, build, tests, browser behavior, logs, regression checks, and reviewer-agent findings. For experiments or investigations, the important proof may be research, benchmark results, feasibility constraints, or customer evidence.

A failed implementation check can be useful evidence for a decision not to proceed. It does not excuse weak reasoning or an incomplete evidence package.

The goal is not a wall of green badges. It is enough credible evidence for an accountable person to judge the outcome.

## 7. Assemble the decision package

Open a PR when an artifact may land or the branch materially helps review. Keep it concise:

- link the issue and workpad;
- explain what changed or what was learned;
- map the evidence to the original criteria;
- note scope, risk, rollout, rollback, and continuing obligations;
- summarize resource use and material variance;
- state the proposed resolution and whether anything has landed or released.

When nothing should land, the issue, workpad, evidence artifacts, and Change summary may be enough.

The decision package should make it easy to answer: *What did we set out to do? What happened? Why should we accept this result? What remains?*

## 8. Decide and close the record

Move the issue to `state:decision` and involve the builders whose judgment the consequence requires: product, design, architecture, security, specialist review, resource allocation, or administrative ownership.

Record the actual outcome. Delivered capability, a useful non-landed decision, external administrative closure, and unresolved loss are not interchangeable. Landing and release are separate facts.

For resolved work, update the workpad, labels, resource summary, initiative rollup, and learning checkpoint. Preserve failed, discarded, and recovery attempts when they materially affected the outcome.

When execution ends without enough evidence or accountable judgment, mark it as unresolved loss and preserve the state, cost, cause, and recovery owner. Do not promote it to “learning” by tone of voice.

## Definition of done

The Change can leave the workflow when:

- its terminal state and disposition are explicit;
- the evidence supports the claim—or the record honestly names unresolved loss;
- required builder judgment is recorded;
- the issue, workpad, PR when present, labels, and resource summary agree;
- landing and release are recorded separately;
- actual resource use is present or marked incomplete;
- material variance and threshold decisions are explained;
- the initiative rollup is current when one exists;
- the learning checkpoint is complete.

Closing the GitHub Issue is housekeeping. The outcome is the decision and the evidence behind it.
