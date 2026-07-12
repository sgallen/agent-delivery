# Playbook: The First 30 Days

A month is long enough to learn something real and short enough to resist turning the experiment into a transformation program.

The aim is modest: establish one credible path for a narrow class of Changes, run enough work through it to expose the weak points, and decide whether to expand, hold, or redesign.

## What good looks like after 30 days

You should have:

- one product or repository in scope;
- one safe, observable class of Changes;
- two to five builders who have used the path themselves;
- three to five completed Change records;
- a working issue, workflow, workpad, environment, gate, and evidence pattern;
- a small baseline for cycle time, human attention, quality, and rework;
- basic machine-cost or run data when it is readily available;
- a few system improvements already applied;
- an explicit next decision.

Do not ask the first month to prove every future use case. Ask it to prove that one bounded path can become trustworthy and improve.

## Ground rules

Keep the scope deliberately small.

Use real product work, not a theatrical side project. Keep the quality bar. Give the pilot group permission to remove ceremony that does not help meet it. Do not reorganize the company, buy a large platform, or build a general-purpose orchestrator before the first useful Change can move end to end.

Do not let measurement become the pilot. A Change ID and run ID are useful. Basic model, environment, or builder-attention data is worth capturing when it comes cheaply. The core evidence is still whether the path produced trustworthy work with a manageable human burden.

## Week 1: Build the smallest credible path

### Choose one Change class

Good starting points include customer-reported bugs with a reliable reproduction, small UI behavior fixes, regression tests, documentation maintenance, or narrow internal tooling.

Avoid migrations, billing, sensitive security paths, and broad architecture work. Trust is easier to build where the result is observable and reversible.

### State the experiment

Name the improvement you expect. For example:

- reduce the time from a reported bug to reviewable proof;
- reduce senior review minutes for a safe UI Change;
- improve the percentage of Changes arriving with credible behavior evidence;
- let product-facing builders move a narrow class of work further without waiting in an implementation queue.

Capture only the baseline needed to judge that claim: elapsed time, active builder time, review time, rework, quality signals, interventions, and machine cost when it is readily available. Precision is less important than an honest comparison.

### Add the minimum operating system

Create:

- a clear Change Intent template;
- a short repository map in `AGENTS.md`;
- a repo-owned `WORKFLOW.md`;
- one persistent workpad pattern;
- one gate profile;
- one evidence checklist;
- one learning checkpoint.

Add a lightweight resource record only when the project can capture it without making the first workflow harder to understand.

Make the environment usable: dedicated worktrees, reproducible setup, isolated mutable state, visible logs, and one obvious way to run the local proof set.

If a builder cannot understand the workflow before the coffee gets cold, the first version is too large.

## Week 2: Run three real Changes

For each Change:

1. Shape the intent, proof, risk, and stop conditions.
2. Create the workpad and isolated environment.
3. Let the agent investigate, execute, test, and gather evidence.
4. Bring in a builder where judgment or a true blocker requires it.
5. Resolve the work explicitly and record whether anything landed.
6. Capture one lesson about the system.
7. When you made a forecast or captured resource data, compare it with what happened.

Do not quietly rescue every rough run. That hides the very information the pilot exists to find.

Do not let a broken run wander forever either. Stop when it is no longer making progress, preserve the state, and make the failure legible.

## Week 3: Improve the path

Review the first runs together. Look for repeated friction rather than isolated annoyance.

You may find that the issue lacked context, the agent could not observe the product, a gate produced useless feedback, review kept rediscovering the same rule, a cheap model created expensive recovery, or the workpad asked for more maintenance than value.

Fix two or three of those things in the system:

- improve a template or repository guide;
- add a reusable skill or regression check;
- make a gate message actionable;
- expose a missing log, trace, or browser signal;
- narrow the Change boundary;
- adjust the routing or stop rule;
- remove an artifact that did not earn its keep.

A backlog of possible improvements is not the same as an improved system.

## Week 4: Run again and decide

Put one or two more Changes through the revised path. Then hold a short operating review.

Ask:

- Did the class of work move faster?
- Did total human attention fall, rise, or merely move downstream?
- Did the evidence make review easier?
- Which failures repeated?
- Where was builder judgment genuinely valuable?
- What became the practical constraint—shaping, review, environment, release capacity, or something else?
- Is this path ready for another class of work?

Choose one answer:

### Expand

Add one adjacent Change class because the current path has earned trust.

### Hold

Keep the scope stable and improve the system before adding volume or risk.

### Redesign

A weak assumption, environment, gate, or ownership model needs another bounded experiment.

None of those answers is embarrassing. Pretending the path works when the evidence says otherwise is the embarrassing part.

## The 30-day review

Keep the review short enough that people will read it. Record:

- the original hypothesis and Change class;
- the Changes run and how they resolved;
- what landed;
- baseline and current measures;
- machine, environment, and builder-attention data when measured, with known gaps;
- estimate-versus-actual observations when a useful forecast existed;
- the current constraint;
- improvements already made;
- the expand, hold, or redesign decision;
- the next experiment.

## Definition of done

The month is complete when the team can explain the path without private context, point to evidence about its effect, name at least one thing the system learned, and make a clear decision about what happens next.

The goal was never to prove the doctrine in 30 days. It was to leave the organization more capable—and a little less dependent on guesswork—than it was a month earlier.
