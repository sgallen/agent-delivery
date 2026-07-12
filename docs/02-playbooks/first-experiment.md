# Playbook: Run the First Experiment

Use this when the ideas make sense but the operating model is still theoretical.

The goal is not to automate the whole company. The goal is to run one real Change through a small, inspectable version of the system and learn whether the path can produce a trustworthy delivery **or** a trustworthy decision.

## Outcome

By the end, you should have:

- one GitHub Issue with a clear Change Intent and resolution intent;
- one persistent `## Agent Workpad` comment;
- one isolated worktree and runtime environment;
- one or more attributable agent runs;
- a small set of disposition-appropriate gates;
- either a reviewable artifact that may land or an evidence package supporting a non-landed decision;
- an explicit resolution class, disposition, landing state, and release state—or an honestly recorded unresolved loss;
- one lightweight run-resource record and Change summary;
- one learning checkpoint.

The first experiment does not need to merge. It does need to end honestly.

## Pick the right Change

Choose work that is:

- real enough to matter;
- small enough to understand;
- low risk;
- easy to observe;
- easy to reverse or stop;
- capable of reaching a useful decision within a bounded resource envelope.

A low-risk bug with a deterministic failure signal is often the best delivery-oriented first experiment. A narrow feasibility spike or product prototype can be a good decision-oriented first experiment when the decision question is explicit.

Avoid billing, authentication, migrations, broad refactors, and anything whose main requirement is “use good judgment” with no further explanation. We are testing the system, not its appetite for danger.

## Step 1: Define the resolution intent before execution

Create a GitHub Issue that states:

- the outcome or decision;
- why it matters;
- whether the intent is delivery, experiment, investigation, or either path depending on evidence;
- whether landing is expected, possible, or not required;
- the decision question for exploratory work;
- landed acceptance criteria;
- useful non-landed resolution criteria;
- non-goals and forbidden changes;
- risk, validation, evidence, and stop conditions;
- an optional expected resource range and confidence, or explicit `not set` for the first run.

Do not invent a non-landed success criterion after the implementation becomes difficult. The evidence bar should exist before the result is known.

## Step 2: Choose the minimum gates

Start with a small set appropriate to the intended resolution:

- scope;
- format, lint, typecheck, or build when code is involved;
- targeted tests or experiment checks;
- behavior, research, feasibility, or decision proof;
- failing-before and passing-after reproduction for a bug fix;
- browser console or runtime-log checks when relevant;
- evidence completeness;
- resource checkpoint when a threshold exists.

For delivered work, implementation gates normally need to pass. For a decision resolution, an implementation failure may itself be evidence, but the decision and evidence gates still need to pass.

## Step 3: Create the workpad

Create one issue comment headed:

```md
## Agent Workpad
```

Mirror the resolution intent, decision question, delivered and non-landed criteria, initial plan, environment, resource posture, gates, and evidence links.

The issue body stays stable. The workpad changes as the work changes.

## Step 4: Create an isolated environment

At minimum, use:

- a dedicated branch;
- a Git worktree;
- unique ports and mutable state;
- an isolated browser profile for UI work;
- Change-specific logs and artifacts.

A clean environment is part of the proof. Shared mutable state turns evidence into guesswork.

## Step 5: Let the agent execute the intent

Give the agent:

- the issue;
- `WORKFLOW.md`;
- the workpad;
- relevant repository context;
- the gate profile;
- environment details;
- the resource and stop policy.

Ask it to implement, investigate, or experiment; update the workpad; run the gates; preserve each attempt; gather evidence; and stop when the defined evidence or resource condition calls for a decision.

Do not rescue it at the first sign of friction. Observe where the system is weak. Step in when judgment is genuinely required or the run is no longer making progress.

## Step 6: Move from proving to decision

Review more than the diff. Inspect:

- whether the delivered or non-landed criteria were evaluated;
- whether forbidden changes were avoided;
- tests, screenshots, behavior, logs, research, benchmarks, or feasibility results;
- the size and focus of any artifact;
- reviewer-agent findings;
- all recorded machine and builder attention, including failed or discarded attempts;
- the proposed resolution class and specific disposition;
- whether landing or release actually occurred;
- whether the evidence supports the conclusion.

A PR is useful when something may land or the branch itself is useful decision evidence. It is not mandatory for every experiment or investigation.

## Step 7: Resolve or record the loss honestly

Use one of these paths:

```text
delivered
  → acceptance criteria met
  → artifact landed or released according to policy

decision
  → work-derived evidence supports a useful non-landed decision
  → uncertainty, changed decision, and follow-up are explicit

administrative
  → an accountable owner closes for an external priority, policy, funding, or ownership reason
  → no unearned product or technical learning is claimed

unresolved_loss
  → execution ended without sufficient evidence or accountable resolution
  → resource use, remaining context, cause, and recovery ownership stay visible
```

Move delivered, decision, or administrative work to `state:resolved`. Move unresolved loss to `state:abandoned`. `state:blocked` and `state:paused` remain resumable; they are not substitutes for a terminal decision.

## Step 8: Complete the learning checkpoint

Ask:

> What made this harder, riskier, more expensive, less decisive, or more manual than it needed to be?

Promote only useful learning:

- unclear intent → improve the issue template;
- weak decision criteria → improve shaping;
- missing context → improve repository docs;
- repeated bad behavior → add a gate or regression test;
- clumsy debugging → improve a skill;
- environment collision → improve isolation;
- unnecessary human review → improve evidence or reviewer agents;
- surprising resource use or resolution mix → improve the next estimate, route, environment, Change boundary, or stop rule;
- unresolved loss → improve ownership, recovery, preservation, or escalation.

## Definition of done

The first experiment is complete when:

- the Change is `Resolved` as delivered, decision, or administrative—or is explicitly `Abandoned` as unresolved loss;
- the issue and workpad tell the story without private chat history;
- the evidence supports the classification and disposition;
- landing and release are recorded separately;
- the resource record includes every known attempt and states its gaps;
- at least one system improvement was considered;
- you know what should change before the second experiment.

The purpose of the first run is not to prove the doctrine. It is to produce the first useful evidence about how the system should deliver, decide, stop, and learn.
