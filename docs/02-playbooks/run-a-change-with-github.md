# Playbook: Run a Change with GitHub

This playbook describes the default GitHub-first implementation.

The goal is to move one GitHub Issue from stable intent to an evidence-backed review outcome using `WORKFLOW.md`, a persistent workpad comment, an isolated execution environment, and explicit gates.

ExecPlans are optional. Use one only when the Change is too complex to run safely from the workpad.

## Prerequisites

The repository should have:

- `AGENTS.md` and `WORKFLOW.md`
- a Change Intent issue template
- lifecycle, risk, and gate-profile labels
- a worktree convention
- a way to start an isolated environment
- gate commands or a gate runner
- GitHub Actions for remote checks
- browser/log tooling when relevant.

## Default flow

```text
GitHub Issue / Change Intent
  + WORKFLOW.md
  → persistent Agent Workpad comment
  → worktree and execution environment
  → agent implementation
  → gates and evidence
  → PR and required review
  → Change Record
  → learning checkpoint
```

## Step 1: Shape the Change Intent

The issue should state:

- the outcome
- why it matters
- acceptance criteria
- non-goals
- forbidden changes
- affected surfaces
- risk level
- gate profile
- validation and evidence expectations.

Move the issue to `state:ready` only when the system has enough information to begin.

## Step 2: Load the repo workflow

The orchestrator and implementation agent read `WORKFLOW.md` to understand:

- lifecycle and state transitions
- workpad behavior
- required gate profiles
- evidence expectations
- retry and stop rules
- builder-engagement conditions
- PR and learning-checkpoint requirements.

The issue says what to do. The workflow says how this repo works.

## Step 3: Create or reuse the workpad

Find one issue comment headed:

```md
## Agent Workpad
```

Create it if it does not exist. Update it in place if it does.

Copy the acceptance criteria and validation requirements into the workpad. Add the current plan, environment, blockers, and evidence links.

There should be exactly one canonical workpad for the Change.

## Step 4: Claim the Change

Record the run identity and move the issue to `state:running`.

The claim should include:

- runner or agent identity
- branch
- worktree
- run ID
- environment URL when available
- start time.

This prevents two workers from quietly discovering the same issue at the same time and expressing their creativity on the same branch.

## Step 5: Create an isolated workspace

At minimum, provision:

- a dedicated branch and worktree
- unique app/API ports
- namespaced database and cache state
- an isolated browser profile for UI work
- Change-specific logs and evidence directories
- startup and teardown commands.

A worktree isolates code. An execution environment isolates reality. You need both.

## Step 6: Run the implementation agent

Provide:

- the issue body
- `WORKFLOW.md`
- the current workpad
- relevant product, design, and architecture docs
- gate profile
- environment details
- relevant skills
- instructions to update the workpad as the state changes.

The agent should:

1. inspect the context;
2. decide whether an ExecPlan is warranted;
3. implement within scope;
4. run targeted checks early;
5. update the workpad with discoveries and decisions;
6. produce evidence tied to the acceptance criteria.

## Step 7: Prove the Change

Move to `state:proving` and run the required gates.

Typical gates include:

- scope
- format/lint
- typecheck/build
- targeted tests
- behavior or browser proof
- console and runtime logs
- regression checks
- reviewer agents
- evidence-package completeness.

Failed required gates return concise evidence to the implementation agent.

Loop while the failure is actionable and progress continues. Block or engage a builder when intent is missing, risk changes, the same failure repeats, forbidden scope is touched, or judgment is required.

## Step 8: Open the PR as a review package

The PR should include:

- linked issue and workpad
- concise summary
- acceptance-criteria mapping
- gate status
- evidence links
- scope and non-goal confirmation
- known risks or gaps
- reviewer-agent findings
- learning-checkpoint status.

The PR should not be the first place anyone learns what happened.

## Step 9: Engage the right builders

Choose review based on the Change:

- evidence review for low-risk, observable work
- code review for implementation risk
- design review for taste and interaction concerns
- architecture or security review for high-consequence decisions
- human-led resolution when reviewer agents disagree or evidence is weak.

Start conservative. Reduce human review only after the Change class earns trust.

## Step 10: Complete the Change Record

After merge, release, deliberate rejection, or block:

- update the issue state
- summarize the final outcome in the workpad
- link the PR, CI, and evidence
- record any deployment status
- complete the learning checkpoint
- create follow-up Changes for durable improvements.

## Definition of done

A Change is ready to leave this workflow when:

- acceptance criteria are met or the rejection is explicit
- required gates are `pass`, validly `not_applicable`, or formally `waived`
- evidence is linked and reviewable
- required builder judgment is recorded
- the issue, workpad, and PR agree on the outcome
- the learning checkpoint is complete.
