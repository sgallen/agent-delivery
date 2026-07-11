# Measure Agent Economics

The public price table makes the shift tangible. Your own Change data makes it useful.

The goal is not to minimize tokens. The goal is to reduce the cost and time required to produce trustworthy outcomes without quietly moving the burden into human review.

## Outcome

At the end of this playbook, each agent run records enough information to calculate:

- model and infrastructure cost per Change;
- builder minutes per Change;
- attempts and gate failures;
- cost per accepted Change;
- cycle time and rework rate;
- which model or workflow is economical for each class of work.

## Start with a small schema

Record this for every run:

```json
{
  "change_id": "123",
  "run_id": "20260711T120000Z",
  "started_at": "2026-07-11T12:00:00Z",
  "completed_at": "",
  "provider": "openai",
  "model": "gpt-5.6-terra",
  "pricing_snapshot_date": "2026-07-11",
  "input_tokens": 0,
  "cached_input_tokens": 0,
  "cache_write_tokens": 0,
  "output_tokens": 0,
  "model_cost_usd": 0,
  "tool_cost_usd": 0,
  "environment_cost_usd": 0,
  "attempt": 1,
  "gate_result": "pass",
  "failed_gates": [],
  "builder_minutes": {
    "intent": 0,
    "judgment": 0,
    "review": 0,
    "harness_recovery": 0
  },
  "final_disposition": "accepted",
  "notes": ""
}
```

A starter file lives at `templates/.agent/run-economics.json`. Store the run copy under `.agent/runs/...`, then upload it with the run artifacts or summarize it into the Change Record. A local ignored file is useful; it is not durable by magic.

## Procedure

### 1. Capture actual usage

Prefer provider-reported token and tool usage. Do not estimate from character count once production telemetry exists.

Record separate values for:

- uncached input;
- cached input or cache reads;
- cache writes when the provider charges for them;
- output and reasoning tokens where exposed;
- search, computer-use, or other paid tools;
- managed runtime or cloud environment time.

### 2. Record attempts, not just the winner

A failed run still cost money and attention.

Link all attempts to the same Change. Record whether each attempt:

- failed a gate;
- was blocked by missing context;
- was discarded exploration;
- needed builder intervention;
- produced the accepted result.

### 3. Measure builder attention

Track minutes separately before converting them into dollars. False precision is not insight.

Useful categories include:

- intent shaping;
- product or design judgment;
- code or architecture review;
- troubleshooting the harness;
- reviewing evidence;
- recovery or rollback.

The most important early signal may be that a “cheap” model created an expensive review session.

### 4. Calculate the Change economics

```text
total Change cost =
  all model attempts
  + tools
  + execution environments
  + valued builder attention
```

Then calculate:

```text
cost per accepted Change
time to accepted Change
builder minutes per accepted Change
first-pass gate success
rework or rollback rate
```

Keep builder minutes visible even if you do not assign a dollar value yet.

### 5. Compare within a Change class

Do not compare a copy edit to a risky data migration and call the result model science.

Compare like with like:

- low-risk UI fixes;
- customer-reported bugs;
- dependency updates;
- documentation work;
- medium-sized features;
- architecture refactors.

### 6. Use the result to route work

A reasonable policy may emerge:

```text
routine + objective + strong gates
  → lower-cost model

ambiguous or long-horizon
  → higher-capability model

same gate fails twice
  → stronger model or builder judgment

high consequence or weak observability
  → builder-led or collaborative execution
```

Treat this as a hypothesis. Review it against outcomes.

### 7. Review weekly, change monthly

Weekly, look for obvious waste or broken instrumentation.

Monthly, review:

- the most and least economical Change classes;
- models with high retry or review burden;
- gates that prevent costly mistakes;
- environments that sit running without creating value;
- classes of work ready for more or less builder engagement.

Do not optimize the model bill while defect cost is rising. That would be impressively efficient and entirely beside the point.

## Definition of done

- [ ] every run has an economics record persisted with the run artifacts or Change Record;
- [ ] failed and discarded attempts are included;
- [ ] model, tools, and environment costs are recorded;
- [ ] builder minutes are tracked;
- [ ] accepted Changes can be grouped by class;
- [ ] the team can calculate cost and attention per accepted Change;
- [ ] model-routing or workflow changes are based on measured outcomes.

## Related material

- [The Cost Curve Made Concrete](../00-the-case/02-the-cost-curve-made-concrete.md)
- [Model Economics](../03-reference/model-economics.md)
- [Changes](../01-operating-model/changes.md)
- [Learning Checkpoints](../01-operating-model/learning-checkpoints.md)
