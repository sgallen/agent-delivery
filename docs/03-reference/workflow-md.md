# Reference: `WORKFLOW.md`

`WORKFLOW.md` is the repository’s standing delivery contract.

It should answer the questions an agent or builder needs during the work—not retell the entire playbook. Keep it short enough to read before execution and specific enough to remove avoidable guesswork.

The copyable starter is [`templates/WORKFLOW.md`](../../templates/WORKFLOW.md).

## The core contract

A useful `WORKFLOW.md` names:

- the local lifecycle and who may move work into consequential states;
- what makes a Change ready;
- the one canonical workpad location;
- when an ExecPlan is warranted;
- the execution-environment rules and commands;
- the required gates and evidence;
- the conditions that require builder judgment;
- how work is resolved, including when nothing lands;
- how learning is folded back into the repository.

The default lifecycle is:

```text
Proposed → Shaped → Ready → Running → Proving → Decision → Resolved
                    ↘ Blocked / Paused ───────────────↗
```

Landing and release remain separate facts.

## Keep routine work routine

The workflow should not force a small bug through the same machinery as a migration, architecture change, or product experiment.

State the minimum intent, scope, proof, risk, and stop conditions needed for ordinary work. Add more structure only where the consequence warrants it.

For exploratory Changes, define the decision question and evidence for a useful non-landed outcome before execution begins.

## Advanced policies are optional

Add these when the repository has a real decision to improve:

- formal resolution classes and reporting;
- run and Change resource attribution;
- estimate ranges and thresholds;
- routing and escalation rules;
- initiative records and later value review;
- data-retention and access policy.

A threshold should name the decision it triggers, not only the number.

State what resource data is measured, estimated, missing, restricted, or excluded. Keep system learning separate from individual performance surveillance.

## The test

A useful `WORKFLOW.md` makes these questions answerable:

```text
What can start?
What may continue?
What must stop?
Who decides?
What proves the claim?
How does the work end when nothing lands?
What should the system learn?
```

Version material workflow changes so older Change records remain interpretable.
