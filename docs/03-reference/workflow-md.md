# Reference: `WORKFLOW.md`

`WORKFLOW.md` is the repository’s standing operating contract.

The copyable starter lives at:

```text
templates/WORKFLOW.md
```

It should be concrete enough for agents and builders to execute, but short enough that they will actually read it.

## It should define

### Delivery hierarchy

Clarify the relationship among portfolio, initiative, Change, run, and resource events. A run is an attempt. A Change is the unit of execution and resolution. An initiative is the unit of investment and value learning.

### Change lifecycle

The default is:

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
                    ↘ Blocked / Paused ───────────────↗
                    ↘ Abandoned, as an unresolved exception
```

Name who or what may move work into `Ready`, `Decision`, `Resolved`, or `Abandoned`.

### Resolution model

Define four separate concepts:

```text
resolution status
resolution class
specific disposition
landed and released state
```

Use the analytical classes:

```text
delivered
decision
administrative
unresolved_loss
```

Use a stable disposition vocabulary such as:

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

Explain that productive non-landing is derived from a decision-class resolution with adequate evidence. Do not implement it as a self-awarded checkbox.

### Readiness

Specify the outcome or decision, resolution intent, landing expectation, delivered and non-landed criteria, scope boundaries, risk, gate profile, evidence, initiative link, stop conditions, and resource posture.

### Workpad

Define the canonical location and required sections, including run contribution, current candidate resolution class, decision evidence, and resource state.

### Resource policy

State what is attributed, where records live, which thresholds apply, and what decisions occur at warnings, soft limits, and hard limits.

### Gates and evidence

Define gate results, retry behavior, builder stop conditions, and evidence requirements for both delivered and non-landed resolutions. Failed implementation gates may be valid evidence for a decision resolution; decision and evidence gates still need to be satisfied.

### Decision and review

Explain when a PR is required, which builder judgments are needed, and how a final class and disposition are approved.

### Resolution and abandonment

A Change should not be called resolved merely because a branch or issue closed. Require explicit class, disposition, landing and release state, evidence, resource actuals, learning, and initiative rollup when applicable.

When execution ends without sufficient evidence or accountable judgment, record `resolution_status: unresolved`, `resolution_class: unresolved_loss`, and a specific reason such as `abandoned_without_resolution`.

### Initiatives and capacity

Explain how linked Changes roll up, how class distributions are forecast, and how released, concluded, administratively closed, and unresolved initiatives are reviewed.

### Data stewardship

State access, retention, estimation limits, and protections against personnel surveillance or casual “productive learning” labels.

## Rule

`WORKFLOW.md` should make these questions answerable:

```text
What can start?
What may continue?
What must stop?
Who decides?
What proves delivery?
What proves a useful non-landed decision?
When is the Change resolved?
When is it unresolved loss?
What is learned when nothing lands?
```

When the workflow changes, version it so historical resource and outcome records remain interpretable.
