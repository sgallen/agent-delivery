# Measure Delivery Economics

Provider price tables make the shift tangible. Your own delivery and resolution records make it useful.

The goal is not to minimize tokens, model spend, human involvement, or non-landing independently. The goal is to improve the cost, speed, quality, and reliability with which the complete system produces trustworthy delivered capability and useful decisions—and to build enough history to estimate and plan the next work better.

## Outcome

At the end of this playbook, the team can:

- attribute provider, tool, environment, attempt, and builder-attention use to a Change;
- record how the Change resolved and whether anything landed or released;
- distinguish delivered work, work-derived decisions, administrative closure, and unresolved loss;
- calculate cost per trustworthy landed Change and cost per evidence-backed decision;
- calculate resolution, landing, decision, administrative-closure, and unresolved-loss rates;
- compare original forecast, latest completion forecast, actual resource use, and actual disposition;
- identify retry, review, rework, environment, and unresolved-work cost;
- compare like-for-like Change classes and resolution paths;
- improve model routing, thresholds, gates, task decomposition, and estimation;
- roll Changes into initiative funnels and capacity plans when the data is mature enough.

## Start with the smallest useful record

Starter schemas live at:

```text
templates/.agent/run-resource-use.json
templates/.agent/change-resource-summary.yml
```

The normalized structure is explained in [Delivery Economics Records](../03-reference/delivery-economics-records.md).

Store one record for every run under the Change’s run directory or in a durable observability store. A local ignored file is useful; it is not durable by magic.

Do not wait for a perfect accounting platform. The first useful version may be:

```text
Change ID
run ID
provider and model
billed or estimated machine cost
environment cost
run status and contribution
builder minutes by broad activity
resolution class and disposition
landed / released
resolution quality and learning value
data-quality notes
```

## Procedure

### 1. Choose one comparable Change class

Begin with a bounded class such as:

- low-risk UI fixes;
- customer-reported bugs;
- dependency updates;
- documentation work;
- narrow backend improvements;
- time-boxed product experiments;
- technical feasibility investigations.

Do not average a copy edit, an authentication redesign, and a new product line into one comforting number.

Separate delivery-oriented and decision-oriented cohorts when their intended outcomes differ.

### 2. Establish attribution

Every provider request, tool charge, environment event, and attempt needs:

- project or repository;
- Change ID;
- run ID;
- activity such as discovery, planning, implementation, review, or recovery;
- parent initiative when one exists.

Use a gateway, agent wrapper, environment variables, or provider metadata. The mechanism matters less than consistent inheritance across the run.

### 3. Capture actual machine usage

Record, where available:

- requested and served model;
- provider request ID;
- input, cached, output, and reasoning usage;
- provider-reported charge;
- external tool and search charges;
- sandbox, container, browser, database, CI, and preview cost;
- pricing snapshot date and cost basis;
- retry and fallback chains.

Keep cost bases separate:

```text
billed
estimated_list_price
allocated_subscription
local_compute_estimate
other
```

Do not rewrite history with today’s price table. Preserve the charge or pricing snapshot used at the time.

### 4. Keep every attempt

A run is an attempt, not the final Change outcome.

Record both:

```text
run outcome
  completed / failed_gate / blocked / discarded / superseded /
  stopped_at_resource_gate / interrupted

contribution
  resolution_path / supporting_evidence / recovery /
  other_attempt / none
```

A discarded run can contribute decisive evidence. A completed run can contribute nothing useful. Keep those dimensions separate.

Do not delete failed attempts from the accounting merely because a later run succeeded. That makes the final path look artificially cheap and removes the data needed to improve routing and recovery.

### 5. Capture builder attention by capability

Useful categories include:

- customer discovery;
- product shaping;
- design judgment;
- architecture;
- agent direction;
- evidence and specialist review;
- recovery;
- release and operations.

Keep raw time even if the team never monetizes it. Use capability and team-level patterns to improve the system. Do not turn the telemetry into covert individual performance surveillance.

### 6. Define the intended resolution

For each Change, record the resolution intent:

```text
deliver
experiment
investigate
either_based_on_evidence
mixed
```

Then state:

- the decision question when one exists;
- the expected resolution class and disposition;
- whether landing is expected, possible, or not required;
- what evidence would justify delivery;
- what evidence would justify stopping, rejecting, narrowing, or replacing;
- what would count as a useful work-derived decision;
- stop conditions and resource envelope.

This prevents the estimator from treating every Change as a miniature feature that failed when it did not merge. It also prevents failed delivery work from being relabeled as a successful experiment after the fact.

### 7. Add a forecast when it can change a decision

For a routine first experiment, `estimate: not set` is acceptable.

When the Change is material, record:

```text
expected machine cost and likely range
expected builder attention and likely range
expected elapsed time and likely range
expected resolution class and disposition
landing expectation or probability
confidence
comparable Changes
assumptions
soft and hard thresholds, if any
```

For an initiative or cohort, forecast the distribution across all four resolution classes rather than assuming every execution start becomes delivered work.

Preserve later forecasts rather than overwriting the first one.

### 8. Calculate the Change actual

```text
recorded machine cost =
  all model attempts
  + provider and external tools
  + execution environments
  + CI and validation
```

Optionally calculate:

```text
recorded total delivery cost =
  recorded machine cost
  + monetized builder attention
```

Then pair it with:

```text
resolution status, class, and disposition
landed and released state
resolution quality and learning value
cycle time
builder minutes
first-pass gate success
rework or rollback
later defect signal
uncertainty reduced and decision changed
```

### 9. Classify the final resolution

Use four analytical classes:

```text
delivered
  intended product or system outcome accepted and landed or released

decision
  work-derived evidence supports a useful non-landed decision

administrative
  explicit closure for an external priority, ownership, policy, or funding reason
  without claiming material work-derived learning

unresolved_loss
  execution ended without enough evidence, preserved context, or accountable judgment
```

Use a specific disposition such as:

```text
accepted
experiment_concluded
hypothesis_rejected
technically_infeasible
stopped_at_resource_gate
superseded
deprioritized
rejected_at_review
cancelled_external
abandoned_without_resolution
```

Record:

- `resolution_status: resolved | unresolved`;
- `resolution_class: delivered | decision | administrative | unresolved_loss`;
- the specific disposition and reason category;
- `landed: true | false | null`;
- `released: true | false | null`;
- `resolution_quality: weak | sufficient | strong | not_assessed`;
- `learning.value: none | low | material | high`;
- supporting evidence;
- uncertainty reduced, decision changed, reusable artifacts, and follow-up.

A productive non-landing is derived from a `decision` resolution with an adequate evidence record. It is not a boolean the team can set to make an abandoned branch look successful.

An administrative closure can be accountable and useful without being product learning. An `unresolved_loss` remains visible even when the issue itself must be closed.

### 10. Compare forecast with actual

Record:

- actual minus expected resource use;
- whether actual fell inside the likely range;
- expected versus actual resolution class and disposition;
- whether landing and release occurred as expected;
- which assumption failed;
- which stage changed the estimate;
- whether the threshold produced a useful decision;
- whether a non-landed path was anticipated or discovered late.

Do not punish a well-governed Change merely because it exceeded the first estimate or concluded without landing. The purpose is to understand variance and improve the next forecast.

### 11. Calculate a balanced metric set

Use counts and rates together. A small cohort can make percentages theatrical.

#### Cost per trustworthy landed Change

```text
all recorded cost for delivered-class Changes in the cohort,
including failed and superseded attempts attached to them
÷ trustworthy landed Changes in the cohort
```

Use a separate release-level metric when landing and user release are materially different.

#### Cost per evidence-backed decision

```text
all recorded cost for decision-class Changes with sufficient or strong resolution quality
÷ those evidence-backed decisions
```

Do not include administrative closure in this denominator.

#### Resolution yield

```text
Changes with an explicit and adequately recorded delivered,
decision, or administrative disposition
÷ Changes that entered execution
```

Resolution yield measures operating control, not product success. Always show the class mix beside it.

#### Landing yield

```text
trustworthy landed Changes
÷ Changes that entered execution
```

For delivery-only cohorts, also show landing yield among Changes that were intended to deliver.

#### Decision yield

```text
decision-class resolutions with sufficient or strong quality
÷ Changes that entered execution
```

#### Administrative-closure rate

```text
administratively resolved Changes
÷ Changes that entered execution
```

A rising rate may be healthy reprioritization or a sign that the organization starts work before commitment is real. Investigate rather than celebrate or condemn it automatically.

#### Unresolved-loss rate

```text
unresolved-loss Changes
÷ Changes that entered execution
```

#### Spend by resolution class

At minimum, separate:

```text
delivered work
work-derived decisions
administrative closures
unresolved loss
```

Within delivered and decision work, preserve failed, recovery, and superseded attempt cost. Do not combine the classes into one average and pretend the meaning survived.

### 12. Compare within the cohort

Look for patterns by:

- Change type, resolution intent, and risk;
- repository and subsystem;
- agent, model, skill, and workflow version;
- gate profile;
- environment class;
- builder capability mix;
- first-pass versus recovery path;
- final resolution class, disposition, and quality.

Use medians, ranges, distributions, and counts before reaching for a complicated estimator.

### 13. Improve routing and the operating system

A policy may emerge:

```text
routine delivery + objective criteria + strong gates
  → lower-cost model

ambiguous or long-horizon delivery
  → higher-capability model

bounded experiment with cheap proof
  → economical model and strict stop condition

same gate fails twice
  → stronger model, better context, or builder judgment

high consequence or weak observability
  → builder-led or collaborative execution
```

Treat the policy as a hypothesis. Evaluate total resolution economics, not per-token price.

Repeated variance or unresolved loss may call for:

- smaller Changes;
- better intent, decision, or resolution criteria;
- stronger context or skills;
- an architecture improvement;
- a new gate;
- a different environment;
- a changed estimate or threshold;
- clearer ownership and abandonment handling.

### 14. Roll up the delivery funnel cautiously

After the run and Change data is credible, use it to support:

- initiative forecasts;
- expected proposed, shaped, and executed Changes;
- expected delivered, decision-resolved, administratively closed, and unresolved Changes;
- quarterly resource scenarios;
- model and agent routing;
- reviewer-capacity planning;
- environment capacity;
- learned cost and resolution-path estimators.

Preserve model, pricing, workflow, repository, and team-context versions. Historical work may stop being comparable when the system changes materially.

### 15. Review weekly, change monthly

Weekly, fix broken attribution, unclear dispositions, missing attempts, and obvious waste.

Monthly, review:

- the most and least economical comparable Change classes;
- forecast calibration;
- delivered, decision, administrative-closure, and unresolved-loss rates;
- models with high retry or review burden;
- gates that prevent costly mistakes or enable good stop decisions;
- environments that consume without producing evidence;
- current human or technical capacity constraints;
- classes of work ready for more or less builder engagement.

Do not optimize the model bill while defect cost is rising, unresolved work is accumulating, or product value is falling. That would be impressively efficient and entirely beside the point.

## Definition of done

- [ ] every run is attributable to a Change;
- [ ] every run records both its status and contribution;
- [ ] failed, discarded, superseded, and recovery attempts are included;
- [ ] model, tools, environment, and validation costs are recorded or explicitly unknown;
- [ ] builder attention is tracked by useful activity;
- [ ] resolution status, class, disposition, landing, release, quality, and learning value are recorded;
- [ ] productive non-landing is supported by decision evidence rather than a self-declared flag;
- [ ] administrative closure is separated from product learning;
- [ ] unresolved loss remains visible;
- [ ] data-quality flags identify estimates and missing usage;
- [ ] Changes can be grouped by comparable class and intended resolution;
- [ ] the team can calculate cost per landed Change, cost per evidence-backed decision, resolution yield, class-specific rates, and spend by class;
- [ ] material Changes preserve forecast, actual, disposition, and variance;
- [ ] routing, gate, estimate, or workflow changes are based on measured outcomes rather than model fandom.

## Related material

- [The Cost Curve Made Concrete](../00-the-case/02-the-cost-curve-made-concrete.md)
- [Resource Observability and Delivery Economics](../01-operating-model/resource-observability-and-delivery-economics.md)
- [Changes](../01-operating-model/changes.md)
- [Resolve a Change That Does Not Land](resolve-a-change-that-does-not-land.md)
- [Delivery Economics Records](../03-reference/delivery-economics-records.md)
- [Initiatives and the Value Loop](../01-operating-model/initiatives-and-value.md)
