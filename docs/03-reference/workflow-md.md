# Reference: `WORKFLOW.md`

`WORKFLOW.md` is the repository’s standing delivery contract.

It should answer the questions an agent or builder needs during the work—not retell the entire playbook. Keep it short enough to read before execution and specific enough to remove avoidable guesswork.

The copyable starter is [`templates/WORKFLOW.md`](../../templates/WORKFLOW.md).

## What belongs in it

### The path

Name the local lifecycle and who may move work into consequential states such as `Ready`, `Decision`, `Resolved`, or `Abandoned`.

The default is:

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
                    ↘ Blocked / Paused ───────────────↗
                    ↘ Abandoned when the work ends unresolved
```

Landing and release remain separate facts.

### Readiness

State the minimum intent, scope, proof, risk, stop conditions, initiative context, and resource posture required before execution begins.

### Workpad and planning

Define the one canonical workpad location and when an optional ExecPlan is warranted. Do not force routine work through a planning artifact designed for a migration or architecture change.

### Environment, gates, and evidence

Name the startup, proof, and teardown commands. Explain the required isolation, gate results, retry behavior, evidence expectations, and conditions that require builder judgment.

### Resolution

Keep these separate:

```text
resolution status
resolution class
specific disposition
landed state
released state
```

Use the four analytical classes:

- `delivered`
- `decision`
- `administrative`
- `unresolved_loss`

The workflow should make it difficult to confuse a useful non-landed decision with either an external cancellation or a branch that simply ran out of oxygen.

### Resource policy

Adopt this progressively. Start with Change and run attribution. Add ranges, actuals, thresholds, routing, and initiative rollups only when the history and consequence justify them.

A threshold should name the decision it triggers, not only the number.

### Initiatives and data stewardship

Explain when a larger product bet needs an initiative record and later value review. State what resource data is measured, estimated, missing, restricted, or excluded. Keep system learning separate from individual performance surveillance.

## The test

A useful `WORKFLOW.md` makes these questions answerable:

```text
What can start?
What may continue?
What must stop?
Who decides?
What proves the claim?
How does the Change resolve when nothing lands?
What should the system learn?
```

Version material workflow changes so older Change and resource records remain interpretable.
