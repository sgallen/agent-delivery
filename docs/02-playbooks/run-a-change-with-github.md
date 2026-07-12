# Playbook: Run a Change with GitHub

This playbook describes the default GitHub-first implementation.

The goal is to move one GitHub Issue from stable intent to an explicit, evidence-backed disposition using `WORKFLOW.md`, a persistent workpad comment, an isolated execution environment, gates, resource attribution, and accountable judgment.

The disposition may deliver something, conclude that nothing should land, close for an external administrative reason, or expose unresolved loss. A pull request is one possible review package—not the lifecycle itself.

ExecPlans are optional. Use one only when the Change is too complex to run safely from the workpad.

## Prerequisites

The repository should have:

- `AGENTS.md` and `WORKFLOW.md`;
- a Change Intent issue template;
- lifecycle, resolution, risk, and gate-profile labels;
- a worktree convention;
- a way to start an isolated environment;
- gate commands or a gate runner;
- GitHub Actions for remote checks;
- browser, log, research, or experiment tooling when relevant;
- run-resource records or an observability path that associates usage with the Change.

## Default flow

```text
GitHub Issue / Change Intent
  + WORKFLOW.md
  + optional initiative and resource forecast
  → persistent Agent Workpad comment
  → worktree, execution environment, and run records
  → implementation, investigation, or experiment
  → gates, evidence, and resource checkpoints
  → Decision, with a PR when an artifact may land or helps review
  → Resolved delivery, decision, or administrative closure
     OR Abandoned unresolved loss
  → Change Record with actuals, disposition, landing, and release state
  → initiative rollup and learning checkpoint
```

## Step 1: Shape the Change Intent

The issue should state:

- the outcome or decision;
- why it matters;
- resolution intent and landing expectation;
- the decision question when exploratory;
- landed acceptance criteria;
- useful non-landed resolution criteria;
- non-goals and forbidden changes;
- affected surfaces;
- risk and gate profile;
- validation, decision-evidence, and review expectations;
- stop conditions;
- parent initiative, when any;
- resource estimate, confidence, expected resolution distribution, and threshold policy when warranted.

Move the issue to `state:ready` only when the system has enough information to begin. Do not add a non-landed criterion retroactively merely because delivery became inconvenient.

## Step 2: Load the repository workflow

The orchestrator and execution agent read `WORKFLOW.md` to understand:

- lifecycle and terminal states;
- workpad behavior;
- required gate profiles;
- evidence expectations for each credible disposition;
- retry, stop, and recovery rules;
- builder-engagement and decision authority;
- when a PR is required;
- resource attribution and threshold behavior;
- resolution and learning requirements.

The issue says what should be accomplished or decided. The workflow says how this repository operates.

## Step 3: Create or reuse the workpad

Find one issue comment headed:

```md
## Agent Workpad
```

Create it if it does not exist. Update it in place if it does.

Mirror the resolution intent, decision question, delivered and non-landed criteria, current plan, environment, blockers, evidence links, resource forecast, actual to date, threshold state, and candidate disposition.

There should be exactly one canonical workpad for the Change.

## Step 4: Claim the Change

Record the run identity and move the issue to `state:running`.

The claim should include:

- runner or agent identity;
- branch and worktree;
- run ID;
- environment URL when available;
- start time;
- parent initiative;
- run-resource and Change-summary locations.

This prevents two workers from quietly discovering the same issue at the same time and expressing their creativity on the same branch.

## Step 5: Create an isolated workspace

At minimum, provision:

- a dedicated branch and worktree;
- unique app and API ports;
- namespaced database and cache state;
- an isolated browser profile for UI work;
- Change-specific logs and evidence directories;
- startup and teardown commands;
- environment metering or an explicit estimation method.

A worktree isolates code. An execution environment isolates reality. You need both when behavior matters.

## Step 6: Run the execution agent

Provide:

- the issue body;
- `WORKFLOW.md`;
- the current workpad;
- relevant product, design, architecture, and initiative context;
- gate profile;
- environment details;
- relevant skills;
- resource policy and stop conditions.

The agent should:

1. inspect the context and confirm the intended resolution paths;
2. decide whether an ExecPlan is warranted;
3. implement, investigate, or experiment within scope;
4. run targeted checks early;
5. update the workpad with material discoveries and decisions;
6. preserve evidence for delivery or a non-landed conclusion;
7. update the completion forecast and candidate disposition when evidence, retries, or scope materially change them;
8. preserve provider, tool, environment, builder-attention, and attempt attribution;
9. stop and request judgment when the workflow or resource policy requires it.

## Step 7: Prove what happened

Move to `state:proving` and run the disposition-appropriate gates.

Typical gates include:

- scope;
- format, lint, typecheck, and build;
- targeted tests or experiment checks;
- behavior, browser, research, feasibility, or benchmark proof;
- console and runtime logs;
- regression checks;
- reviewer agents;
- evidence-package completeness;
- resource threshold status;
- decision-evidence sufficiency for non-landed work.

Loop while a required failure is actionable, progress continues, and the resource policy authorizes more work. Checkpoint or engage a builder when intent is missing, risk changes, the same failure repeats, forbidden scope is touched, a material forecast variance appears, a hard threshold is reached, or the evidence now supports stopping rather than implementing further.

Failed implementation gates can support a decision resolution when the failure is relevant evidence. They do not excuse weak decision evidence.

## Step 8: Assemble the decision package

When an artifact may land, open a PR containing:

- linked issue and workpad;
- concise summary;
- acceptance-criteria mapping;
- gate status and evidence;
- scope and non-goal confirmation;
- known risks, rollout, rollback, or continuing obligations;
- resource summary and material variance;
- proposed resolution class, disposition, landing, and release state;
- parent initiative and learning status.

When nothing should land, the issue, workpad, evidence artifacts, and Change summary may be the decision package. Open a PR only when the branch or artifact materially helps review.

For decision-class work, make it easy to answer:

- What question did the work answer?
- What evidence supports the conclusion?
- What uncertainty changed?
- Why is landing not justified or not required?
- What decision, forecast, or next action changes?
- What remains uncertain?

The decision package should not be the first place anyone learns what happened.

## Step 9: Make the accountable decision

Move the issue to `state:decision` when evidence and actuals are ready.

Engage builders according to consequence and judgment need:

- evidence review for low-risk, observable delivery;
- code, design, architecture, security, or specialist review when required;
- decision-evidence review for a proposed non-landed decision;
- product or initiative judgment for stop, narrow, replace, or supersede decisions;
- resource-allocation judgment when an authorized threshold is crossed;
- administrative ownership for priority, funding, policy, or ownership closure.

Select and record:

```text
resolution status
resolution class
specific disposition
landed state
released state
resolution quality
learning value
accountable owner and decision basis
```

Start conservative. Reduce human review only after a class of work and its evidence path earn trust.

## Step 10: Complete the Change Record

For a delivered, decision, or administrative resolution:

- move the issue to `state:resolved`;
- apply the matching `resolution:*` label and optional `disposition:*` label;
- summarize the final outcome in the workpad;
- link the PR when one exists, CI, and other evidence;
- record landing and deployment or release status separately;
- summarize actual model, tool, environment, elapsed-time, and builder-attention use;
- include failed, discarded, superseded, and recovery attempts;
- explain material forecast and resolution variance;
- record uncertainty reduced, decisions changed, reusable artifacts, and follow-up where applicable;
- update the parent initiative;
- complete the learning checkpoint.

When execution ends without sufficient evidence or accountable judgment:

- move the issue to `state:abandoned`;
- record `resolution_status: unresolved`, `resolution_class: unresolved_loss`, and `disposition: abandoned_without_resolution`;
- preserve actual resource use, remaining context, failure cause, and recovery ownership;
- do not call the work productively resolved merely because a retrospective exists.

A paused or blocked Change remains active until it resumes or receives an explicit terminal decision.

## Definition of done

A Change is ready to leave this workflow when:

- its terminal lifecycle state is explicit;
- the final resolution class, disposition, landing, and release state are recorded separately;
- delivered or non-landed criteria are evaluated;
- required gates are `pass`, validly `not_applicable`, formally `waived`, or preserved as relevant decision evidence;
- evidence supports the claimed resolution—or the record honestly identifies unresolved loss;
- required builder judgment is recorded;
- the issue, workpad, PR when present, labels, and resource summary agree;
- actual resource use is recorded or explicitly marked incomplete;
- material variance and threshold decisions are explained;
- the initiative rollup is updated when one exists;
- the learning checkpoint is complete.

GitHub issue closure is housekeeping. The explicit disposition and its evidence are the outcome.
