# Reference: GitHub Labels

Use labels as a visible state machine, not as a second database.

The Issue, workpad, evidence, and final Change Record carry the meaning. Labels help people and automations see where work is and which queue needs attention.

## Start with the lifecycle

A credible minimum is:

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

- `state:decision` means the evidence is ready for accountable judgment.
- `state:resolved` means the Change has an explicit outcome and complete record.
- `state:blocked` and `state:paused` are resumable.
- `state:abandoned` means execution ended without a defensible conclusion or recovery path. Use it sparingly and honestly.

Release is not a lifecycle state. Record whether something landed and whether it reached users separately.

## Optional orchestration labels

```text
agent:eligible
agent:claimed
agent:needs-decision
agent:blocked
```

These help a runner coordinate work without duplicating the Change lifecycle.

## Add local labels only when they improve a queue or decision

Common examples include:

```text
risk:low
risk:medium
risk:high

type:bug
type:feature
type:improvement
type:refactor
type:docs
type:design
type:test
type:chore
type:experiment
type:investigation

gate:docs-only
gate:low-risk-ui
gate:backend-change
gate:refactor
gate:security-sensitive
```

A small repository may already have useful type and risk labels. Reuse them. The playbook does not need to rename your entire issue tracker to prove it arrived.

## Formal outcome labels are advanced

Teams using the full resolution model may add one class label at terminal state:

```text
resolution:delivered
resolution:decision
resolution:administrative
resolution:unresolved-loss
```

They may also add one detailed disposition when it improves reporting:

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

The durable outcome belongs in the Change Record. A label must not be allowed to invent evidence the record does not contain.

Optional resource and value-review labels can help mature workflows:

```text
resource:checkpoint
resource:decision-needed
value-review:due
decision-value-review:due
```

Do not create one label per initiative, model, or budget amount. Link the durable records instead.

## Readiness rule

A Change becomes `state:ready` when:

- the desired outcome or decision is clear;
- scope and important non-goals are explicit;
- the proof and gate profile make sense;
- risk and stop conditions are understood;
- no unresolved blocker prevents execution;
- `agent:eligible` is present when an orchestrator may claim it.

A parent initiative, formal resolution intent, or resource policy is required only when the local workflow uses it.

Do not label a half-shaped issue ready because the form was successfully submitted. GitHub forms can enforce fields; they cannot determine whether the work makes sense.

## Terminal rule

Before `state:resolved`, confirm that the workpad or Change Record says:

- what happened;
- what evidence supports it;
- whether anything landed or released;
- who made the accountable decision;
- what happens next.

When the full label set is enabled, add the supported resolution class and at most one disposition.

Use `state:abandoned` only when the work genuinely ended without adequate resolution. Do not bulk-map every cancelled item to productive learning. Historical evidence may be insufficient; preserving that uncertainty is more credible than manufacturing a clean story.

## Bootstrap script

The starter includes:

```bash
./scripts/agent/bootstrap-labels.sh
```

By default it creates only lifecycle and agent-orchestration labels.

Use the larger reference set when the repository has earned it:

```bash
./scripts/agent/bootstrap-labels.sh --full
```

The script creates or updates labels. It does not delete legacy labels or classify historical Changes for you.
