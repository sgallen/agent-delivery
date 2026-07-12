# Resource Observability and Delivery Economics

A provider bill tells you what the model cost.

It does not tell you whether the spend produced a clean fix, a useful product decision, three abandoned attempts, or two hours of senior review nobody planned for.

That is the reason to connect resource use to delivery—not to turn product work into a finance exercise, but to give the system a memory of what work actually took.

This is an advanced operating capability. The first job is still to create a trustworthy path from intent to evidence and decision.

## Start where the meaning lives

Use a simple hierarchy:

```text
Initiative, when there is a larger product bet
  → Change
      → Run
          → model, tool, and environment events
```

A run tells you what happened during one attempt.

A Change tells you what it took to reach an outcome.

An initiative tells you what the larger bet consumed and, later, whether it was worthwhile.

Do not start by building the portfolio layer. Start by giving each run a Change ID and each Change an honest ending.

## Record enough to answer a real question

For machine work, useful fields may include model and provider, tokens or billable usage, routing and fallback, tools, environment and CI use, elapsed time, retries, and failed attempts.

For human work, record the kind of attention when it helps explain the result:

- customer discovery or product shaping;
- design or architecture judgment;
- agent direction;
- evidence or specialist review;
- recovery, release, or operational ownership.

Keep raw time or effort separate from any monetary conversion. Many teams will sensibly choose not to monetize human time at all.

Measure the system, not the person. A builder may create enormous leverage by preventing a bad initiative, clarifying one sentence of intent, or improving a gate that saves hundreds of later review hours. A utilization row will miss the point.

## Grow the practice in stages

### 1. Attribute

Associate the run, agent, model, tools, environment, retries, and any meaningful builder involvement with a Change.

That lets the team ask:

> What did this work consume, and what did it produce?

For many teams, this alone is a meaningful step forward.

### 2. Estimate

Add a range, confidence, and assumptions when the estimate can improve a decision.

```text
Agent and environment spend: $20–$55
Builder attention: 45–90 minutes
Confidence: low
Basis: four comparable Changes
```

A range based on weak evidence is honest. A precise number based on weak evidence is theater.

Preserve forecast stages rather than overwriting them:

```text
opportunity → post-discovery → post-shaping → in flight → final actual
```

The movement between those estimates can show which activities reduced uncertainty and which surprises changed the work.

### 3. Govern

Use thresholds as decision points, not traps:

```text
approaching limit → warn and update the forecast
soft limit        → explain the variance and replan
hard limit        → preserve state and require a decision
```

The answer may be more budget, narrower scope, a stronger model, a prerequisite Change, or a decision to stop.

### 4. Learn and route

Compare similar work by Change type, repository area, model, agent, skill, gate profile, environment, outcome, and review burden.

A stronger model may cost more per request and less per trustworthy outcome. A cheaper model may be ideal for narrow work with clear gates. The useful comparison includes retries, recovery, and human attention—not just the provider price.

Use the history to improve shaping, decomposition, context, routing, escalation, skills, gates, environments, and estimates.

### 5. Plan capacity and investment

Once the records are credible, roll Changes into initiatives and ask whether the surrounding system can absorb more agent capacity.

The constraint may be customer discovery, product shaping, senior review, test infrastructure, release support, or operational ownership. Another $10,000 of model budget does not create useful throughput when the rest of the system is saturated.

That is when the question becomes:

> Where should the next human hour, agent dollar, or infrastructure investment go?

## Use a few honest measures

No single number deserves to become the scoreboard.

Useful measures may include total recorded cost per trustworthy delivered Change, cost per evidence-backed decision, builder attention, first-pass gate success, rework, rollback, resolution yield, and unresolved loss.

Keep different outcomes separate. Delivered work, exploratory decisions, administrative closure, and unresolved loss do not mean the same thing and should not be blended into a flattering average.

“Recorded” matters too. Subscription usage, local compute, direct-provider calls, and unmeasured human effort may be missing. Say what the data does not know.

## Let the estimator stay humble

With enough comparable history, the system can learn from work type, subsystem, risk, test surface, repository familiarity, Change quality, model and agent choice, environment, and human capability mix.

It should return ranges, confidence, and important unknowns—not a suspiciously exact number.

Old comparisons can also go stale as models, prices, architecture, workflows, and teams change. Do not let a learned estimator turn yesterday’s friction into permanent truth.

## Rule

Make resource use visible at the level where it can improve a decision.

Begin with attribution and an honest outcome. Add estimates, thresholds, routing, capacity planning, and learned forecasting only after the records have earned the extra machinery.
