# Changes

A model call is not a unit of delivery. Neither is an agent session, a branch, or even a pull request.

The practical unit is a **Change**: one bounded piece of product work carried from intent through execution, proof, decision, resource use, and learning.

A Change may be a bug fix, a feature, an investigation, an experiment, a migration, or an operational improvement. It may stand alone or belong to a larger [initiative](initiatives-and-value.md).

The Change is where the work becomes governable. It is also where cost finally has context.

## Lifecycle

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
                    ↘ Blocked ────────────────────────↗
```

- **Proposed** — someone has named a problem, opportunity, or outcome.
- **Shaped** — the intent, constraints, risk, likely proof, and important stop conditions are clear enough to judge.
- **Ready** — the repository, environment, gate profile, and any required resource authority are in place.
- **Running** — an agent or builder-agent pair is implementing, investigating, or experimenting.
- **Proving** — the system is gathering the evidence needed to judge the result.
- **Decision** — the work is ready for an accountable call: land it, continue, narrow, replace, defer, or stop.
- **Resolved** — the disposition is explicit, the evidence supports it, the resource record is complete enough, and the learning checkpoint is closed.
- **Blocked** — progress is paused, not finished. A blocker becomes a final outcome only when someone makes that decision.

## A Change can resolve without landing

Merge status is one fact. It is not the whole outcome.

Use four broad resolution classes:

| Class | What happened |
| --- | --- |
| `delivered` | The intended capability was accepted and landed or released according to policy. |
| `decision` | Work-derived evidence supported a useful decision to stop, narrow, replace, defer, or take another path. |
| `administrative` | An accountable owner closed the work for an external priority, ownership, policy, or funding reason. |
| `unresolved_loss` | Work entered execution but ended without enough evidence, preserved context, or accountable judgment to resolve it well. |

Keep the specific disposition separate—`accepted`, `experiment_concluded`, `hypothesis_rejected`, `technically_infeasible`, `superseded`, `cancelled_external`, and so on. Also record whether anything **landed** and whether it was **released**. Those facts answer different questions.

This may feel fussy until a team tries to learn from a quarter of work and discovers that “closed” means five different things.

## Productive non-landing has to earn the name

A prototype that disproves a product assumption can be a good Change. A branch that disappeared because nobody decided what to do with it is not the same thing.

A useful non-landed resolution should show:

- the decision or uncertainty the work was meant to address;
- the resource envelope or stop condition;
- the evidence produced;
- why that evidence supports the decision;
- what assumption, forecast, or next action changed;
- what should be reused, followed up, or deliberately left alone.

Do not award “learning value” after the fact because a run failed expensively. The evidence has to change a decision.

See [Not All Work Is Merge-Bound](not-all-work-is-merge-bound.md) for the operating principle and [Resolve a Change That Does Not Land](../02-playbooks/resolve-a-change-that-does-not-land.md) for the procedure.

## The three durable artifacts

A Change needs three kinds of record.

### 1. Change Intent

The issue body is the stable request. It should make clear:

- the outcome or decision sought;
- why it matters;
- the relevant customer, business, and technical context;
- the parent initiative, when one exists;
- landed acceptance criteria;
- useful non-landed criteria when the work is exploratory;
- non-goals, risks, forbidden changes, and stop conditions;
- the expected proof and builder involvement;
- an optional resource range and threshold policy when the decision warrants it.

Do not continuously rewrite the issue as the work unfolds. Preserve the original intent and forecast so the team can later see what it misunderstood.

### 2. Workpad

The workpad is the live execution surface. In the default GitHub implementation, it is one persistent issue comment headed:

```md
## Agent Workpad
```

It holds the current plan, checklist, validation state, discoveries, blockers, evidence links, resource status, forecast changes, and proposed disposition.

A small Change may need little more than:

```text
intent: deliver
plan: reproduce → fix → prove
resource posture: record actuals; no threshold
current decision: continue
```

A governed Change may show a range, current spend, forecast at completion, soft and hard limits, and the options available if the forecast moves.

The workpad is a decision surface, not decorative accounting.

### 3. Change Record

At the end, the issue, workpad, PR when one exists, run records, and linked artifacts should make it possible to reconstruct:

- what the team intended;
- what the system attempted;
- what evidence it produced;
- how the Change resolved and whether anything landed or released;
- what it consumed across agents, tools, environments, time, retries, and builder attention;
- which attempts failed, were discarded, or were superseded;
- what the team learned and what happens next.

Not every Change needs monetized human cost. Raw effort, capability type, assumptions, and data-quality notes are often enough.

## Resource checkpoints

A threshold should create a useful decision, not merely turn the agent off.

```text
approaching threshold
  → update the forecast and warn

soft limit
  → explain the variance and propose options

hard limit
  → preserve state, stop further consumption, and ask for a decision
```

The decision may be to continue, narrow scope, change models, create a prerequisite Change, conclude the experiment, or stop. Whatever happens, leave the work resumable and the evidence intact.

## Source of truth

| Concern | Default home |
| --- | --- |
| Desired outcome, constraints, original forecast | Issue body / Change Intent |
| Standing repository process | `WORKFLOW.md` |
| Live plan, status, forecast, and decision | Persistent workpad |
| Code and implementation | Branch / worktree / PR |
| Raw run and environment use | Per-run resource record |
| Tests, gate results, and large artifacts | CI and artifact store |
| Final disposition and actuals | Change Record / resource summary |
| Initiative thesis and value review | Initiative record |

## Rule

Another capable builder or agent should be able to answer:

```text
What were we trying to achieve or learn?
What happened?
What proved it?
What did it consume?
How did it resolve, and did anything land?
What decision changed?
What should the next similar Change know?
```

If the answer depends on private chat history, the Change record is not finished.
