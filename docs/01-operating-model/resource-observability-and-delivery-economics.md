# Resource Observability and Delivery Economics

A provider bill tells you what the model cost. It does not tell you whether the work was worth it.

That distinction matters. A $20 run might produce a clean fix that lands. It might also be the third failed attempt on a poorly shaped Change. The dollars are identical. The delivery outcome is not.

Agent Delivery makes a more useful kind of visibility possible: connect the resources consumed to the work, the decision, and eventually the value that followed.

This is not an attempt to reduce every judgment to money or every builder to a utilization number. It is a way to give the delivery system a memory.

## The Change is where cost gains meaning

Use this hierarchy:

```text
Portfolio
  Initiative
    Change
      Run
        model, tool, and environment events
```

Each level answers a different question:

- **Run:** What happened during this attempt?
- **Change:** What did it take to reach this outcome?
- **Initiative:** What did it take to test or create this product capability, and was the bet worthwhile?
- **Portfolio:** Where should the next human hour, agent dollar, infrastructure dollar, or unit of attention go?

Do not start by building the portfolio layer. Start by giving every run a Change ID and every Change an explicit resolution.

## Record the complete resource mix

Tokens are useful. They are not the whole system.

For machine work, capture enough to reconstruct provider and model use, routing or fallback, billable usage, tools, execution environments, CI, retries, elapsed time, and failed attempts.

For human work, record the kind of attention involved:

- customer discovery and product shaping;
- design or architecture judgment;
- agent direction;
- evidence and specialist review;
- exception handling, recovery, release, and operational ownership.

Keep raw time or effort separate from any monetary conversion. Cost assumptions change, and many teams will sensibly choose not to monetize human time at all.

Measure this to improve the system, not to rank individuals. A builder may create enormous leverage by preventing a bad initiative, clarifying one sentence of intent, or improving a gate that saves hundreds of later review hours. A row in a utilization report will miss the point.

Finally, pair the resource record with the outcome: how the Change resolved, whether anything landed or released, what evidence passed, how much rework followed, what uncertainty was reduced, and which initiative the work served.

## Grow the practice in stages

Resource observability is foundational. Financial control at maximum sophistication is not.

### 1. Attribute

Associate agent, tool, environment, retry, and builder-attention data with a Change.

That alone lets the team ask:

> What did this work consume, and what did it produce?

### 2. Estimate

Add a range, confidence, and assumptions when the estimate can influence a decision.

```text
Agent and environment spend: $20–$55
Builder attention: 45–90 minutes
Likely outcome: deliver, with a bounded stop available
Confidence: low
Basis: four comparable Changes
```

A range based on weak evidence is honest. A precise number based on weak evidence is theater.

### 3. Govern

Turn thresholds into pause points:

```text
approaching limit → warn and update the forecast
soft limit        → explain the variance and replan
hard limit        → preserve state and require a decision
```

The result may be more budget, narrower scope, a stronger model, a prerequisite Change, or a decision to stop. A hard stop that destroys the context is not governance. It is an expensive way to forget.

### 4. Learn and route

Compare similar Changes by work type, repository area, model, agent, skill, gate profile, environment, and outcome.

A stronger model may cost more per request and less per trustworthy landed Change. A cheaper route may be right for a bounded investigation. The intended outcome determines the meaningful comparison.

Use the history to improve decomposition, routing, escalation, context, skills, gates, environments, and estimates.

### 5. Plan capacity and investment

Roll Changes into initiatives. Forecast the mix of human attention, agent spend, infrastructure, elapsed time, and likely outcomes. Then identify the constraint before adding budget.

This is advanced mode. It becomes credible only after the earlier records are consistent.

## Let forecasts change as knowledge improves

One frozen estimate hides the most interesting part of planning: how uncertainty changes.

Preserve a few stages:

```text
opportunity      rough order of magnitude
post-discovery   updated after customer and domain learning
post-shaping     updated after scope, architecture, and Change decomposition
in flight        updated from actual progress and discovered complexity
final actual     the complete resource and outcome record
```

This shows not only whether the team estimated well, but which activities made the estimate better. Discovery or shaping may cost money while reducing the total expected investment. A small experiment may prevent a much larger commitment. Make that visible without pretending the counterfactual is certain.

## Use a small set of honest measures

The broad cost equation is:

```text
models and tools
+ execution environments and CI
+ failed and superseded attempts
+ builder attention, when monetized
= recorded delivery cost
```

Pair it with quality and outcome. At minimum, keep these cohorts separate:

- **Delivered work:** cost per trustworthy landed Change, first-pass gates, rework, rollback, and builder attention.
- **Decision work:** cost per evidence-backed decision, uncertainty reduced, and whether the decision held up later.
- **Administrative closure:** cost spent before an external priority or ownership decision closed the work.
- **Unresolved loss:** cost consumed without a sufficient outcome or accountable decision.

Also watch the funnel:

```text
resolution yield = well-resolved Changes / Changes entering execution
landing yield    = landed Changes / Changes entering execution
decision yield   = evidence-backed non-landed decisions / Changes entering execution
unresolved loss  = unresolved Changes / Changes entering execution
```

No one number deserves to become the scoreboard. A team can game merge rate, resolution yield, cost per Change, and almost anything else. Read the measures together with evidence quality, product value, and the nature of the work.

“Recorded” matters too. Subscription use, local compute, work outside the workflow, and unmeasured human effort may be missing. Say what the record does not know.

## More agent budget does not guarantee more throughput

Another $10,000 of model spend is useful only if the surrounding system can turn it into good work.

The real constraint may be:

- not enough customer-informed demand;
- weak product shaping;
- senior review capacity;
- poor automated gates;
- environment or CI limits;
- release and operational support;
- too much unresolved work already in flight.

The better question is:

> Can the complete delivery system absorb more agent capacity and convert it into worthwhile outcomes?

Sometimes the next dollar belongs in models. Sometimes it belongs in a product-oriented builder, a reviewer, test infrastructure, or a gate that lets the existing team supervise more work safely. Sometimes the honest answer is to spend nothing yet.

## The system can learn to estimate

With enough comparable history, the estimator can use work type, risk, subsystem, test surface, unfamiliar context, Change quality, model and agent choice, environment, human capability mix, and current queue constraints.

It should return ranges, confidence, and likely outcome mix—not a suspiciously exact number.

```text
Expected execution starts: 14–17
Expected landed Changes: 9–12
Expected useful non-landed decisions: 2–4
Expected unresolved loss: 0–2
Expected total spend: $11,000–$17,000
```

Evaluate whether ranges contain the actuals, whether confidence is calibrated, where the system repeatedly underestimates, and whether model, workflow, architecture, or team changes have made old comparisons stale.

Do not let a learned estimator turn yesterday’s friction into permanent truth.

## Rule

Make resource use visible at the level where it can improve a decision.

Begin with attribution and an honest outcome. Add estimates, thresholds, routing, capacity planning, and learned forecasting only after the records have earned the extra machinery.
