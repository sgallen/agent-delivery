# WORKFLOW.md

This file is the repository’s standing delivery contract. Keep it short enough to read and concrete enough to run.

The default is simple: shape one Change, maintain one workpad, execute in isolation, prove the result, make an accountable decision, and fold useful learning back into the system.

Delete or adapt anything that does not earn its keep here.

## The path

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
                    ↘ Blocked / Paused ───────────────↗
```

A **Run** is one attempt. A **Change** carries the durable intent, state, evidence, and outcome across attempts.

Landing and release are facts, not proof that the Change was handled well.

## Ready means ready

A Change may enter `Ready` when it has:

- a clear outcome or decision question;
- enough context to begin without private clarification;
- scope, non-goals, and forbidden surfaces;
- acceptance criteria or decision evidence;
- risk and gate profile;
- important stop conditions.

For experiments and investigations, define the useful non-landed path before execution. Do not invent a learning objective after delivery becomes difficult.

**Who may mark a Change ready:** <!-- customize -->

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
- the next decision and final handoff.

A local `.agent/workpads/<change>.md` may mirror the comment or serve as a fallback when no ticket exists.

## Planning

Use the lightest artifact that keeps the work coherent.

- Routine Change: workpad plan.
- Complex, risky, long-running, or architecture-shaping Change: optional ExecPlan under `docs/exec-plans/active/`.

An ExecPlan is a living execution document, not an approval form. Link it from the workpad and move it to `completed/` when the Change ends.

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

A useful gate has a clear purpose, produces evidence, and tells the agent what to do when it fails.

Loop on actionable failures while progress continues. Stop for judgment when:

- intent conflicts or important context is missing;
- risk or scope changes materially;
- a forbidden surface is touched;
- the environment cannot produce credible proof;
- the same failure repeats without progress;
- the evidence supports stopping rather than doing more work.

The evidence should match the claim: tests for behavior, screenshots or video for UI, logs or traces for runtime work, research or benchmarks for investigations, and reviewer findings where independent judgment helps.

## Builder engagement

Agents should not guess through consequential ambiguity.

Engage the builder whose judgment the situation requires: product, design, architecture, security, specialist review, release, or ownership.

Start conservatively. Reduce human review only after a class of work and its evidence path earn trust.

**Decision owners and escalation rules:** <!-- customize -->

## Resolution

A Change is complete when it reaches an explicit, evidence-backed outcome—not merely when a branch closes.

Most Changes will deliver something. Exploratory work may instead support a decision to stop, narrow, replace, or defer. Work closed for an external reason should say so plainly. Work that ends without enough evidence or accountable judgment should remain visible as unresolved.

For non-landed work, record:

- the question or uncertainty;
- the evidence produced;
- the decision it supports;
- what remains unknown;
- what happens next.

Use the formal resolution classes only when the project needs consistent reporting or analysis.

**Who may resolve a Change:** <!-- customize -->

## Optional advanced practices

Add these only when they improve a real decision.

### Resource visibility

Associate runs and material machine or builder use with the Change. Add ranges, thresholds, routing analysis, and capacity planning progressively as the history becomes credible.

At a threshold, preserve state, explain what changed, and ask for a decision. Do not hide failed attempts to make successful work look cheap.

### Initiatives

Create an initiative record when multiple Changes pursue a product bet large enough to deserve an explicit value thesis, investment range, stop conditions, and later value review.

Routine work does not need one.

### Data stewardship

State what is measured, estimated, incomplete, or excluded. Keep raw human time separate from any optional cost conversion. Use the data to improve the system, not to rank people by activity adjacent to a token counter.

## Learning checkpoint

Before closing meaningful work, ask:

> What should become easier, safer, faster, or easier to judge next time?

Promote a real lesson into the smallest useful layer: context, example, skill, gate, test, workflow, or follow-up Change. Remove practices that do not help.
