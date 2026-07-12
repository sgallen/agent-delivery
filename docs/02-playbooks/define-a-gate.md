# Playbook: Define a Gate

Use this when converting a concern, review comment, repeated failure, resource threshold, or quality expectation into a durable gate.

The goal is not more process. It is to stop paying the same human, machine, or risk cost repeatedly.

## Step 1: Name the failure or decision mode

Examples:

- The agent changes files outside the requested scope.
- A UI Change adds an unrequested Copy Link action.
- Code bypasses the service layer.
- The page has console errors after the Change.
- Review repeatedly catches missing regression tests.
- UI work ignores design tokens.
- Machine spend reaches the soft limit without a revised completion forecast.
- A scarce environment remains idle past its lease.
- An initiative crosses its authorized envelope without a scope decision.

If you cannot name the failure or decision clearly, it is probably not ready to become a hard gate.

## Step 2: Choose the lightest durable form

Options include:

- documentation or example
- skill
- reviewer-agent rubric
- advisory gate
- resource warning
- soft checkpoint
- required gate
- hard approval boundary
- mechanical test or lint
- scheduled cleanup check.

Use the least rigid form that makes the failure less likely or the decision more accountable.

## Step 3: Write the gate contract

A quality gate might be:

```yaml
id: scope
purpose: Prevent unrelated or forbidden changes.
applies_when: all code changes
required: true
runner: scripts/gates/scope
pass_condition: All changed files and behaviors are within the Change Intent.
evidence: changed-file report and reviewer summary
failure_action: repair or block if forbidden scope was touched
```

A resource gate might be:

```yaml
id: machine_budget
purpose: Prevent unreviewed resource drift while preserving resumable state.
applies_when: a Change has a machine-spend policy
warning_at_percent: 80
soft_limit_action: checkpoint, explain variance, and reforecast
hard_limit_action: preserve state and require the named builder decision
evidence: Change resource summary and current completion forecast
```

Use these result states for quality gates:

```text
pass
fail
not_applicable
blocked
waived
```

For resource gates, also preserve threshold state:

```text
within
approaching
soft_reached
hard_reached
```

A gate that produces vibes is not a gate. It is a meeting with JSON.

## Step 4: Define evidence

Examples:

- command output
- test report
- screenshot
- browser trace
- reviewer finding
- diff summary
- architecture-check result
- usage rollup
- environment meter
- forecast, range, confidence, and variance explanation.

A dollar amount without data-quality context is not complete evidence.

## Step 5: Write a useful failure or checkpoint message

Bad:

```text
Architecture violation.
```

Better:

```text
UI code imported packages/billing/internal. Use packages/billing/public, or add an approved public API to the billing package and update the architecture contract.
```

Bad:

```text
Budget exceeded.
```

Better:

```text
Soft machine-spend threshold reached.
Forecast: $25–$40. Actual to date: $38. Current completion forecast: $47–$61.
Primary variance: the existing permission boundary cannot support the accepted behavior.
Options: narrow scope, create a prerequisite Change, or authorize up to $65.
```

A gate is also a teaching and decision mechanism.

## Step 6: Add loop, stop, and preservation behavior

State when the implementation agent should repair and retry, when it should reforecast, and when the run must stop for builder judgment.

At a resource stop, name the state that must survive:

- workpad
- diff and commit
- run and Change resource records
- gate evidence
- environment or recovery instructions
- current forecast and decision options.

Do not let a gate create an infinite loop with a very determined model.

## Step 7: Wire it into the system

Update the relevant:

- gate manifest
- `WORKFLOW.md`
- Change Intent and workpad
- resource policy
- skill
- reviewer prompt
- docs or examples
- CI or orchestrator
- PR evidence table
- initiative record, when the gate controls initiative investment.

## Step 8: Revisit it

Gates can become noisy, overly strict, redundant, obsolete, or economically irrational.

Keep gates that create trust or useful decisions. Fix or remove gates that create theater, false precision, or more cost than the failure they prevent.

## Definition of done

A gate is ready when its purpose, applicability, state model, evidence, failure or threshold action, preservation behavior, and owner are clear enough for another builder or agent to run it without interpretation.
