# Playbook: Measure Delivery Economics

Provider price tables make the cost shift visible. Your own Change history makes it useful.

The purpose is not to minimize tokens, agent spend, or human involvement in isolation. It is to understand what the complete delivery system consumes, what it produces, and what should change next time.

## Outcome

After a small cohort of Changes, the team can answer:

- what machine and builder resources each Change consumed;
- how the work resolved and whether anything landed or released;
- where retries, review, recovery, or infrastructure drove cost;
- whether estimates were directionally useful;
- which model, workflow, or gate choices were economical for that kind of work;
- what the next similar Change should do differently.

Use the starter records in:

```text
templates/.agent/run-resource-use.json
templates/.agent/change-resource-summary.yml
```

The full schema lives in [Delivery Economics Records](../03-reference/delivery-economics-records.md).

## 1. Pick one comparable cohort

Choose a bounded class: customer-reported bugs, low-risk UI fixes, dependency updates, documentation, narrow backend work, or time-boxed experiments.

Do not average a copy edit, an authentication redesign, and a new product line into one reassuring number.

Five to twenty comparable Changes are enough to start seeing useful patterns. Keep delivery work and decision-oriented experiments separate when their intended outcomes differ.

## 2. Make every run attributable

Every provider request, environment, and attempt should inherit:

```text
project or repository
Change ID
run ID
activity: discovery | planning | implementation | review | recovery
parent initiative, when any
```

Use a gateway, agent wrapper, provider metadata, or environment variables. The mechanism is less important than consistency.

The first useful record can be modest:

```text
Change ID and run ID
provider and model
billed or estimated machine cost
environment cost
run outcome
builder minutes by broad activity
final Change outcome
landed / released
data-quality note
```

Do not wait for a perfect observability platform. It will be happy to wait for you.

## 3. Keep actual machine use—and every attempt

Capture provider-reported charges when available. Otherwise preserve the usage, pricing snapshot, and cost basis used for the estimate.

Keep model and tool cost, environment and CI cost, and subscription or local-compute allocations distinct. Do not recalculate old work with today’s price table and quietly rewrite history.

A run is an attempt, not the Change outcome. Keep failed, discarded, interrupted, recovery, and superseded runs attached to the Change. A later success does not make the earlier cost disappear.

Also record whether a run contributed to the final path, supporting evidence, recovery, or nothing useful. A completed run can still be irrelevant. A failed run can reveal the decisive constraint.

## 4. Record builder attention by capability

Use broad categories such as:

- customer discovery and product shaping;
- design or architecture judgment;
- agent direction;
- evidence or specialist review;
- recovery;
- release and operations.

Keep raw time separate from any cost conversion. Team-level capability patterns are usually more useful than individual rankings and considerably less corrosive.

## 5. Preserve the intended outcome and forecast

Before execution, say whether the Change is meant to deliver, investigate, experiment, or follow the evidence either way.

For exploratory work, write the decision question and what would count as a useful non-landed conclusion. For delivery work, preserve the landed acceptance criteria. Add stop conditions when a bounded failure would be informative.

Set a range only when it can change a decision:

```text
machine cost: $20–$55
builder attention: 45–90 minutes
landing expectation: likely, not required if the stop evidence is strong
confidence: low
basis: four comparable Changes
soft limit: $60
hard limit: $90
```

`estimate: not set` is better than invented precision. Preserve later forecasts instead of overwriting the first one.

## 6. Close the Change honestly

Record the final resolution, specific disposition, and landing and release status. [Changes](../01-operating-model/changes.md) defines the resolution model.

The important distinction is among:

- delivered capability;
- a work-derived decision not to land;
- closure for an external reason;
- unresolved loss.

Do not award “productive non-landing” with a checkbox. The evidence, uncertainty reduced, and changed decision should make it apparent.

Calculate:

```text
recorded machine cost
  = all model and tool attempts
  + environments and CI

recorded total delivery cost, when useful
  = recorded machine cost
  + monetized builder attention
```

Then keep the quality and outcome beside the cost: first-pass gates, rework, rollback, later defect, resolution quality, and material learning.

## 7. Compare forecast with actual

For each Change, ask:

- Did the actual fall inside the range?
- What assumption caused the largest variance?
- Did discovery or shaping materially improve the forecast?
- Did a threshold lead to a useful decision?
- Did the work resolve as expected?
- Was the data complete enough to trust?

The purpose is not to punish variance. It is to understand it.

## 8. Use a small, balanced metric set

Start with counts and medians. Small percentages can look impressive while describing three tickets.

Useful measures include:

```text
cost per trustworthy landed Change
cost per evidence-backed decision
resolution yield
landing yield
unresolved-loss rate
builder attention per outcome
first-pass gate success
rework or rollback rate
```

Always show spend by outcome class. “We spent $18,000 disproving three costly hypotheses” is different from “we spent $18,000 on work that disappeared.”

No metric deserves to become the scoreboard. Pair cost with evidence quality and, at the initiative level, realized value.

## 9. Improve one thing at a time

Look for patterns by Change type, subsystem, model, agent, skill, gate profile, environment, or builder-attention mix.

Then make the smallest useful change:

- route a task class differently;
- improve the Change Intent;
- add repository context or a skill;
- strengthen or remove a gate;
- change the environment;
- adjust the estimate range or threshold;
- split a Change class that behaves too differently;
- fix an ownership or recovery gap.

Review the cohort weekly while the practice is new. Change routing or policy monthly unless a serious failure demands faster action. Constant tuning creates noise faster than learning.

## Definition of done

- [ ] one comparable cohort is defined;
- [ ] every run and material environment cost is attributable to a Change;
- [ ] failed and superseded attempts remain in the record;
- [ ] builder attention is captured by broad capability;
- [ ] intended and actual outcomes are distinguishable;
- [ ] forecasts remain separate from actuals;
- [ ] delivered work, useful decisions, administrative closure, and unresolved loss are not blended;
- [ ] the team reviewed a small metric set with its data-quality limits;
- [ ] at least one routing, gate, context, estimate, or workflow decision changed because of the evidence.
