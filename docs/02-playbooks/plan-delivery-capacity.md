# Playbook: Plan Delivery Capacity

Agent budget is not independently scalable.

More model spend creates useful throughput only when the surrounding system can form worthwhile demand, shape the work, provide environments, review evidence, make stop decisions, release what lands, and operate what ships.

Use this after the team has enough delivery history to estimate real demand and human attention with at least directional honesty. It is most useful before adding substantial agent budget or committing a large initiative.

## Outcome

The team has:

- a forecast of worthwhile ready work;
- expected delivered, decision, administrative, and unresolved outcomes;
- required capacity by human capability, agent spend, and infrastructure;
- one named binding constraint;
- a comparison of where the next dollar or human hour could go;
- an explicit investment decision.

## 1. Forecast worthwhile demand

Distinguish the funnel:

```text
customer opportunities
→ initiatives worth investigating
→ Changes proposed
→ Changes shaped
→ Changes ready for execution
```

Ideas are not the same as ready work.

A team with $20,000 of available agent budget and $8,000 of credible shaped demand does not have an agent-budget problem. It has a discovery or shaping constraint.

## 2. Forecast the delivery funnel

For each comparable work class, estimate the range of:

```text
execution starts
landed Changes
useful non-landed decisions
administrative closures
unresolved loss
```

All of these consume agent, review, and environment capacity. Only some produce shipped capability; only some non-landed outcomes produce useful work-derived learning.

Use historical medians and ranges. Sparse data does not become wise because a spreadsheet has twelve decimal places.

## 3. Translate work into resource demand

Estimate the capability mix required:

```text
customer discovery per initiative
shaping per execution start
agent and environment spend by work class
review per delivered Change
judgment per experiment or stop decision
recovery per failed attempt
release and operations per landed capability
```

Do not collapse it into generic “people capacity.” Ten hours of customer discovery does not substitute for ten hours of security review.

Build a simple table:

| Capacity | Available | Required | Gap | Constraint? |
| --- | ---: | ---: | ---: | --- |
| Customer discovery |  |  |  |  |
| Product and design shaping |  |  |  |  |
| Architecture |  |  |  |  |
| Agent and model budget |  |  |  |  |
| Environment and CI |  |  |  |  |
| Evidence and specialist review |  |  |  |  |
| Decision ownership |  |  |  |  |
| Recovery |  |  |  |  |
| Release and operations |  |  |  |  |

## 4. Name the binding constraint

The binding constraint is the resource that limits additional worthwhile throughput now.

It may be demand formation, shaping, architecture, specialist review, decision ownership, infrastructure, agent budget, release capacity, or recovery discipline.

A high unresolved-loss rate may reveal an ownership or recovery constraint even when the nominal hours look sufficient.

Name one primary constraint. A plan with nine equal bottlenecks has usually avoided making a decision.

## 5. Compare investment scenarios

Model at least three choices. For example:

| Scenario | Expected effect | New constraint | Main risk |
| --- | --- | --- | --- |
| Add $15,000 agent budget | More execution starts and landed Changes | Specialist review | Experiments accumulate without decision capacity |
| Add a product-oriented builder | More shaped demand and absorbable agent work | Evidence review | Ramp time and domain context |
| Improve gates and environments | Less review per Change, fewer unresolved runs | Customer discovery | Up-front platform work takes longer to pay back |

For each scenario, state the expected cost, delivered outcomes, useful decisions, unresolved risk, human attention required, elapsed-time effect, confidence, assumptions, and next likely constraint.

The best investment is not always the one attached to the most visible queue.

## 6. Make the decision and review it later

Ask:

> Which investment most increases the system’s ability to produce trustworthy, worthwhile outcomes?

The answer may be more agent budget, a specific builder capability, stronger gates, better environments, clearer ownership, smaller Changes, less work in progress, or no new investment yet.

At the next planning checkpoint, compare the forecast with actual execution starts, outcomes, human and infrastructure use, unresolved loss, and the constraint that truly limited throughput.

Then update the ratios and find the next constraint.

```text
forecast demand
→ forecast outcome mix
→ translate into resource demand
→ identify the constraint
→ invest
→ measure actual outcomes
→ find the next constraint
```

## Definition of done

- [ ] ready work is distinguished from raw ideas;
- [ ] the forecast includes landed, decision, administrative, and unresolved outcomes;
- [ ] human capabilities, agent budget, infrastructure, and release capacity are visible separately;
- [ ] one binding constraint is named;
- [ ] at least three investment scenarios are compared;
- [ ] the chosen option states expected outcomes, human load, confidence, risk, and next likely constraint;
- [ ] actual results will be reviewed against the forecast.
