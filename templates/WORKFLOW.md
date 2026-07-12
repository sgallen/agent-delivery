# WORKFLOW.md

This file is the repository’s standing delivery contract. Keep it short enough to read and concrete enough to run.

The default is simple: shape one Change, maintain one workpad, execute in isolation, prove the result, make an accountable decision, and fold useful learning back into the system.

Delete or adapt anything that does not earn its keep in this repository.

## The path

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
                    ↘ Blocked / Paused ───────────────↗
                    ↘ Abandoned when the work ends unresolved
```

A **Run** is one attempt. A **Change** carries the durable intent, state, evidence, resource use, and outcome across attempts. An **Initiative** groups Changes when the larger product bet deserves its own forecast and value review.

Landing and release are facts, not lifecycle states. Record them separately.

## Ready means ready

A Change may enter `Ready` when it has:

- a clear outcome or decision question;
- enough context to begin without private clarification;
- scope, non-goals, and forbidden surfaces;
- acceptance criteria or decision evidence;
- risk and gate profile;
- important stop conditions;
- an initiative link when one exists;
- a resource range or threshold when the work warrants one.

For experiments and investigations, define the useful non-landed path before execution. Do not invent a learning objective after delivery becomes difficult.

**Who may mark a Change ready:** <!-- name the role, owner, or automation -->

## One workpad per Change

For GitHub-driven work, use one issue comment headed:

```md
## Agent Workpad
```

Create it once and update it in place. Do not scatter the live state across progress comments.

The workpad should show:

- current state, run, branch, worktree, and environment;
- the outcome or decision sought;
- the current plan;
- material discoveries, blockers, and builder questions;
- gate state and evidence links;
- resource status when measured;
- the next decision;
- final resolution and learning.

A local `.agent/workpads/<change>.md` may mirror the comment or serve as a fallback when no ticket exists.

## Planning

Use the lightest artifact that keeps the work coherent.

- Routine Change: workpad plan.
- Complex, risky, long-running, or architecture-shaping Change: optional ExecPlan under `docs/exec-plans/active/`.

An ExecPlan is a living execution document, not an approval form. Link it from the workpad and move it to `completed/` when the Change ends. Preserve it with an abandonment note when unresolved work must be handed off or recovered.

## Execution environment

Give each active Change enough isolation to produce trustworthy evidence:

- dedicated branch and worktree;
- unique ports and service names;
- isolated mutable test data;
- isolated browser state for UI work;
- Change-specific logs and artifacts;
- clear startup and teardown commands.

A worktree isolates files. It does not isolate a database, queue, port, browser session, or external side effect.

**Start command:** <!-- e.g. ./scripts/agent/start-env.sh -->
**Gate command:** <!-- e.g. pnpm agent:gates -->
**Teardown command:** <!-- e.g. ./scripts/agent/stop-env.sh -->

## Gates and evidence

Run the gate profile named in the Change.

A gate returns:

```text
pass | fail | not_applicable | blocked | waived
```

A useful gate has a clear purpose, produces evidence, and tells the agent what to do when it fails. Loop on actionable failures while progress continues. Stop for judgment when:

- intent conflicts or important context is missing;
- risk or scope changes materially;
- a forbidden surface is touched;
- the environment cannot produce credible proof;
- the same failure repeats without progress;
- a resource threshold requires a decision;
- the evidence now supports stopping rather than spending more.

The evidence should match the claim: tests for behavior, screenshots or video for UI, logs or traces for runtime work, research or benchmarks for investigations, and reviewer findings where independent judgment helps.

## Builder engagement

Agents should not guess through consequential ambiguity. Engage the builder whose judgment the situation requires: product, design, architecture, security, specialist review, release, or resource allocation.

Start conservatively. Reduce human review only after a class of work and its evidence path earn trust.

**Decision owners and escalation rules:** <!-- customize -->

## Resolution

A Change is complete when it reaches an explicit, evidence-backed disposition—not merely when a branch closes.

Use these analytical classes:

- **`delivered`** — the intended capability was accepted.
- **`decision`** — the work produced evidence for a useful non-landed decision.
- **`administrative`** — an accountable owner closed the work for an external priority, policy, funding, or ownership reason.
- **`unresolved_loss`** — execution consumed resources without enough evidence or judgment to support another class.

Also record:

```text
resolution_status: resolved | unresolved
specific disposition: <what actually happened>
landed: true | false | not_applicable
released: true | false | not_applicable
```

A decision-class outcome should say what question was answered, what evidence changed the decision, what uncertainty remains, and what happens next. Administrative closure should not borrow the language of product learning. Unresolved loss should preserve cost, context, cause, and recovery ownership.

**Who may resolve or abandon a Change:** <!-- customize -->

## Resource visibility

Adopt this progressively.

1. **Attribute:** connect runs, model or tool usage, environment activity, and material builder attention to the Change.
2. **Compare:** record a range, confidence, and actual where the history supports it.
3. **Govern:** add soft checkpoints and hard decision thresholds for material work.
4. **Learn:** use the record to improve estimation, routing, capacity, and initiative choices.

Default record locations:

```text
.agent/runs/<change>/<run>/resource-use.json
.agent/changes/<change>/resource-summary.yml
```

At a soft threshold, preserve state, explain the variance, update the forecast, and present options. At a hard threshold, stop additional consumption until the named decision-maker chooses to continue, narrow, reroute, create a prerequisite, or stop.

Do not require advanced economics for every small Change. Do not hide failed attempts to make successful work look cheap.

## Initiatives

Create an initiative record only when multiple Changes pursue a material product capability, feature set, product line, or investment hypothesis.

The initiative should preserve:

- the expected customer or business value;
- staged investment ranges and important assumptions;
- linked Change forecasts and actuals;
- the final initiative decision;
- later value reviews—or decision-value reviews when nothing releases.

Efficient delivery does not prove that the product bet was good. A well-supported decision not to build can be valuable. An abandoned initiative is not automatically learning.

## Data stewardship

Resource and resolution data exists to improve the delivery system and its decisions. State what is measured, estimated, incomplete, or excluded. Keep raw human time separate from any optional monetary conversion. Prefer capability and team-level patterns over simplistic individual rankings.

Do not turn delivery observability into covert personnel surveillance.

## Learning checkpoint

Before closing meaningful work, ask:

> What should become easier, safer, faster, less wasteful, easier to estimate, or more likely to create value next time?

Promote a real lesson into the smallest useful layer: context, example, skill, gate, test, workflow, routing rule, estimator, capacity decision, or product rule. Remove practices that do not help.
