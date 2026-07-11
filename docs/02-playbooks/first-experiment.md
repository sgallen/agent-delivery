# Playbook: Run the First Experiment

Use this when the ideas make sense but the operating model is still theoretical.

The goal is not to automate the whole company. The goal is to run one real Change through a small, inspectable version of the system and learn from it.

## Outcome

By the end, you should have:

- one GitHub Issue with a clear Change Intent
- one persistent `## Agent Workpad` comment
- one isolated worktree and runtime environment
- one agent-produced implementation
- a small set of green gates
- an evidence-backed PR or a documented reason not to merge
- one learning checkpoint.

## Pick the right Change

Choose work that is:

- real enough to matter
- small enough to understand
- low risk
- easy to observe
- easy to reverse.

A low-risk bug with a deterministic failure signal is often the best first experiment. It gives the system a concrete job: reproduce, fix, and prove. See [Fix a Bug with Proof](fix-a-bug-with-proof.md).

Good examples:

- fix a known UI bug
- remove an unwanted action
- improve an empty state
- add a missing regression test
- make a small accessibility correction
- update documentation that can be checked mechanically.

Avoid billing, authentication, migrations, broad refactors, and anything whose main requirement is “use good judgment” with no further explanation. We are testing the system, not its appetite for danger.

## Step 1: Write the Change Intent

Create a GitHub Issue that states:

- the outcome
- why it matters
- acceptance criteria
- non-goals
- forbidden changes
- risk level
- required validation
- required evidence.

Do not prescribe every implementation detail. Give the agent enough room to work and enough boundaries not to wander.

## Step 2: Choose the minimum gates

Start with a small set:

- scope
- lint or format
- typecheck or build
- targeted tests
- behavior proof
- a failing-before, passing-after reproduction for bug fixes
- browser console or runtime log check when relevant.

Each gate needs a clear pass condition and evidence.

## Step 3: Create the workpad

Create one issue comment headed:

```md
## Agent Workpad
```

Copy the acceptance criteria and validation requirements into it. Add the initial plan, environment details, and evidence links.

The issue body stays stable. The workpad changes as the work changes.

## Step 4: Create an isolated environment

At minimum, use:

- a dedicated branch
- a Git worktree
- unique ports
- an isolated browser profile for UI work
- Change-specific logs and artifacts.

A clean environment is part of the proof. Shared mutable state turns evidence into guesswork.

## Step 5: Let the agent work

Give the agent:

- the issue
- `WORKFLOW.md`
- the workpad
- the relevant repo docs
- the gate profile
- the environment details.

Ask it to implement, update the workpad, run the gates, repair failures, and prepare evidence.

Do not rescue it at the first sign of friction. Observe where the system is weak. Step in when judgment is genuinely required or the run is no longer making progress.

## Step 6: Review the outcome, not just the diff

Inspect:

- whether the acceptance criteria are met
- whether forbidden changes were avoided
- the screenshots, behavior, logs, and test output
- the size and focus of the diff
- any reviewer-agent findings
- whether the result actually solves the problem.

The code matters. The outcome matters more.

## Step 7: Complete the learning checkpoint

Ask:

> What made this harder, riskier, or more manual than it needed to be?

Promote only useful learning:

- unclear intent → improve the issue template
- missing context → improve repo docs
- repeated bad behavior → add a gate or regression test
- clumsy debugging → improve a skill
- environment collision → improve isolation
- unnecessary human review → improve evidence or reviewer agents.

## Definition of done

The first experiment is complete when:

- the Change is merged, deliberately discarded, or clearly blocked
- the issue and workpad tell the story without private chat history
- the evidence supports the outcome
- at least one system improvement was considered
- you know what you would change before the second experiment.

The purpose of the first run is not to prove the doctrine. It is to produce the first useful piece of evidence about how your system should work.
