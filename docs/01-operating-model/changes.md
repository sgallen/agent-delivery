# Changes

A model call is not a unit of delivery. Neither is an agent session, a branch, or even a pull request.

The practical unit is a **Change**: one bounded piece of product work carried from intent through execution, proof, decision, and learning.

A Change may be a bug fix, a feature, an investigation, an experiment, a migration, or an operational improvement. It may stand alone or belong to a larger [initiative](initiatives-and-value.md).

The Change is what lets the work survive a failed run, a model switch, a handoff, or a pause without losing the plot.

## Lifecycle

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
                    ↘ Blocked ────────────────────────↗
```

- **Proposed** — someone has named a problem, opportunity, or outcome.
- **Shaped** — the intent, boundaries, risk, proof, and important stop conditions are clear enough to judge.
- **Ready** — the repository, environment, gate profile, and required access are in place.
- **Running** — an agent or builder-agent pair is implementing, investigating, or experimenting.
- **Proving** — the system is gathering the evidence needed to judge the result.
- **Decision** — the work is ready for an accountable call: land it, continue, narrow, replace, defer, or stop.
- **Resolved** — the outcome is explicit, the evidence supports it, and the learning checkpoint is complete enough.
- **Blocked** — progress is paused, not finished. A blocker becomes a final outcome only when someone makes that decision.

The lifecycle is not meant to produce status theater. It exists so another builder or agent can tell where the work actually stands.

## The three durable artifacts

A Change needs three kinds of record.

### 1. Change Intent

The issue body is the stable request. It should make clear:

- the outcome or decision sought;
- why it matters;
- the relevant customer, product, and technical context;
- what is in and out of scope;
- what would count as proof;
- the important risks, constraints, and stop conditions;
- where builder judgment is likely to matter.

When the work is exploratory, state the decision question and what would count as a useful conclusion before execution begins.

Do not continuously rewrite the issue as the work unfolds. Preserve the original intent so the team can later see what it misunderstood.

### 2. Workpad

The workpad is the live execution surface. In the default GitHub implementation, it is one persistent issue comment headed:

```md
## Agent Workpad
```

It holds the current plan, checklist, discoveries, blockers, validation state, evidence links, and handoff.

A small Change may need little more than:

```text
plan: reproduce → fix → prove
current state: reproduction confirmed
next action: add regression test, then repair
```

A larger or more governed Change may also carry a resource forecast, threshold state, or proposed decision.

The workpad is the current truth, not a transcript.

### 3. Change Record

At the end, the issue, workpad, PR when one exists, and linked evidence should make it possible to reconstruct:

- what the team intended;
- what the system attempted;
- what became observably true;
- how the work ended and whether anything landed;
- which attempts materially failed, changed direction, or were discarded;
- what the next similar Change should know.

When the team measures resource use, the Change Record is also where those actuals gain context.

## Resolve the work honestly

Most Changes are intended to land. Not every useful one will.

An experiment may disprove a product assumption. An investigation may reveal that a technical path is unsafe or uneconomical. A resource checkpoint may show that the remaining work no longer justifies the investment.

Those can be good outcomes when the decision is explicit and supported by evidence.

A branch that disappeared because ownership faded is different. So is a run that consumed resources without reaching a defensible conclusion.

When the distinction matters, use four broad resolution classes:

| Class | Meaning |
| --- | --- |
| `delivered` | The intended capability was accepted and landed or released according to policy. |
| `decision` | Work-derived evidence supported a useful decision to stop, narrow, replace, defer, or take another path. |
| `administrative` | An accountable owner closed the work for an external priority, ownership, policy, or funding reason. |
| `unresolved_loss` | Work entered execution but ended without enough evidence, preserved context, or accountable judgment to resolve it well. |

Keep the specific disposition and the facts `landed` and `released` separate when later analysis needs them. Do not make every routine Change recite the full taxonomy in conversation.

See [Not All Work Is Merge-Bound](not-all-work-is-merge-bound.md) for the principle and [Resolve a Change That Does Not Land](../02-playbooks/resolve-a-change-that-does-not-land.md) for the procedure.

## Resource checkpoints are optional controls

When cost, elapsed time, scarce environments, or builder attention could change the decision, use thresholds as pause points:

```text
approaching threshold → update the forecast and warn
soft limit            → explain the variance and propose options
hard limit            → preserve state and require a decision
```

The decision may be to continue, narrow scope, change models, create a prerequisite Change, conclude the experiment, or stop.

A hard stop that destroys the context is not governance. It is an expensive way to forget.

## Source of truth

| Concern | Default home |
| --- | --- |
| Desired outcome and constraints | Issue body / Change Intent |
| Standing repository process | `WORKFLOW.md` |
| Live plan, status, and discoveries | Persistent workpad |
| Code and implementation | Branch / worktree / PR |
| Tests, gate results, and large artifacts | CI and artifact store |
| Final outcome and learning | Change Record |
| Optional run and resource actuals | Per-run record and Change summary |
| Larger product thesis and value review | Initiative record |

## Rule

Another capable builder or agent should be able to answer:

```text
What were we trying to achieve or learn?
What happened?
What proved it?
How did it end?
What should the next similar Change know?
```

If the answer depends on private chat history, the Change record is not finished.
