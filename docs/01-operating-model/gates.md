# Gates

Gates are how quality becomes durable.

A gate is a reusable expression of team judgment with a clear result and evidence. It may be a command, test, browser journey, reviewer-agent assessment, or human approval. What matters is that the system knows what it is checking, what counts as pass or fail, and what to do next.

If agents can produce more work, the team needs a better answer to “Is this ready?” than “Ask the senior engineer who usually knows.”

## Gate types

### Mechanical gates

Objective checks that should usually be automated:

- format
- lint
- typecheck
- build
- unit and integration tests
- dependency checks
- architecture boundaries
- forbidden imports
- coverage rules.

### Behavioral gates

Proof that the product behaves as intended:

- acceptance criteria mapped to tests or observable behavior
- browser journey passes
- no unexpected console or server errors
- relevant logs and traces are clean
- screenshots or video show the expected outcome
- accessibility checks pass.

For a bug fix, the first behavioral gate should usually be reproduction. This is the useful core of the eval-first bug workflow demonstrated in the [Gusto CTO example](https://youtu.be/5FKBkUCaLa8). Produce a failing test, eval, browser path, log query, or other deterministic signal before changing the implementation. Then prove that the same signal is clean after the fix.

This failing-before, passing-after pattern is more useful than asking an agent for a plausible patch and admiring its confidence.

### Judgment gates

Structured review for concerns that require taste, context, or tradeoff evaluation:

- code review
- architecture review
- design review
- product review
- security review
- test sufficiency review.

Judgment gates may be performed by a builder, a reviewer agent, or both. The required reviewer depends on risk and the class of Change.

## A gate contract

Every gate should define:

| Field | Meaning |
| --- | --- |
| `id` | Stable name for the gate |
| `purpose` | The failure mode or quality concern it protects against |
| `applies_when` | Which Changes require it |
| `required` | Whether failure blocks progress |
| `runner` | Command, reviewer agent, or human role that executes it |
| `pass_condition` | What must be true |
| `evidence` | What proves the result |
| `failure_action` | Repair, retry, block, or escalate |

Use a small result vocabulary:

```text
pass
fail
not_applicable
blocked
waived
```

`not_applicable` needs a reason. `waived` needs an accountable builder and a recorded rationale. “Probably fine” is not a status.

## Gate sets should match the risk

The goal is not to run every possible gate on every Change.

A documentation edit, a low-risk UI fix, a schema migration, and an authentication change should not all carry the same proof burden.

Define gate profiles by Change class and risk. Keep the blocking set small enough to provide fast feedback and strong enough to justify the next state transition.

Use other checks as:

- advisory gates
- scheduled scans
- post-merge monitors
- recurring cleanup work.

This matters because gate systems can recreate the old bottleneck under a more technical name. A Change that waits an hour for twelve generic reviewers is not obviously better than a Change that waited for a meeting.

## When the agent should keep working

The orchestrator should loop when:

- a required gate fails
- the failure is actionable
- the Change remains within scope
- the run is still making progress.

It should stop and engage a builder when:

- the same failure repeats without progress
- the gate exposes missing or conflicting intent
- repair requires a product, design, architecture, security, or business decision
- the environment cannot produce trustworthy evidence
- the agent changes forbidden or unrelated surfaces
- the risk is outside the approved Change class.

A useful failure message should tell the next agent what failed, where the evidence is, and what kind of repair is expected. Gates are part of the feedback system, not merely traffic lights.

## Gate maturity

A useful progression is:

```text
human observation
  → review comment
  → documented principle or example
  → reviewer-agent rubric
  → advisory gate
  → required gate
  → mechanical check where possible
```

Do not automate vague judgment too early. That creates brittle process with a green checkmark.

Do not leave repeated judgment trapped in people’s heads. That creates human bottlenecks.

## The promotion rule

- One-off issue: review comment.
- Repeated issue: documentation, example, or skill.
- Costly repeated issue: gate, regression test, lint, or reviewer rule.
- Broad drift: scheduled cleanup agent or architecture check.

The goal is not a wall of gates.

The goal is a system that can move quickly because “ready” is increasingly explicit, observable, and trustworthy.
