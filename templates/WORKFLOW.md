# WORKFLOW.md

This workflow manages Changes and outcomes, not individual agent sessions. Agents may stop, restart, route across providers, or hand work off; the issue, workpad, resource records, gates, evidence, decision, and final Change Record preserve the state.

Use the smallest operating system that makes intent, execution, proof, resource use, resolution, recovery, and learning visible and trustworthy for the work at hand.

## Delivery hierarchy

```text
Portfolio
  Initiative
    Change
      Run
        Model, tool, and environment events
```

A Change is the unit of execution and resolution. An initiative is the unit of product investment and value learning. A run is an attempt, not the outcome.

Do not require an initiative for routine maintenance or isolated work. Use one when multiple Changes pursue a material product capability, feature set, product line, or investment hypothesis whose expected value, resolution mix, and total resource use should be revisited.

## Change lifecycle

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
                    ↘ Blocked / Paused ───────────────↗
                    ↘ Abandoned, as an unresolved exception
```

Only the roles or automations named in this file may move a Change into `Ready`, `Decision`, `Resolved`, or `Abandoned`.

- `Blocked` and `Paused` are resumable states.
- `Decision` means the evidence and actuals are ready for accountable judgment.
- `Resolved` requires a delivered, decision, or administrative resolution with adequate records.
- `Abandoned` means execution ended without sufficient evidence or accountable judgment. It maps to `resolution_status: unresolved` and `resolution_class: unresolved_loss`.

Release is not a lifecycle state. Record landing and release separately.

## Resolution model

Every completed or closed Change records these separately:

```text
resolution status
  resolved / unresolved

resolution class
  delivered / decision / administrative / unresolved_loss

specific disposition
  the concrete conclusion

landed
  true / false / not_applicable

released
  true / false / not_applicable
```

### Resolution classes

- **`delivered`** — the intended product or system outcome was accepted and landed or released according to policy.
- **`decision`** — work-derived evidence supported a useful non-landed decision: continue differently, narrow, replace, defer, reject, or stop.
- **`administrative`** — an accountable owner closed the Change for an external priority, ownership, policy, or funding reason without claiming material work-derived learning.
- **`unresolved_loss`** — work entered execution and ended without enough evidence, preserved context, ownership, or explicit judgment to support another class.

Use a stable disposition vocabulary:

```text
accepted
experiment_concluded
hypothesis_rejected
technically_infeasible
stopped_at_resource_gate
superseded
deprioritized
rejected_at_review
cancelled_external
abandoned_without_resolution
```

Repositories may adapt the list, but they must preserve the four analytical classes.

### Productive non-landing

Do not store a self-declared `productive_non_landing` flag.

A productive non-landing is derived when:

- `resolution_status` is `resolved`;
- `resolution_class` is `decision`;
- nothing material landed, unless a supporting artifact was intentionally preserved;
- the evidence adequately supports the disposition;
- material uncertainty, a forecast, or a next action changed;
- the decision owner and follow-up or explicit stop are recorded.

Administrative closure can be accountable without being product learning. Unresolved loss can contain observations without becoming a successful experiment.

## Readiness

A Change is ready when it has:

- a clear outcome or decision question;
- resolution intent: delivery, experiment, investigation, or either based on evidence;
- landing expectation: expected, possible, or not required;
- criteria for a delivered resolution;
- criteria for a useful non-landed decision when relevant;
- stop conditions when the work is uncertain or materially constrained;
- non-goals and forbidden changes;
- risk, type, and gate-profile labels;
- validation and evidence expectations;
- a parent initiative link when one exists;
- the resource forecast and thresholds required by the selected workflow maturity;
- no unresolved blocker;
- `agent:eligible` when the orchestrator may claim it.

Early teams may record attribution without estimates. Do not invent precision merely to satisfy a field.

## Resource observability and policy

Attribute model, tool, environment, retry, run contribution, and builder attention to the Change when the data is available. Keep raw human time separate from any optional monetary conversion.

Default record locations:

```text
.agent/runs/<change>/<run>/resource-use.json
.agent/changes/<change>/resource-summary.yml
```

Adopt controls progressively:

1. attribute use and every material attempt to a Change;
2. record resolution status, class, disposition, landing and release state, and data quality;
3. estimate with a likely range, confidence, assumptions, and resolution distribution;
4. govern with thresholds and decision rules;
5. compare forecast with actual and improve routing;
6. roll Changes into initiative funnel and capacity forecasts.

Where resource thresholds are defined:

```text
approaching threshold
  → warn and update the completion or decision forecast

soft threshold reached
  → checkpoint, explain variance, and present options

hard threshold reached
  → preserve state, stop additional consumption, and require the named decision
```

A threshold may apply to model and tool spend, environment or CI spend, elapsed time, builder attention, reviewer capacity, or another scarce resource. The decision may be to continue, narrow, reroute, create a prerequisite Change, or resolve as `stopped_at_resource_gate`. Never destroy useful state merely because a limit was reached.

## Workpad

Every orchestrated Change has one canonical workpad.

Default GitHub location:

```text
One issue comment headed: ## Agent Workpad
```

Find or create that comment and update it in place. Do not post separate progress, validation, resource, resolution, or handoff comments.

The workpad must include:

- status, initiative, run identity, branch, and environment;
- resolution intent, landing expectation, and current candidate class and disposition;
- outcome or decision and mirrored delivered and non-landed criteria;
- current plan;
- gate and validation state;
- resource forecast, actual to date, threshold state, and material variance when measured;
- run status and contribution;
- discoveries and decisions that affect scope, risk, approach, estimate, or disposition;
- blockers and builder questions;
- evidence links;
- decision checkpoint;
- handoff, final resolution, and learning checkpoint.

A local `.agent/workpads/<id>.md` file may mirror the workpad or serve as a fallback when no ticket exists. The ticket comment remains canonical for ticket-driven Changes.

## ExecPlans

Use an ExecPlan only for complex, ambiguous, risky, architecture-shaping, long-running, or materially constrained work.

Create it under:

```text
docs/exec-plans/active/<change-id>-<short-name>.md
```

Follow `docs/PLANS.md`, link it from the workpad, keep it current, and move it to `completed/` when the Change resolves. If the Change becomes unresolved loss, preserve the final plan with an explicit abandonment note rather than silently deleting it.

## Execution environment

Every Active Change receives an isolated enough environment:

- branch and worktree;
- unique ports and service namespaces;
- isolated mutable test data;
- isolated browser profile for UI work;
- Change-specific logs and artifacts;
- resource identity for environment and CI attribution;
- startup and teardown commands.

Record the environment class, start and stop time, metered or estimated cost, and retained artifacts when the workflow measures them.

## Gates

Run the profile named in the Change Intent.

A gate returns:

```text
pass | fail | not_applicable | blocked | waived
```

Loop on an actionable required failure while progress continues and the resource policy authorizes it.

Stop and engage a builder when:

- intent is missing or conflicting;
- risk increases;
- a specialist, product, or resource-allocation decision is required;
- forbidden scope is touched;
- the environment cannot produce trustworthy evidence;
- a hard resource threshold is reached;
- the same failure repeats without progress;
- the evidence may justify a decision resolution rather than further implementation.

A soft resource threshold is a checkpoint, not an automatic failure. It must produce an updated forecast, variance explanation, and proposed decision.

For a non-landed decision resolution, implementation gates may be `not_applicable` or failed when that result is itself evidence. The decision and evidence gates required for the proposed disposition must still be validly resolved.

## Evidence

The workpad and PR when one exists should link to:

- gate summary;
- targeted test or experiment output;
- screenshots or video for UI behavior;
- browser console or network summary when relevant;
- research, customer findings, logs, traces, or benchmarks;
- preview or deployment link when available;
- reviewer-agent findings;
- known gaps and continuing obligations;
- Change resource summary, including forecast, actual, threshold decisions, resolution class, disposition, and data-quality limits.

Large artifacts live in CI or the configured artifact store.

## Decision

The PR is a review package when something may land or when a branch is useful decision evidence. It is not required for every experiment or investigation.

Select builder judgment according to risk, observability, reversibility, required expertise, resolution class, and evidence quality. Low-risk Changes may need evidence review; architecture, security, product, design, resource-allocation, stop, or initiative-scope decisions require the appropriate builder.

Reviewers should be able to distinguish:

- implementation cost from total Change cost;
- run success from final Change resolution;
- delivered capability from a decision resolution;
- decision resolution from administrative closure;
- administrative closure from unresolved loss;
- landing from release;
- delivery variance from resolution and value variance;
- measured data from estimated or unattributed data;
- a one-off observation from a reusable system lesson.

## Resolution

A Change can move to `Resolved` when:

- `resolution_status: resolved` is justified;
- the final resolution class and specific disposition are explicit;
- landing and release state are recorded separately;
- delivered or non-landed criteria are evaluated;
- required gates are validly resolved for that disposition;
- evidence supports the outcome or decision;
- resolution quality, reason category, decision owner, and basis are recorded;
- required builder and threshold decisions are recorded;
- the issue, workpad, PR when one exists, and resource summary agree;
- final actuals and material resource, landing, and resolution variance are recorded when measured;
- uncertainty reduced, decisions changed, reusable artifacts, and follow-up are recorded where applicable;
- the parent initiative rollup is updated when one exists;
- the learning checkpoint is complete.

Failed, discarded, recovery, and superseded attempts remain part of the Change Record. Do not make them disappear because a later run succeeded or because nothing landed.

A Change moves to `Abandoned` rather than `Resolved` when execution ended without sufficient evidence or accountable judgment. Record:

```text
resolution_status: unresolved
resolution_class: unresolved_loss
disposition: abandoned_without_resolution
```

Preserve resource actuals, remaining context, reason resolution failed, and the ownership, recovery, or workflow improvement intended to prevent recurrence.

## Initiatives and value reviews

Create initiative records under:

```text
docs/initiatives/<initiative-id>-<short-name>.md
```

Use `docs/INITIATIVE.md` as the starter. Preserve:

- the original opportunity and value hypothesis;
- forecast stages, ranges, confidence, and assumptions;
- the expected Change funnel and resolution-class distribution;
- human, agent, infrastructure, elapsed-time, and continuing-cost expectations;
- linked Change forecasts, actual classes, dispositions, landing states, and resource use;
- delivery and resolution actuals;
- the final initiative decision;
- scheduled post-release value reviews or decision-value reviews when nothing releases.

After release, compare realized customer, business, operational, or strategic value with the original thesis. When an initiative concludes without release, review whether the evidence remained valid, uncertainty was reduced, and investment was responsibly avoided or redirected. When it closes administratively, preserve the external reason without claiming work-derived decision value.

Efficient delivery does not make an initiative valuable. A clean non-release decision is not automatically failure. An abandoned initiative is not automatically learning. Compare delivery, resolution, and value variance separately.

## Capacity planning

Before adding agent budget or committing a large initiative, check whether the complete delivery system can absorb it. Consider:

- customer discovery and demand formation;
- product and design shaping;
- architecture and technical direction;
- agent and model capacity;
- environment and CI capacity;
- builder and specialist review;
- product and stop-decision capacity;
- administrative ownership and portfolio decisions;
- recovery and unresolved-loss handling;
- release and operational support.

Forecast `delivered`, `decision`, `administrative`, and `unresolved_loss` outcomes rather than assuming every execution start lands. Direct the next unit of investment toward the current binding constraint, not automatically toward the most visible resource.

## Data stewardship

Resource and resolution data exists to improve delivery decisions and the system itself. It must not become covert personnel surveillance.

State what is measured, estimated, incomplete, or excluded. Restrict raw provider, prompt, and individual-level data appropriately. Prefer capability mix and team-level patterns when learning about human contribution. Assign resolution class, quality, and learning value through accountable review, not automatic self-congratulation.
