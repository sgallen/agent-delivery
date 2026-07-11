# Playbook: The First 30 Days

Use this when the case makes sense and you need to turn it into a real operating experiment.

This is not a plan to transform the whole company in a month. It is a plan to establish one credible, repeatable path for agent-enabled delivery and learn enough to decide what deserves to expand.

## Outcome

By the end of 30 days, you should have:

- one clearly defined class of Changes moving through the new path
- a small group of builders who have run the system themselves
- three to five completed or deliberately discarded Changes
- a working issue, workflow, workpad, environment, gate, and evidence pattern
- baseline data on cycle time, human attention, quality, and rework
- a short list of system improvements already applied
- an explicit decision to expand, hold, or redesign the experiment.

## Ground rules

Keep the first month bounded.

- Use one product or repository.
- Choose one safe, observable, reversible Change class.
- Give a small cross-functional group explicit permission to work differently.
- Keep the quality bar. Remove ceremony that does not help meet it.
- Do not reorganize the company, buy a platform, or build a general-purpose orchestrator first.
- Treat the pilot as product work, not an innovation theatre side quest.

A useful pilot group is two to five builders with enough product, design, and engineering judgment to act without recreating every old handoff inside the experiment.

## Week 1: Establish the smallest credible system

### 1. Choose the Change class

Good starting points:

- low-risk customer-reported bugs
- small UI behavior fixes
- documentation maintenance
- regression-test additions
- narrow internal tooling
- evidence generation for existing work.

Avoid migrations, billing, security-sensitive workflows, broad architecture changes, or anything whose failure would require an uncomfortable call with legal.

### 2. Define the outcome

Write down what the experiment is meant to improve.

Examples:

- reduce time from a customer-reported bug to a reviewable fix
- reduce senior-engineer review minutes for low-risk UI Changes
- let product or customer-facing builders move a narrow class of issues toward proof
- improve the percentage of Changes that arrive at review with credible behavior evidence.

### 3. Capture a baseline

Use a small set of measures:

- cycle time from ready to review
- waiting time before implementation starts
- active builder time
- reviewer time
- first-pass gate success
- rework or regression rate
- number of human interventions and why they happened
- model, tool, and environment cost per accepted Change
- builder minutes per accepted Change.

Precision is less important than having an honest comparison.

### 4. Create the minimum artifacts

Add:

- a Change Intent issue template
- a short `AGENTS.md` that maps the repo
- a repo-owned `WORKFLOW.md`
- one persistent workpad pattern
- one gate profile for the selected Change class
- one evidence checklist
- one learning checkpoint.

Do not write the encyclopedia. The first workflow should be small enough that a builder can read it before coffee gets cold.

### 5. Make the environment usable

At minimum:

- dedicated branch and worktree
- reproducible setup command
- unique ports and runtime state
- isolated browser profile for UI work
- Change-specific logs and artifacts
- one command that runs the local proof set.

If the agent cannot run and observe the product, it cannot reliably own the work.

## Week 2: Run real Changes

Run three Changes through the system.

For each Change:

1. Write the intent and validation expectations.
2. Create the workpad.
3. Let the agent investigate and plan.
4. For a bug, reproduce the failure before changing the implementation.
5. Let the agent implement, run gates, repair failures, and gather evidence.
6. Engage a builder only where judgment or a true blocker requires it.
7. Review the outcome and evidence, not only the diff.
8. Complete the learning checkpoint.

Do not quietly rescue every rough run. The rough edges are the information you need.

Do not let a broken run wander indefinitely either. Stop when the system is not making progress, record why, and improve the relevant part of the workflow.

## Week 3: Improve the system, not just the Changes

Review the first runs and look for repeated friction.

Typical findings:

- the issue did not contain enough context
- the agent could not reproduce the problem
- browser or log access was weak
- the gate failure gave no useful remediation
- a reviewer repeatedly flagged the same design or architecture issue
- the workpad became noisy
- a builder was interrupted for a decision the system should have handled
- the system handled something safely that no longer needs the same review.

Promote the learning:

- improve the issue template
- add or refine a skill
- make a gate message more actionable
- add a regression test
- expose another runtime signal
- tighten an architecture boundary
- improve the evidence package
- remove an artifact or step that did not earn its keep.

Aim to make two or three concrete system improvements during the week. A backlog of fifty ideas is not the same thing.

## Week 4: Evaluate and decide

Run one or two more Changes through the improved system.

Then hold a short operating review. Answer:

- Did the selected Change class move faster?
- Did total human attention go down, move, or increase?
- Did evidence improve confidence?
- Did review become easier or merely later?
- What failures repeated?
- Which builder interventions were genuinely high leverage?
- Did the experience create more agency and creative energy, or more cleanup?
- Is the system ready for another Change class?

Choose one outcome:

### Expand

Add one adjacent Change class because the current path has credible evidence and manageable failure modes.

### Hold

Keep the scope stable and improve the system before increasing volume or risk.

### Redesign

The experiment exposed a weak assumption, environment, gate, or ownership model. Change it and run another bounded month.

None of these outcomes is failure. Pretending the system works when the evidence says otherwise is failure, just with better branding.

## The 30-day review artifact

Record:

- the original hypothesis
- the selected Change class
- Changes attempted and outcomes
- baseline and current measures
- model, environment, and builder-attention economics
- human interventions by category
- quality or regression findings
- system improvements made
- remaining risks
- the expand, hold, or redesign decision
- the next experiment.

Keep this short enough that another builder will actually read it.

## Definition of done

The first 30 days are complete when:

- at least three real Changes have gone through the system
- the team can explain the workflow without private context
- evidence exists for speed, quality, human-attention, and cost effects
- at least one repeated lesson has been encoded into the system
- unnecessary process has been removed rather than quietly accumulated
- the next decision is explicit.

The goal of the first month is not to prove that every product team should work this way.

It is to build the first version of the system, learn where it breaks, and leave the organization more capable than it was 30 days earlier.
