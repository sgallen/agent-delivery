# Playbook: Define a Gate

Use this when a concern, review comment, repeated failure, or decision boundary deserves a durable check.

The goal is not more process. It is to stop paying for the same mistake—or the same avoidable debate—over and over.

## Step 1: Name the failure or decision

Examples:

- The agent changes files outside the requested scope.
- A UI Change adds behavior nobody asked for.
- Code bypasses an architectural boundary.
- Tests pass while the browser console is failing.
- Review repeatedly catches missing regression coverage.
- The work has reached a point where continuing requires an accountable decision.

If you cannot name the failure or decision clearly, it is probably not ready to become a hard gate.

## Step 2: Choose the lightest durable form

Options include:

- documentation or an example;
- a skill;
- a reviewer rubric;
- an advisory check;
- a required gate;
- a human approval;
- a mechanical test or lint.

Use the least rigid form that makes the failure less likely or the decision more accountable.

## Step 3: Write the contract

```yaml
id: scope
purpose: Prevent unrelated or forbidden changes.
applies_when: all code changes
required: true
runner: scripts/gates/scope
pass_condition: All changed files and behaviors are within the Change Intent.
evidence: changed-file report and reviewer summary
failure_action: repair, or block when forbidden scope was touched
```

Use a small result vocabulary:

```text
pass
fail
not_applicable
blocked
waived
```

`not_applicable` needs a reason. `waived` needs an accountable builder and a rationale.

A gate that produces vibes is not a gate. It is a meeting with JSON.

## Step 4: Define the evidence

Evidence may be:

- command output;
- a test report;
- a screenshot or browser trace;
- a reviewer finding;
- a diff summary;
- an architecture check;
- a benchmark or experiment result;
- an accountable decision record.

The evidence should make the result independently understandable.

## Step 5: Write a useful failure message

Bad:

```text
Architecture violation.
```

Better:

```text
UI code imported packages/billing/internal. Use packages/billing/public, or add an approved public API and update the architecture contract.
```

A good message says what failed, why it matters, where the evidence is, and what a reasonable repair looks like.

## Step 6: Define loop and stop behavior

State when the agent should repair and retry, when it should ask for judgment, and what state must survive a stop.

Do not let a gate create an infinite loop with a very determined model.

When the gate is a resource checkpoint, use the same discipline:

```text
warning → update the forecast
soft threshold → explain variance and propose options
hard threshold → preserve state and require a decision
```

The workpad, diff, evidence, and recovery path should survive.

## Step 7: Wire it into the system

Update only what needs to know about the gate:

- gate manifest;
- `WORKFLOW.md`;
- Change template or workpad;
- skill or reviewer prompt;
- CI or orchestrator;
- PR evidence table.

## Step 8: Revisit it

Gates can become noisy, overly strict, redundant, or obsolete.

Keep gates that create trust or useful decisions. Fix or remove gates that create theater or more cost than the failure they prevent.

## Definition of done

A gate is ready when another builder or agent can understand its purpose, applicability, evidence, failure action, and owner without interpretation.
