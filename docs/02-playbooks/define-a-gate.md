# Playbook: Define a Gate

Use this when converting a concern, review comment, repeated failure, or quality expectation into a durable gate.

The goal is not more process. It is to stop paying the same human attention tax repeatedly.

## Step 1: Name the failure mode

Examples:

- The agent changes files outside the requested scope.
- A UI Change adds an unrequested Copy Link action.
- Code bypasses the service layer.
- The page has console errors after the Change.
- Review repeatedly catches missing regression tests.
- UI work ignores design tokens.

If you cannot name the failure clearly, it is probably not ready to become a hard gate.

## Step 2: Choose the lightest durable form

Options include:

- documentation or example
- skill
- reviewer-agent rubric
- advisory gate
- required gate
- mechanical test or lint
- scheduled cleanup check.

Use the least rigid form that makes the failure less likely to recur.

## Step 3: Write the gate contract

Define:

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

Use these result states:

```text
pass
fail
not_applicable
blocked
waived
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
- architecture-check result.

## Step 5: Write a useful failure message

Bad:

```text
Architecture violation.
```

Better:

```text
UI code imported packages/billing/internal. Use packages/billing/public, or add an approved public API to the billing package and update the architecture contract.
```

A gate is also a teaching mechanism.

## Step 6: Add loop and stop behavior

State when the implementation agent should repair and retry, and when the run must stop for builder judgment.

Do not let a gate create an infinite loop with a very determined model.

## Step 7: Wire it into the system

Update the relevant:

- gate manifest
- `WORKFLOW.md`
- skill
- reviewer prompt
- docs or examples
- CI workflow
- PR evidence table.

## Step 8: Revisit it

Gates can become noisy, overly strict, redundant, or obsolete.

Keep gates that create trust. Fix or remove gates that create theater.

## Definition of done

A gate is ready when its purpose, applicability, pass condition, evidence, failure action, and owner are clear enough for another builder or agent to run it without interpretation.
