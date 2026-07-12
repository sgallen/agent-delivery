# Reference: GitHub Labels

Use labels as the first visible state machine.

Labels are not the durable Change Record. They help builders and automations see where work is, what kind of resolution it reached, and which queue needs attention.

## Lifecycle labels

```text
state:proposed
state:shaped
state:ready
state:running
state:proving
state:decision
state:resolved
state:blocked
state:paused
state:abandoned
```

Use exactly one lifecycle label at a time.

- `state:decision` means the evidence, actuals, and candidate disposition are ready for accountable judgment.
- `state:resolved` means a delivered, decision, or administrative resolution is complete.
- `state:blocked` and `state:paused` are resumable and are not final dispositions.
- `state:abandoned` is the terminal exception for work that entered execution but ended without sufficient evidence or accountable resolution. It maps to `resolution_status: unresolved` and `resolution_class: unresolved_loss`.

Release is not a lifecycle state. Record `landed` and `released` separately in the Change Record or deployment system.

## Resolution-class labels

When a Change becomes terminal, apply exactly one class label when queue visibility benefits from it:

```text
resolution:delivered
resolution:decision
resolution:administrative
resolution:unresolved-loss
```

The durable class remains in the Change Record. A label must not be allowed to invent evidence that the record does not contain.

## Disposition labels

Apply at most one detailed disposition label when it improves triage or reporting:

```text
disposition:accepted
disposition:experiment-concluded
disposition:hypothesis-rejected
disposition:technically-infeasible
disposition:stopped-at-resource-gate
disposition:superseded
disposition:deprioritized
disposition:rejected-at-review
disposition:cancelled-external
disposition:abandoned-without-resolution
```

Do not create a label for every reason category. Evidence, confidence, decision basis, uncertainty reduced, and detailed rationale belong in the Change Record.

The class and disposition answer different questions. For example, `disposition:deprioritized` may be administrative when a portfolio owner changes priorities, or decision-class when delivery evidence shows that another path is better. Classify from the record, not the label text alone.

## Agent labels

```text
agent:eligible
agent:claimed
agent:needs-decision
agent:blocked
```

These describe orchestration state without duplicating the Change lifecycle.

## Risk labels

```text
risk:low
risk:medium
risk:high
```

## Type labels

```text
type:bug
type:feature
type:refactor
type:docs
type:design
type:test
type:chore
type:experiment
type:investigation
```

## Gate-profile labels

```text
gate:docs-only
gate:low-risk-ui
gate:backend-change
gate:refactor
gate:security-sensitive
```

## Optional resource and value labels

Use these only when they improve coordination. The numbers and reasoning belong in records, not labels.

```text
resource:checkpoint
resource:decision-needed
value-review:due
decision-value-review:due
```

- `resource:checkpoint` means a soft threshold or material forecast change needs a checkpoint.
- `resource:decision-needed` means execution is preserved and waiting for an accountable resource or scope decision.
- `value-review:due` belongs on an initiative that released.
- `decision-value-review:due` belongs on an initiative concluded without release when the stop decision should be revisited.

Do not create one label per initiative or budget amount. Link the durable initiative and resource records instead.

## Readiness rule

A Change becomes `state:ready` only when it has:

- a complete Change Intent;
- resolution intent and a decision question when needed;
- a landing expectation;
- one risk label;
- one type label;
- one gate-profile label;
- a parent initiative link when one exists;
- the forecast or resource policy required by the local workflow maturity;
- valid delivered and non-landed resolution criteria;
- explicit stop conditions when relevant;
- no unresolved blocker;
- `agent:eligible` when the orchestrator may claim it.

Do not label a half-shaped issue ready because the form was successfully submitted. GitHub forms can enforce fields; they cannot determine whether the evidence bar is coherent.

## Terminal-label rule

Before applying a terminal lifecycle label, verify this combination:

```text
state:resolved
  + resolution:delivered | resolution:decision | resolution:administrative
  + optional disposition:<specific-disposition>

state:abandoned
  + resolution:unresolved-loss
  + disposition:abandoned-without-resolution
```

A closed issue without this classification is an administrative GitHub event, not a trustworthy Change outcome.

## Migrating older labels

Repositories upgrading an older starter may still have `state:review`, `state:released`, `state:cancelled`, or `outcome:*` labels.

Migrate deliberately:

- `state:review` becomes `state:decision` once evidence and actuals are ready;
- `state:released` becomes `state:resolved`, while release is recorded separately;
- `state:cancelled` must be classified as resolved decision, resolved administrative, or abandoned unresolved loss from the evidence;
- `outcome:*` becomes `disposition:*` so the label name matches the canonical record vocabulary.

Do not bulk-map every cancelled item to productive learning. Historical evidence may be insufficient; record that uncertainty rather than manufacturing a clean story.

## Bootstrap script

The starter templates include:

```bash
./scripts/agent/bootstrap-labels.sh
```

Run it once per repository, then adjust names or colors to match local conventions. The script creates or updates labels; it does not delete legacy labels or classify historical Changes for you.
