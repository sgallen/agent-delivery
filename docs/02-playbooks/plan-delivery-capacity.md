# Plan Delivery Capacity

Agent budget is not independently scalable.

More model spend produces useful throughput only when the surrounding system can form worthwhile demand, shape work, provide execution environments, review evidence, resolve non-landed work, release delivered outcomes, and operate what ships.

This playbook helps a team identify the binding constraint before allocating more budget or committing another initiative.

## Outcome

At the end, the team has:

- a demand and delivery-funnel forecast;
- required capacity by human capability, agent spend, and infrastructure;
- expected delivered, decision-resolved, administratively closed, and unresolved work;
- the current binding constraint;
- scenarios for where the next dollar or human hour should go;
- an explicit capacity decision.

## Inputs

Use the best available history for:

- proposed Changes by class;
- percentage shaped and entering execution;
- resolution, landing, decision, administrative-closure, and unresolved-loss rates;
- agent spend per Change by resolution class and disposition;
- builder attention by capability and disposition;
- review and recovery load;
- environment cost per run;
- cycle time;
- initiative forecasts and value priorities.

Start with medians and ranges. Sparse data does not become wise because a spreadsheet has twelve decimal places.

## Procedure

### 1. Forecast worthwhile demand

Estimate how much work the product system can responsibly form:

```text
customer opportunities identified
→ initiatives worth investigating
→ Changes proposed
→ Changes shaped
→ Changes ready for execution
```

Separate “ideas exist” from “work is shaped enough to absorb execution capacity.”

A team with $20,000 of available agent budget and only $8,000 of credible ready work does not have an agent-budget problem. It has a demand-formation or shaping constraint.

### 2. Forecast the delivery funnel

For each work class, estimate:

```text
Changes entering execution
delivered Changes
work-derived decision resolutions
administrative closures
unresolved losses
```

For example:

```text
Additional agent budget:               $10,000
Expected Changes entering execution:        24
Expected delivered Changes:                 16
Expected work-derived decisions:             5
Expected administrative closures:            2
Expected unresolved loss:                    1
```

Decision-resolved, administrative, and unresolved work all consume product judgment, review, and infrastructure. Only decision-resolved work should be credited with work-derived learning. Include all four classes.

### 3. Translate the funnel into resource demand

Use historical ranges to estimate:

```text
product discovery per proposed initiative
shaping per Change entering execution
agent and environment spend per outcome path
review per delivered Change
judgment per experiment or stop decision
recovery per failed attempt
release and operations per landed capability
```

A simple scenario might imply:

```text
Product discovery:                     45 h
Change shaping:                         38 h
Agent and environment spend:       $10,900
Evidence and specialist review:         52 h
Non-landing decision review:            16 h
Recovery and unresolved-work handling:  12 h
Release and operations:                 28 h
```

### 4. Build the capacity table

| Capacity | Available | Required | Gap | Constraint? |
| --- | ---: | ---: | ---: | --- |
| Customer discovery |  |  |  |  |
| Product and design shaping |  |  |  |  |
| Architecture |  |  |  |  |
| Agent and model budget |  |  |  |  |
| Environment and CI |  |  |  |  |
| Evidence and specialist review |  |  |  |  |
| Product / stop-decision judgment |  |  |  |  |
| Recovery |  |  |  |  |
| Release and operations |  |  |  |  |

Do not convert every capability into generic “people capacity.” Ten hours of customer discovery is not interchangeable with ten hours of security review.

### 5. Identify the binding constraint

The binding constraint is the resource that limits additional trustworthy throughput now.

Examples:

- **Demand formation** — not enough customer evidence or product shaping to justify more execution.
- **Architecture** — senior technical judgment cannot keep up with cross-system Changes.
- **Review** — delivered work waits for scarce evidence or specialist review.
- **Decision resolution** — experiments run, but nobody has capacity or authority to conclude them.
- **Infrastructure** — workspaces, CI, databases, or browser environments cannot support more concurrent runs.
- **Agent budget** — the surrounding system has absorbable work and review capacity, but execution funds are exhausted.
- **Release and operations** — delivered work accumulates faster than it can be safely launched or owned.

A high unresolved-loss rate may indicate an ownership or recovery constraint even when nominal capacity looks sufficient.

### 6. Model investment scenarios

Compare at least three options.

```text
Scenario A: Add $15,000 of agent budget
Expected effect: +22 execution starts, about 15 delivered Changes,
                 5 work-derived decisions, 1 administrative closure,
                 and 1 unresolved loss
Constraint after investment: specialist review
Risk: unresolved experiments rise if decision capacity does not grow

Scenario B: Add one product-oriented builder
Expected effect: +18 shaped Changes and +$9,000 absorbable agent demand
Constraint after investment: evidence review

Scenario C: Improve gates and execution environments
Expected effect: -25 minutes review per delivered Change,
                 lower unresolved-loss rate,
                 +60 Changes of quarterly review capacity
Constraint after investment: customer discovery
```

Include:

- expected cost;
- delivered outcomes;
- work-derived decisions;
- administrative closures;
- unresolved risk;
- human attention required;
- elapsed-time effect;
- next likely constraint;
- confidence and assumptions.

### 7. Choose the next unit of investment

Ask:

> Which investment most increases the system’s ability to produce trustworthy delivered capability and useful decisions?

The answer may be:

- more agent budget;
- another builder with a specific capability;
- stronger automated gates;
- better execution infrastructure;
- better repository context or skills;
- a smaller Change shape;
- clearer decision ownership;
- less work in progress.

Do not default to the most visible queue.

### 8. Compare forecast with actual

At the next planning checkpoint, review:

- actual Changes entering execution;
- actual delivered and released outcomes;
- actual work-derived decisions;
- actual administrative closures;
- unresolved loss and spend;
- actual human and infrastructure use;
- the constraint that truly limited throughput;
- whether the investment moved the bottleneck as expected.

Use the difference to update both capacity ratios and outcome-path estimates.

## Capacity loop

```text
forecast worthwhile demand
→ forecast the Change funnel
→ translate it into resource demand
→ identify the binding constraint
→ allocate the next unit of investment
→ measure delivered, decision, administrative, and unresolved outcomes
→ locate the next constraint
```

This is a production-system loop, not a one-time headcount exercise.

## Definition of done

- [ ] demand formation and ready work are distinguished;
- [ ] the plan includes all four resolution classes rather than only delivered work;
- [ ] required human capability, agent budget, infrastructure, and release capacity are visible;
- [ ] decision resolution, administrative closure, and unresolved loss consume explicit capacity in the model;
- [ ] one binding constraint is named;
- [ ] at least three investment scenarios are compared;
- [ ] the chosen scenario states expected outcomes, human load, unresolved risk, confidence, and the next likely constraint;
- [ ] actual results will be reviewed against the forecast.

## Related material

- [Resource Observability and Delivery Economics](../01-operating-model/resource-observability-and-delivery-economics.md)
- [Initiatives and the Value Loop](../01-operating-model/initiatives-and-value.md)
- [Measure Delivery Economics](measure-delivery-economics.md)
- [Forecast and Review an Initiative](forecast-and-review-an-initiative.md)
