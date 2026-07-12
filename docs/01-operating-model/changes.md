# Changes

The practical unit of product work is a **Change**.

A ticket is a useful starting surface because teams already understand tickets and tools like GitHub Issues provide shared visibility. But the Change is larger than the ticket. It carries the work from intent through execution, proof, resource use, decision, resolution, and learning.

A Change may stand alone or belong to a larger [initiative](initiatives-and-value.md). The Change is the unit of execution and resolution. The initiative is the unit of product investment and value learning.

## Lifecycle

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
                    ↘ Blocked ────────────────────────↗
```

- **Proposed** — a problem, opportunity, or desired outcome has been identified.
- **Shaped** — the intent, constraints, risk, likely proof, resolution intent, and any material resource assumptions are clear enough to evaluate.
- **Ready** — the Change has a gate profile, an authorized resource posture when required, and enough context for the system to begin.
- **Running** — an agent or builder-agent pair is implementing, investigating, or experimenting.
- **Proving** — the required gates, evidence, decision criteria, and completion forecast are being resolved.
- **Decision** — the evidence is ready for accountable judgment about whether to land, continue, narrow, replace, defer, or stop the work.
- **Resolved** — the Change has an explicit disposition, sufficient evidence for that disposition, final resource actuals, and a learning checkpoint.
- **Blocked** — progress is temporarily paused. A blocker is not a final disposition unless a later decision resolves the Change as technically infeasible, deprioritized, stopped, or otherwise concluded.

A Change does not need to merge or release to become resolved.

```text
Decision
  → accepted and landed or released
  → experiment concluded
  → hypothesis rejected
  → technically infeasible
  → stopped at a resource gate
  → superseded or deprioritized
  → rejected at review
```

The important distinction is not simply **merged versus not merged**. It is whether the Change produced delivered capability, a work-derived decision, an accountable administrative closure, or unresolved loss.

## Resolution, landing, and learning are separate

Record at least four aspects of the outcome:

```text
resolution status
  resolved / unresolved

resolution class
  delivered / decision / administrative / unresolved_loss

disposition
  the specific conclusion

landed
  true / false / not_applicable

released
  true / false / not_applicable
```

- A **delivered resolution** means the intended product or system change was accepted and landed or released according to policy.
- A **decision resolution** means work-derived evidence produced a useful non-landed decision: stop, narrow, replace, defer, or pursue a different path.
- An **administrative resolution** means the Change was explicitly closed for an external priority, ownership, policy, or funding reason without claiming material learning from the work.
- An **unresolved loss** means work entered execution and ended without enough evidence, preserved context, or explicit judgment to support delivery, decision, or accountable closure.

These classes should not be blended into one success rate. They answer different questions.

A recommended disposition vocabulary is:

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

Repositories may adapt the vocabulary, but they should preserve the distinction among delivered work, work-derived decisions, accountable administrative closure, and unresolved loss.

## Productive non-landing has a bar

Do not label every failed attempt “learning.” A non-landed Change is productively resolved when the record makes clear:

- what decision or uncertainty the work was meant to address;
- what resource envelope or stop condition bounded it;
- what evidence was produced;
- why the evidence supports the disposition;
- what assumption, forecast, or next action changed;
- which artifacts or findings are reusable;
- which follow-up Change, initiative decision, or explicit stop follows.

A prototype that disproves a product assumption can be successful. A branch that disappears because nobody decided what to do with it is not the same outcome.

## Artifacts

```text
Change Intent
  + WORKFLOW.md
  + optional Initiative
  → Workpad
  → Active Change and Run records
  → Gates / evidence / resource checkpoints / decision
  → Change Record and explicit disposition
  → Initiative rollup, when applicable
  → Learning Checkpoint
```

### Change Intent

The Change Intent is the stable request. In the default GitHub implementation, it lives in the issue body.

It should capture:

- the desired outcome;
- why it matters;
- customer, business, or technical context;
- parent initiative, when one exists;
- resolution intent: deliver, experiment, investigate, or either depending on evidence;
- the decision question when the work is exploratory;
- acceptance criteria for a landed outcome;
- criteria for a useful non-landed resolution when relevant;
- non-goals and forbidden changes;
- risk level;
- gate profile;
- validation and evidence expectations;
- stop conditions;
- expected builder engagement;
- an optional resource forecast, range, confidence, and threshold policy when the decision warrants it.

The issue body should not be rewritten continuously as the work unfolds. It is the original intent and forecast, not the scratchpad.

### Workpad

The workpad is the live execution surface. In the default GitHub implementation, it is one persistent issue comment headed:

```md
## Agent Workpad
```

It holds the current plan, checklist, validation state, blockers, discoveries, evidence links, resource status, updated forecast, proposed disposition, and decision state.

A small Change may only need:

```text
resolution intent: deliver
estimate: not set
spent: recorded automatically
threshold: none
```

A governed Change may show:

```text
resolution intent: deliver or stop with evidence
forecast: $25–$45, medium confidence
spent: $31
current completion forecast: $39–$52
soft limit: $50
hard limit: $75
status: approaching soft limit
current decision: continue within scope
```

The point is a useful decision surface, not decorative accounting.

### Active Change

The Active Change is the work in motion. It normally has:

- a branch and worktree;
- an isolated execution environment;
- one or more agent runs;
- normalized run-resource records;
- logs and artifacts;
- browser/debug access when relevant;
- gate results;
- a PR when the likely disposition is to land the work.

Each run should be attributable to the Change even when the agent, model, provider, or environment changes. A run is an attempt. It is not the final Change outcome.

### Resource checkpoints

A resource threshold should trigger an explicit behavior:

```text
warning
  → update forecast

soft limit
  → checkpoint, explain variance, and propose options

hard limit
  → preserve state, stop additional consumption, and request a decision
```

The builder may approve more resource, narrow scope, change the route, create a prerequisite Change, conclude the experiment, or stop. The checkpoint should leave the work resumable and capable of becoming an evidence-backed decision resolution.

### Decision and Change Record

At decision time, the team or authorized automation should select a disposition and verify that the evidence supports it.

At resolution, the issue, workpad, PR when one exists, run records, and linked artifacts should form a durable record of:

- the original intent and resolution criteria;
- the original and later forecasts, when used;
- resolution status, class, disposition, and landing and release status;
- the implementation, experiment, or investigation summary;
- the gates that passed, failed, or became not applicable;
- the evidence supporting delivery or non-landing;
- the review and resource decisions;
- actual agent, tool, environment, elapsed-time, and builder-attention use;
- failed, discarded, and superseded attempts;
- resolution quality, learning value, and material uncertainty reduced;
- reusable artifacts and follow-up Changes;
- release or deployment notes when work landed;
- rework, rollback, or later defect when known;
- the learning checkpoint;
- the parent initiative rollup when one exists.

Not every Change needs a monetized human-cost calculation. Preserve the raw resource use and data-quality notes so later analysis can remain honest.

## Source of truth by concern

| Concern | Default source of truth |
| --- | --- |
| Initiative value thesis and investment | Initiative record |
| Desired outcome, decision question, and constraints | Issue body / Change Intent |
| Original Change forecast and policy | Issue body or linked resource summary |
| Standing repo process | `WORKFLOW.md` |
| Live plan, spend, forecast, and status | Persistent workpad comment |
| Code and implementation | Branch / worktree / PR |
| Raw run resource use | Per-run resource record |
| Gate results and large evidence | CI and artifact store |
| Resolution decision | Workpad, PR when present, and required reviews |
| Completed Change actuals and disposition | Change Record / resource summary |
| Durable history | Linked record across initiative, issue, workpad, PR, run data, and artifacts |

## Rule

Keep the Change coherent enough that another builder or agent can answer:

```text
What were we trying to achieve or learn?
What happened?
What proved it?
What did it consume?
Did it land? If not, why was stopping useful or not useful?
What decision changed?
What should the next similar Change learn from this one?
```

If the answer requires private chat history, the operating record is incomplete.
