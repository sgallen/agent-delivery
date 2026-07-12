# Glossary

A small vocabulary for the playbook.

Use these terms consistently. The reader has enough to keep in working memory already.

## Agent

A model operating inside a harness that can use tools, inspect context, take actions, observe results, and iterate toward a goal.

## Agent harness

The technical system that makes agent work possible: prompts, tools, context, permissions, workspaces, execution environments, browser access, logs, retries, validation, and stop conditions.

## Builder

A human who helps turn customer understanding into product value, evidence-backed decisions, and a better delivery system.

Builders may specialize in product, engineering, design, UX, research, support, security, operations, data, sales, or customer success.

## Builder attention

The scarce human resource in agent-enabled delivery: context, taste, judgment, product intuition, architecture sense, risk awareness, creativity, curation, and accountability.

## Builder engagement

The deliberate decision about where human attention enters a Change: shaping intent, reviewing evidence, resolving a specialist decision, collaborating during execution, leading the work, or not being interrupted unless a gate fails.

## Change

The unit of execution and resolution.

A Change begins as intent, moves through workflow, execution, proof, resource use, and decision, and ends with either an explicit resolution or an honestly recorded unresolved loss. It does not need to merge or release to be valuable.

## Change Intent

The stable request for a Change: desired outcome or decision, context, resolution intent, delivered and non-landed criteria, non-goals, forbidden changes, risk, gate profile, parent initiative where relevant, resource posture, stop conditions, and evidence expectations.

In the default GitHub implementation, it lives in the issue body.

## Workpad

The live per-Change execution and decision surface.

In the default GitHub implementation, it is one persistent issue comment headed `## Agent Workpad`.

## Change Record

The durable completed history across the issue, workpad, PR when one exists, gate results, evidence, resource summary, explicit disposition, landing and release state, initiative rollup, and learning checkpoint.

## Resolution

An explicit conclusion about a Change, supported by the evidence and accountability required by the local workflow.

A resolved Change may deliver capability, produce a work-derived decision not to land, or close administratively. Work that entered execution and ended without sufficient evidence or accountable judgment is recorded as unresolved loss rather than promoted to a successful resolution.

## Resolution status

Whether the Change reached an adequate explicit conclusion: `resolved` or `unresolved`.

## Resolution class

The broad analytical outcome of a Change:

- `delivered` — the intended product or system outcome was accepted and landed or released;
- `decision` — work-derived evidence supported a useful non-landed decision;
- `administrative` — an accountable owner closed the Change for an external priority, ownership, policy, or funding reason without claiming material work-derived learning;
- `unresolved_loss` — execution ended without enough evidence, preserved context, or accountable judgment.

## Disposition

The specific conclusion within a resolution class, such as `accepted`, `experiment_concluded`, `hypothesis_rejected`, `technically_infeasible`, `stopped_at_resource_gate`, `superseded`, `deprioritized`, `rejected_at_review`, `cancelled_external`, or `abandoned_without_resolution`.

## Landed

Whether an artifact entered the durable product, repository, configuration, or operating system. Landing is separate from resolution and release.

## Released

Whether a landed capability became available to its intended users or operators.

## Productive non-landing

A non-landed, decision-class resolution in which work-derived evidence supports a useful decision, reduces material uncertainty, changes a forecast or next action, and is recorded well enough to review and reuse.

It is derived from the resolution record. It is not a label applied merely because work was attempted or a retrospective was held.

## Administrative resolution

An explicit closure caused primarily by an external priority, ownership, policy, or funding decision. It can be accountable and necessary without being presented as product or technical learning.

## Unresolved loss

Work that entered execution and consumed resources but ended without enough evidence, preserved context, ownership, or explicit judgment to support delivery, a work-derived decision, or accountable administrative closure.

## Resolution yield

Resolved Changes divided by Changes that entered execution. Show the resolution-class mix beside it so administrative closure does not masquerade as delivery or learning.

## Gate

A reusable quality, risk, behavior, architecture, resource, decision, or taste check with a clear result, evidence, and failure action.

Gates may be mechanical, behavioral, judgment-oriented, or resource-oriented.

## Evidence

The material that makes an outcome or decision reviewable: tests, screenshots, logs, traces, video, reports, benchmarks, customer findings, reviewer decisions, deployment links, and criteria mapping.

## Skill

A reusable procedure that teaches agents how the team expects an important step to be performed.

Tools provide capability. Skills provide technique.

## `WORKFLOW.md`

The repo-level operating contract for lifecycle, readiness, workpads, gates, evidence, resource policy, resolution, stop conditions, initiative rollup, review, and learning.

## ExecPlan

An optional, self-contained living plan for complex, ambiguous, risky, or long-running work.

Every orchestrated Change needs a workflow and workpad. Only some Changes need an ExecPlan.

## Execution environment

The isolated runtime world for a Change: services, data, ports, browser profile, logs, artifacts, and metered or estimated resource use. A worktree isolates code; an execution environment isolates behavior.

## Reviewer agent

An independent, narrowly scoped agent that evaluates one concern such as scope, code quality, design, architecture, security, evidence sufficiency, or decision quality.

## Learning checkpoint

A lightweight end-of-Change question:

> Did this reveal anything that should make the next Change easier, safer, faster, less wasteful, better estimated, more likely to resolve cleanly, or more valuable?

## Initiative

A meaningful product investment that may contain multiple Changes.

An initiative preserves the value hypothesis, staged resource and Change-funnel forecasts, actual delivery and resolution mix, continuing cost, final initiative disposition, and later value or decision-value reviews.

## Value hypothesis

A testable statement about the customer, business, operational, strategic, or decision value an initiative is expected to create, including baseline, indicators, horizon, confidence, and invalidating assumptions.

## Resource observability

The ability to associate human attention, agent and tool usage, execution infrastructure, elapsed time, attempts, missing-data notes, and final resolution with the Change or initiative that caused them.

## Delivery economics

The use of resource and resolution records to understand cost per trustworthy landed Change, cost per evidence-backed decision, resolution yield, class-specific loss and closure rates, future resource demand, routing, thresholds, capacity constraints, and investment quality.

## Resource gate

A warning, checkpoint, or stop condition tied to a constrained resource such as model spend, environment cost, elapsed time, reviewer attention, or initiative-stage investment.

A hard resource gate should preserve state and require an explicit decision rather than destroy context.

## Forecast stage

The point at which an estimate was made: opportunity, post-discovery, post-shaping, in-flight, or final actual. Preserve stages so the team can learn when uncertainty was reduced.

## Capacity constraint

The human capability, agent budget, infrastructure, release capacity, decision capacity, or other resource currently limiting trustworthy, worthwhile throughput.

## Operating model

The broader system that makes agent-enabled product delivery useful: builders, initiatives, Changes, workflow, workpads, harnesses, gates, evidence, resource policy, resolution, review, architecture, skills, capacity planning, value review, and learning.
