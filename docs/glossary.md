# Glossary

A small vocabulary for the playbook.

Use these terms consistently. The reader has enough to keep in working memory already.

## Core operating terms

### Agent

A model operating inside a harness that can use tools, inspect context, take actions, observe results, and iterate toward a goal.

### Agent harness

The technical system that makes agent work possible: prompts, tools, context, permissions, workspaces, execution environments, browser access, logs, retries, validation, and stop conditions.

### Builder

A human who helps turn customer understanding into product outcomes and a better delivery system.

Builders may specialize in product, engineering, design, UX, research, support, security, operations, data, sales, or customer success.

### Builder attention

The scarce human capacity in agent-enabled delivery: context, judgment, taste, product intuition, architecture sense, risk awareness, creativity, curation, and accountability.

### Builder engagement

The deliberate choice about where human attention enters the work: shaping intent, collaborating during execution, reviewing evidence, resolving a specialist decision, or staying out until a clear condition requires judgment.

### Change

The durable unit of product work.

A Change begins with intent, moves through execution and proof, and ends with an explicit outcome. It survives individual sessions, model switches, retries, and handoffs. It does not need to merge to be useful.

### Change Intent

The stable request for a Change: desired outcome or decision, context, scope, non-goals, important boundaries, risk, proof, and stop conditions.

In the default GitHub implementation, it lives in the Issue body.

### Workpad

The live per-Change surface for plan, state, discoveries, blockers, evidence, decisions, and handoff.

In the default GitHub implementation, it is one persistent Issue comment headed `## Agent Workpad`.

### Change Record

The durable completed history across the Issue, workpad, PR when one exists, gate results, evidence, final outcome, and learning. Mature teams may also link run, resource, and initiative records.

### `WORKFLOW.md`

The repository-level operating contract for readiness, lifecycle, workpads, environments, gates, evidence, stop behavior, review, completion, and learning.

### Execution environment

The runtime world for a Change: services, data, ports, browser state, logs, artifacts, credentials, and processes.

A worktree isolates code. An execution environment isolates behavior.

### Gate

A reusable quality, behavior, risk, architecture, or decision check with a clear result, evidence, and failure action.

### Evidence

The material that makes an outcome reviewable: tests, screenshots, logs, traces, video, reports, benchmarks, customer findings, reviewer decisions, deployment links, and criteria mapping.

### Reviewer agent

An independent, narrowly scoped agent that evaluates one concern such as scope, code quality, design, architecture, security, evidence sufficiency, or test coverage.

### Skill

A reusable procedure that teaches agents how the team expects an important step to be performed.

Tools provide capability. Skills provide technique.

### ExecPlan

An optional, self-contained living plan for complex, ambiguous, risky, or long-running work.

Every orchestrated Change needs a workflow and workpad. Only some Changes need an ExecPlan.

### Learning checkpoint

A lightweight end-of-Change question:

> What should become easier, safer, faster, or easier to judge next time?

### Operating model

The broader system that makes agent-enabled delivery useful: builders, Changes, workflow, workpads, harnesses, environments, gates, evidence, review, architecture, skills, recovery, decisions, and learning.

## Honest outcome terms

### Resolution

An explicit conclusion about a Change, supported by the evidence and accountability required by the local workflow.

A Change may deliver capability, produce a useful decision not to land, close for an external reason, or end without adequate resolution.

### Landed

Whether an artifact entered the durable product, repository, configuration, or operating system.

### Released

Whether a landed capability became available to its intended users or operators.

Landing, release, and resolution are related but separate facts.

### Productive non-landing

A non-landed outcome where work-derived evidence supports a useful decision, reduces material uncertainty, and changes what happens next.

It is not a flattering label for a failed branch.

### Administrative closure

An accountable closure caused primarily by an external priority, ownership, policy, or funding decision. It can be necessary without being presented as product or technical learning.

### Unresolved loss

Work that entered execution but ended without enough evidence, preserved context, ownership, or judgment to support delivery, a useful decision, or an accountable external closure.

## Formal outcome vocabulary

Use this taxonomy when a team needs consistent analytics or automation. It is not required for the first experiment.

### Resolution status

Whether the Change reached an adequate explicit conclusion: `resolved` or `unresolved`.

### Resolution class

The broad analytical outcome:

- `delivered` — trustworthy capability was accepted;
- `decision` — work-derived evidence supported a useful non-landed decision;
- `administrative` — an accountable external reason closed the work without claiming material work-derived learning;
- `unresolved_loss` — execution ended without adequate evidence or accountable resolution.

### Disposition

The specific conclusion within a resolution class, such as `accepted`, `experiment_concluded`, `hypothesis_rejected`, `technically_infeasible`, `stopped_at_resource_gate`, `superseded`, `deprioritized`, `rejected_at_review`, `cancelled_external`, or `abandoned_without_resolution`.

### Resolution yield

Resolved Changes divided by Changes that entered execution. Show the class mix beside it so administrative closure does not masquerade as delivery or learning.

## Advanced planning and economics terms

### Initiative

A meaningful product investment that may contain several Changes.

An initiative preserves the value thesis, staged forecast, actual delivery, major decisions, continuing cost, and later value review.

### Value hypothesis

A testable statement about the customer, business, operational, strategic, or decision value an initiative is expected to create, including baseline, indicators, horizon, confidence, and invalidating assumptions.

### Resource observability

The ability to associate human attention, agent and tool usage, execution infrastructure, elapsed time, attempts, data-quality limits, and outcomes with the Change or initiative that caused them.

### Delivery economics

The use of resource and outcome records to improve estimates, routing, thresholds, capacity decisions, and the cost of producing trustworthy outcomes.

### Resource gate

A warning, checkpoint, or stop tied to a constrained resource such as model spend, environment cost, elapsed time, reviewer attention, or initiative investment.

A hard resource gate should preserve state and require an explicit decision rather than destroy context.

### Forecast stage

The point at which an estimate was made: opportunity, post-discovery, post-shaping, in-flight, or final actual. Preserve stages so the team can learn when uncertainty was reduced.

### Capacity constraint

The human capability, agent budget, infrastructure, release capacity, decision capacity, or other resource currently limiting trustworthy, worthwhile throughput.
