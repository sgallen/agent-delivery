# Reference: Change Intent Issue Template

The issue body is the stable statement of intent. It should describe the outcome or decision, boundaries, proof, original resource posture, and credible resolution paths without becoming a live progress log.

The copyable GitHub Issue Form lives at:

```text
templates/.github/ISSUE_TEMPLATE/change_intent.yml
```

## Required information

### Parent initiative

Link the initiative when the Change contributes to a larger product investment. Routine independent work may leave this blank.

### Outcome or decision

State what should become observably true or which decision the work should enable.

### Why it matters

Give the customer, business, product, initiative, or technical context.

### Change type, resolution intent, and landing expectation

The type describes the work. The resolution intent describes the path the work is allowed to take:

```text
delivery
experiment
investigation
either_based_on_evidence
```

Record whether landing is `expected`, `possible`, or `not_required`. This prevents an investigation from being judged like a failed feature and prevents a failed feature from being relabeled as an experiment after the fact.

### Current state

Describe the existing behavior, failure signal, or uncertainty.

### Decision question

Experiments, investigations, and either-based-on-evidence Changes should state the decision the evidence must support.

### Landed acceptance criteria

Define what must be true for a `delivered` resolution.

### Useful non-landed resolution criteria

Define what evidence would support a `decision` resolution such as `experiment_concluded`, `hypothesis_rejected`, `technically_infeasible`, `stopped_at_resource_gate`, `superseded`, or `rejected_at_review`.

A useful non-landed path should name the uncertainty, evidence, minimum quality, and follow-up or stop action. It should not be invented after implementation becomes difficult.

### Stop conditions

State what should end execution early and force a decision. Examples include a hard resource threshold without new evidence, an invalidated product premise, or a constraint that cannot be satisfied.

### Validation and evidence

Name the proof required for either delivery or decision: tests, reproduction signals, browser journeys, research, logs, traces, screenshots, benchmarks, specialist review, or comparison evidence.

### Non-goals and forbidden changes

Protect scope and make unsafe or distracting changes explicit.

### Affected surfaces

Name the likely code, data, product, or decision surfaces.

### Gate profile and risk

Choose the local workflow’s gate profile and risk class.

### Resource and resolution forecast

When useful, preserve expected resource ranges, confidence, assumptions, expected resolution class or distribution, and landing expectation.

### Resource thresholds

Name the action at a soft and hard threshold. A resource gate should preserve state and lead to an explicit decision rather than an unexplained termination.

### Expected builder engagement

Name where customer, product, design, architecture, evidence, specialist, stop, or release judgment is likely to enter.

## Readiness rule

The issue form can require fields. It cannot determine whether the criteria are coherent, whether the non-landed path is honest, or whether the evidence would support the claimed resolution. `Ready` remains an accountable workflow decision.
