# Gates

Gates are how quality stops depending on who happens to be reviewing that afternoon.

A gate is a reusable expression of team judgment with a clear result and evidence. It may be a test, command, browser journey, reviewer assessment, decision checkpoint, or human approval. What matters is that the system knows what it is checking, what counts as enough, and what should happen next.

If agents can produce more work, “ask the senior engineer who usually knows” does not scale particularly well.

## Four useful kinds of gate

### Mechanical

Objective checks that should usually be automated: format, lint, typecheck, build, tests, dependency rules, architecture boundaries, forbidden imports, and similar constraints.

### Behavioral

Proof that the product does what the Change claimed:

- acceptance criteria mapped to tests or observable behavior;
- a browser journey that passes;
- clean console, server, or network signals where relevant;
- screenshots, video, logs, or traces that show the result;
- accessibility and compatibility checks appropriate to the risk.

For a bug fix, reproduction should usually be the first gate. Produce a failing test, browser path, log query, or other stable signal before changing the implementation. Then prove the same signal is clean afterward.

That is more useful than asking an agent for a plausible patch and admiring its confidence.

### Judgment

Structured review for concerns that require taste, context, or tradeoffs: code, architecture, design, product, security, privacy, operations, or test sufficiency.

A builder, reviewer agent, or both may perform the gate. The risk and nature of the Change determine who must decide.

### Decision

Some gates decide whether the work should continue, narrow, stop, or resolve differently than expected.

Examples include:

- an experiment answered its decision question;
- evidence supports abandoning one path and choosing another;
- risk left the approved boundary;
- an external owner is closing the work for a clear reason;
- the remaining effort is no longer justified.

A failed implementation check can become useful evidence. It does not automatically make the next decision for the team.

At greater maturity, spend, elapsed time, scarce environment use, or reviewer capacity can trigger a decision gate. Use a progressive response:

```text
warning → update the forecast
soft threshold → explain the variance and propose options
hard threshold → preserve state and require a decision
```

Never design a stop that destroys the workpad, evidence, or recovery path.

## A gate contract

Every gate should say:

| Field | Question |
| --- | --- |
| `id` | What stable name identifies it? |
| `purpose` | Which failure or decision does it protect against? |
| `applies_when` | Which Changes require it? |
| `runner` | What command, agent, or human performs it? |
| `pass_condition` | What must be true? |
| `evidence` | What proves the result? |
| `failure_action` | Repair, retry, block, escalate, or decide? |

Use a small result vocabulary:

```text
pass | fail | not_applicable | blocked | waived
```

`not_applicable` needs a reason. `waived` needs an accountable builder and a rationale. “Probably fine” remains available as a feeling, not a gate status.

## Match the gate set to the risk

A documentation edit, a UI polish Change, a schema migration, and an authentication boundary should not carry the same proof burden.

Define a few gate profiles by Change class and risk. Keep the blocking set small enough to give fast feedback and strong enough to justify the next transition. Run broader checks as advisory gates, scheduled scans, post-release monitors, or recurring cleanup.

A gate system can recreate the old bottleneck under a more technical name. Twelve generic reviewers waiting in sequence are still a queue.

## Know when to loop and when to stop

Let the agent keep working when the failure is actionable, the Change remains in scope, and progress is visible.

Engage a builder when:

- intent is missing or contradictory;
- the same failure repeats without progress;
- repair requires product, design, architecture, security, or business judgment;
- the environment cannot produce trustworthy evidence;
- the agent crosses a forbidden boundary;
- risk leaves the approved Change class;
- a hard threshold is reached;
- the evidence points toward a different outcome.

A useful failure message explains what failed, where the evidence lives, and what kind of repair or decision is required. Gates are part of the feedback system, not merely traffic lights.

## Make repeated judgment durable

A sensible progression is:

```text
human observation
  → review comment
  → documented example or skill
  → reviewer rubric
  → advisory gate
  → required gate
  → mechanical check where possible
```

Do not automate vague judgment too early. That creates brittle process with a green checkmark.

Do not leave the same costly judgment trapped in one person’s head forever either.

## Rule

The goal is not a wall of gates. It is a system that can move quickly because “ready,” “within bounds,” and “good enough to decide” have become increasingly explicit and trustworthy.
