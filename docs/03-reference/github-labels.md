# Reference: GitHub Labels

Use labels as the first state machine.

Labels are not the final form of orchestration. They are a useful starting point because GitHub already exists, builders understand it, and agents can operate it.

## Lifecycle labels

```text
state:proposed
state:shaped
state:ready
state:running
state:proving
state:review
state:released
state:blocked
state:cancelled
```

Use one lifecycle label at a time.

## Agent labels

```text
agent:eligible
agent:claimed
agent:needs-review
agent:blocked
```

These describe orchestration state without duplicating the full lifecycle.

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
type:exploration
```

## Gate-profile labels

```text
gate:docs-only
gate:low-risk-ui
gate:backend-change
gate:refactor
gate:security-sensitive
```

## Readiness rule

A Change becomes `state:ready` only when it has:

- a complete Change Intent
- one risk label
- one type label
- one gate-profile label
- no unresolved blocker
- `agent:eligible` when the orchestrator may claim it.

Do not label a half-shaped issue ready because the form was successfully submitted. GitHub forms are capable of enforcing fields, not understanding them.

## Bootstrap script

The starter templates include:

```bash
./scripts/agent/bootstrap-labels.sh
```

Run it once per repository, then adjust names or colors to match local conventions.
