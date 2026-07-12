# Playbook: Shift an Existing Team

Use this when introducing agent-enabled product delivery into an existing product, codebase, or organization.

## Goal

Change the operating model without creating fear, slop, review overload, or a parallel process nobody trusts.

This is a people change, a system change, and a technical change at the same time. Treat it with more care than installing a coding assistant and scheduling a lunch-and-learn.

For a bounded rollout, pair this playbook with [The First 30 Days](first-30-days.md).

## Step 1: Make the case honestly

Do not present the shift as:

> We no longer need product managers, designers, engineers, or QA.

Present it as:

> The work is changing. Expertise matters more, but we need to apply it where it creates the most leverage.

Acknowledge what the team has probably already seen:

- agents can do meaningful work
- agent output can also create slop
- reviewers can be overwhelmed
- product builders can remain blocked on engineering queues
- important judgment often lives in a few people’s heads
- the old workflow can absorb new tools without meaningfully changing.

The goal is to solve those problems, not wave them away.

## Step 2: Create permission to work differently

Tools do not remove old process by themselves. The [Gusto Cofounder example](https://youtu.be/5FKBkUCaLa8) is useful partly because the team had explicit permission to remove inherited ceremony and let working product carry more of the conversation.

The pilot group needs explicit permission to:

- collapse unnecessary handoffs
- make ideas concrete before writing elaborate planning documents
- discard implementations without treating that as failure
- let builders work beyond traditional role boundaries
- replace some meetings with working evidence
- question steps that no longer earn their cost.

That permission is not permission to lower the quality bar. It is permission to find a better way to meet it.

Use a small, cross-functional group with enough product, design, and engineering judgment to act. Protect it from having to reproduce every ceremony of the larger organization inside the pilot. A new process that contains all the old process plus several agents is not much of a breakthrough.

## Step 3: Establish a baseline

Before changing the path, capture a few facts:

- cycle time from ready to review
- time spent waiting for implementation or review
- PR review load by role
- defect or regression rate
- classes of work repeatedly blocked on scarce specialists
- common causes of rework
- current test, browser, and observability coverage
- model, tool, environment, and validation cost when available
- builder attention by broad capability
- landing, decision, administrative-closure, and unresolved-loss rates when available
- known gaps in attribution.

You do not need a management dashboard with twelve gradients. You need enough truth to know whether the new system helps.

## Step 4: Choose one safe Change class

Good starting classes include:

- customer-reported bugs with deterministic reproduction
- documentation maintenance
- regression tests
- internal tooling
- small UI behavior fixes
- evidence generation
- narrow reviewer-agent checks
- bounded experiments or technical investigations with explicit decision questions.

Avoid beginning with billing, security-sensitive flows, migrations, broad refactors, or politically loaded projects.

Select work that is observable and reversible so trust can be built from evidence.

## Step 5: Build the minimum system

For the selected Change class, add:

- a clear issue template
- `WORKFLOW.md`
- one persistent workpad
- isolated worktree and runtime conventions
- a small gate profile
- an evidence package
- explicit builder-engagement rules
- a learning checkpoint
- one run-resource record and simple Change actual.

Do not require the whole team to adopt everything at once. Do not build a general-purpose orchestration platform before one Change can move through the path reliably.

## Step 6: Run a small cohort

Run three to five real Changes through the system.

For each one, record:

- where the agent succeeded
- where a builder had to intervene
- whether the evidence shortened review
- whether unrelated output appeared
- whether the Change reduced or increased total human effort
- machine and environment use
- forecast and actual when an estimate existed
- final resolution status, class, disposition, and landing or release state
- whether non-landed work produced adequate decision evidence, closed administratively, or remained unresolved loss
- what should improve before the next run.

Invite skeptics to inspect the evidence and failure modes. Skepticism is useful when it is allowed to meet reality.

Do not ask the pilot to prove every future use case. It needs to prove that one bounded path can work and improve.

## Step 7: Protect quality-focused builders

Do not turn senior engineers or designers into the cleanup layer.

Use:

- scope and regression gates
- reviewer agents with narrow responsibilities
- diff and evidence summaries
- explicit stop conditions
- small Change sizes
- stronger context and skills
- limits on concurrent review demand.

If review load rises materially, stop expanding the Change class and improve the system first.

A healthy pilot reduces total human burden. It does not move the burden downstream and declare victory upstream.

## Step 8: Improve the system from real friction

After each Change, ask what should become easier next time.

Examples:

- repeated missing context → improve the issue template or repo docs
- repeated visual inconsistency → improve design guidance or a reviewer gate
- repeated architecture drift → add a boundary rule or structural check
- slow bug reproduction → improve browser, log, or trace access
- needless builder interruptions → improve evidence or encode the decision
- unused workpad sections → remove them
- recurring estimate variance → improve task shaping, routing, or the estimate range
- recurring unresolved loss → improve ownership, stop conditions, recovery, or the resolution path
- agent capacity available but no ready work → improve customer discovery and product shaping
- shaped work available but review saturated → improve gates, evidence, or review capacity.

The last item matters. Transformation should remove ceremony, not only add better ceremony.

## Step 9: Expand by earned trust

Expand to a new Change class only when:

- the current class has a track record
- failures are understood
- the gates and evidence are credible
- builders know when they will be engaged
- the system reduces, rather than relocates, human burden
- resource records are complete enough to understand the next likely constraint.

Trust belongs to a class of work and an operating system—not to “AI” in the abstract.

## Step 10: Align roles and incentives

Reward builders for:

- improving the system
- making judgment durable
- reducing repeat work
- creating useful evidence
- enabling others to move safely
- achieving customer and business outcomes
- improving estimates, routing, and the useful capacity of the complete system.

Do not reward raw generated-code volume. The system can produce plenty of that without encouragement.

Leaders also need to make room for identity to change. A product manager may become more directly involved in creating and validating working Changes. A designer may encode taste into examples, components, skills, and gates. An engineer may spend more time on architecture, environments, and the delivery system than on typing implementation code.

Those are not lesser versions of the old jobs. They are higher-leverage versions of the work.

Use observed constraints to inform staffing. The next hire may be a product-oriented builder who can form and shape demand, a specialist reviewer, or a platform builder who improves gates and environments. More agent budget is only useful when the surrounding system can absorb it.

## Definition of done for the first phase

The first transformation phase is working when:

- at least one Change class moves through the new path repeatedly
- review burden is stable or lower
- builders can point to concrete time or quality improvements
- the pilot had real permission to remove unnecessary process
- delivered, decision, administrative, and unresolved outcomes remain distinguishable
- failures produce system improvements rather than blame
- the team understands that this is a new operating model, not a new autocomplete feature
- the next decision is explicit: expand, hold, or redesign
- the team can name the current constraint and the evidence behind it.
