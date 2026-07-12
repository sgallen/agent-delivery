# Reference: Delivery Economics Records

This is an advanced reference for teams that have chosen to measure delivery economics. It is not the minimum record for a first Change.

This reference defines a small data model for connecting resource use to delivery resolution and initiative outcomes.

Use the minimum fields that support a real decision. Add detail only when it improves estimation, governance, routing, capacity planning, resolution quality, or learning.

## Record hierarchy

```text
Initiative record
  rolls up Change records

Change record
  rolls up Run records

Run record
  rolls up provider, tool, and environment events
```

A run is an attempt. A Change is the unit of resolution. An initiative is the unit of investment and value learning.

## Run resource record

A run record should capture:

```json
{
  "schema_version": "1.2",
  "repository": "example/product",
  "initiative_id": "INIT-004",
  "change_id": "187",
  "run_id": "20260711T231500Z",
  "branch": "agent/issue-187",
  "commit": "a6c93de",
  "started_at": "2026-07-11T23:15:00Z",
  "completed_at": "2026-07-11T23:42:00Z",
  "agent": "coding-agent",
  "harness": "agent-cli",
  "workflow_version": "2026-07-12",
  "gate_profile": "low-risk-ui",
  "activity": "experiment",
  "attempt": 1,
  "model_usage": [
    {
      "event_id": "evt_01",
      "occurred_at": "2026-07-11T23:16:00Z",
      "provider_request_id": "req_01",
      "provider": "provider-name",
      "requested_model": "model-alias",
      "served_model": "model-version",
      "activity": "experiment",
      "pricing_snapshot_date": "2026-07-11",
      "input_tokens": 0,
      "cached_input_tokens": 0,
      "cache_write_tokens": 0,
      "output_tokens": 0,
      "reasoning_tokens": 0,
      "cost_usd": 0,
      "cost_basis": "billed"
    }
  ],
  "tool_usage": [
    {
      "kind": "web_search",
      "provider": "provider-name",
      "quantity": 0,
      "unit": "call",
      "cost_usd": 0,
      "cost_basis": "billed"
    }
  ],
  "environment_usage": [
    {
      "kind": "sandbox",
      "quantity": 0,
      "unit": "compute_hour",
      "cost_usd": 0,
      "cost_basis": "local_compute_estimate"
    }
  ],
  "builder_minutes": {
    "customer_discovery": 0,
    "product_shaping": 0,
    "design_judgment": 0,
    "architecture": 0,
    "agent_direction": 0,
    "evidence_review": 0,
    "specialist_review": 0,
    "recovery": 0,
    "release_operations": 0
  },
  "gate_result": "pass",
  "failed_gates": [],
  "run_outcome": {
    "status": "completed",
    "contribution": "supporting_evidence",
    "candidate_resolution_class": "decision",
    "candidate_disposition": "technically_infeasible",
    "stop_reason": "",
    "summary": "The prototype established the permission-boundary constraint."
  },
  "data_quality": {
    "usage_complete": true,
    "direct_provider_calls_may_be_missing": false,
    "subscription_usage_allocated_or_excluded": true,
    "environment_cost_estimated": true,
    "builder_time_estimated": true
  },
  "notes": ""
}
```

Use arrays because one run may route across providers or models, call several priced tools, and consume more than one environment. The `activity` field allows later analysis of discovery, shaping, planning, implementation, investigation, experiment, review, recovery, and release operations without forcing every workflow into separate runs.

Recommended `run_outcome.status` values include:

```text
completed
failed_gate
blocked
discarded
superseded
stopped_at_resource_gate
interrupted
```

Recommended `run_outcome.contribution` values include:

```text
resolution_path
supporting_evidence
recovery
other_attempt
none
```

A discarded run can still contribute supporting evidence. A completed run can still contribute nothing useful. Keep status and contribution separate inside `run_outcome`.

Keep the provider’s raw usage response when practical. Normalize it for analysis, but do not discard request IDs or source fields needed to reconcile a bill later. `cost_basis` should distinguish billed spend, list-price estimates, allocated subscription spend, and local-compute estimates.

## Change resource summary

The Change summary connects resolution intent, forecasts, policy, actuals, disposition, and learning.

```yaml
schema_version: "1.2"
repository: example/product
subsystem: authorization
change_id: "187"
initiative_id: "INIT-004"
change_type: experiment
risk: medium
gate_profile: backend-change
workflow_version: "2026-07-12"

resolution_intent:
  mode: experiment
  decision_question: Can the existing authorization boundary support delegated access safely?
  expected_resolution_class: decision
  expected_disposition: hypothesis_rejected
  landing_expectation: not_required
  release_expectation: not_required
  landed_acceptance_criteria: []
  non_landed_resolution_criteria:
    - a reproducible permission-boundary result
    - a recommendation to proceed, redesign, or stop
  stop_conditions:
    - hard machine limit reached without new evidence

forecast:
  stage: post_shaping
  expected_machine_usd: 40
  likely_range_machine_usd: [25, 60]
  expected_builder_minutes: 90
  likely_range_builder_minutes: [60, 150]
  expected_builder_minutes_by_capability:
    product_shaping: 20
    architecture: 15
    evidence_review: 55
  expected_elapsed_minutes: 180
  likely_range_elapsed_minutes: [120, 300]
  expected_resolution_distribution:
    delivered: 0.15
    decision: 0.75
    administrative: 0.05
    unresolved_loss: 0.05
  confidence: medium
  comparable_changes: ["121", "144", "163"]
  assumptions:
    - existing authorization abstraction is reusable

resource_policy:
  soft_machine_limit_usd: 50
  hard_machine_limit_usd: 75
  soft_builder_minutes: 140
  hard_builder_minutes: 210
  soft_elapsed_minutes: null
  hard_elapsed_minutes: null
  other_constraints:
    - senior_security_review
  on_soft_limit: checkpoint_and_reforecast
  on_hard_limit: preserve_state_and_require_decision

actual:
  resolution_path_model_and_tool_usd: 31.20
  resolution_path_environment_usd: 3.80
  supporting_evidence_usd: 2.60
  recovery_usd: 1.50
  other_attempt_usd: 0
  total_recorded_machine_usd: 39.10
  cost_basis_breakdown_usd:
    billed: 35.30
    estimated_list_price: 0
    allocated_subscription: 0
    local_compute_estimate: 3.80
    other: 0
  builder_minutes_by_capability:
    product_shaping: 18
    architecture: 12
    agent_direction: 14
    evidence_review: 42
    recovery: 18
  total_builder_minutes: 104
  elapsed_minutes: 215

outcome:
  resolution_status: resolved
  resolution_class: decision
  disposition: hypothesis_rejected
  landed: false
  released: false
  resolution_quality: strong
  reason_category: technical_constraint
  summary: Existing boundaries cannot support delegated access without redesign.
  criteria_result: non_landed_resolution_criteria_met
  first_pass_gates: false
  rework_or_rollback: false
  decision:
    owner: architecture-builder
    decided_at: "2026-07-12T01:15:00Z"
    basis: permission-boundary evidence
  evidence:
    - artifacts/permission-boundary-report.md
  learning:
    value: high
    uncertainty_reduced:
      - authorization architecture feasibility
    decisions_changed:
      - create an authorization-boundary prerequisite before delegated access
    reusable_artifacts:
      - permission-boundary test harness
  follow_up:
    decision: create_prerequisite_change
    changes:
      - "204"

variance:
  machine_usd_vs_expected: -0.90
  builder_minutes_vs_expected: 14
  actual_inside_likely_range: true
  expected_vs_actual_resolution: decision_as_expected
  explanation: ""

data_quality:
  run_records_complete: true
  direct_provider_calls_may_be_missing: false
  subscription_usage_allocated_or_excluded: true
  environment_cost_estimated: true
  builder_time_estimated: true
  resolution_evidence_complete: true
  notes: ""
```

### Resolution classes

Use four broad classes:

| Class | Meaning |
| --- | --- |
| `delivered` | The intended artifact or capability was accepted and landed or released |
| `decision` | Work-derived evidence supported a useful non-landed decision |
| `administrative` | The Change was explicitly closed for an external priority, ownership, policy, or funding reason without claiming material work-derived learning |
| `unresolved_loss` | Work entered execution and ended without sufficient evidence, ownership, or explicit resolution |

The class is analytical. The disposition is specific. For example, `deprioritized` may be `administrative`, while `hypothesis_rejected` is normally `decision`.

Recommended dispositions include:

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

Repositories may adapt the vocabulary. Do not use one generic `cancelled` value after execution when a more informative conclusion is available.

`resolution_quality` describes how well the evidence or accountable basis supports the disposition:

```text
weak
sufficient
strong
not_assessed
```

`learning.value` describes the materiality of work-derived learning:

```text
none
low
material
high
```

A productive non-landing is derived from `resolution_class: decision` plus an adequate evidence record. Do not store a self-declared `productive_non_landing` flag.

### Landing and release

Keep these separate:

- `landed` means the artifact entered the durable product, repository, configuration, or operating system;
- `released` means the outcome became available to intended users or operators.

A merged feature may be landed but not released. An investigation may have neither. Use `null` where the concept is genuinely not applicable rather than forcing `false` into every workflow.

### Resolution-path cost

`resolution_path_*` contains resources used by runs that materially supported the final delivered or decision resolution. `supporting_evidence_usd` records other evidence-producing attempts. `recovery_usd` isolates recovery work. `other_attempt_usd` records failed, discarded, or superseded attempts that did not materially support the final resolution. `total_recorded_machine_usd` is the sum of all of them.

For unresolved loss, the resolution path may be zero. The total cost still remains visible.

Keep this convention explicit so failed attempts are neither hidden nor counted twice.

## Migration from earlier schemas

Version 1.1 made non-landed resolution explicit. Version 1.2 aligned the copyable schemas with the four resolution classes, added expected resolution distributions, split supporting-evidence and recovery cost, and added candidate class and disposition to run outcomes. When migrating older records:

- replace a flat run `final_disposition` or `run_outcome` with `run_outcome.status`, `run_outcome.contribution`, optional candidate class and disposition, `run_outcome.stop_reason`, and `run_outcome.summary`;
- replace `accepted_path_*` with `resolution_path_*`;
- replace a `productive_non_landing` boolean with `resolution_class`, `resolution_quality`, and the nested `learning` record;
- preserve `landed` and add `released` separately;
- map generic `cancelled` values to a specific disposition and classify them as `decision`, `administrative`, or `unresolved_loss` from the evidence rather than from the label alone.

Do not infer high learning value merely because an old record says `cancelled` or `experiment`. Mark uncertainty explicitly when the historical evidence is incomplete.

## Initiative record

An initiative record should preserve five layers:

1. **Value hypothesis** — expected customer, business, operational, strategic, or decision result.
2. **Investment and funnel forecast** — expected human, agent, infrastructure, elapsed-time, continuing cost, and Change resolution mix.
3. **Delivery and resolution actual** — rolled-up Change dispositions, landing/release states, and resource use.
4. **Initiative disposition** — release, continue, narrow, replace, defer, or evidence-backed conclusion.
5. **Outcome actual** — observed value or decision quality at defined review points.

Use [`initiative-template.md`](initiative-template.md) for a copyable Markdown structure.

## Recommended dimensions

### Work context

- repository and subsystem;
- Change and initiative type;
- resolution intent;
- risk and gate profile;
- workflow and harness version;
- architecture area;
- specification or decision-question quality;
- environment class.

### Agent context

- agent or harness;
- provider and model;
- model-routing policy;
- skill or prompt version;
- activity: discovery, shaping, planning, implementation, investigation, experiment, review, recovery, release operations, or another explicit class.

### Human context

Prefer capability and activity to individual identity:

- discovery;
- shaping;
- design;
- architecture;
- direction;
- review;
- recovery;
- operations.

Individual-level analysis may be appropriate in some teams, but it should be consensual, access-controlled, and interpreted carefully. Do not turn delivery telemetry into covert performance surveillance.

### Resolution and outcome context

- resolution status and class;
- specific disposition;
- landed and released state;
- resolution quality and learning value;
- acceptance or decision-criteria result;
- gate result;
- defect, rollback, or rework;
- cycle time;
- value link.

## Core calculations

### Recorded machine cost

```text
model usage
+ provider tools
+ external tools
+ execution environment
+ CI and validation
= recorded machine cost
```

### Recorded total delivery cost

```text
recorded machine cost
+ monetized builder attention, when used
= recorded total delivery cost
```

Keep builder minutes even when the team does not assign a dollar value.

### Cost per trustworthy landed Change

```text
sum of costs for delivered Changes in the cohort,
including all attached attempts
÷ number of landed Changes in the cohort
```

### Cost per evidence-backed decision

```text
sum of costs for decision-resolved Changes in the cohort
÷ number of decision-resolved Changes in the cohort
```

Do not combine these denominators. Delivered capability and uncertainty reduction are different outputs.

### Resolution yield

```text
Changes with an explicit and adequately recorded delivered, decision,
or administrative disposition
÷ Changes that entered execution
```

### Landing yield

```text
landed Changes
÷ Changes that entered execution
```

### Decision yield

```text
evidence-backed, decision-resolved, non-landed Changes
÷ Changes that entered execution
```

### Administrative closure rate

```text
administratively resolved Changes
÷ Changes that entered execution
```

### Unresolved-loss rate

```text
unresolved-loss Changes
÷ Changes that entered execution
```

Report spend by the same classes. Use resolution yield with class mix, resolution quality, rework, defects, and value. Resolution yield measures operating control, not product success. A team can game any isolated metric.

### Forecast variance

```text
actual - expected
```

Also track whether actual fell inside the likely range, whether confidence was calibrated, and whether the actual resolution class fell within the forecast distribution.

## Pricing and historical integrity

Store the pricing snapshot or billed amount used at the time of the request.

Do not recalculate history using today’s price without labeling the result as a retail-equivalent restatement. Historical actuals and current-price comparisons answer different questions.

Separate:

```text
actual billed spend
estimated billed spend
retail-equivalent spend
allocated subscription spend
estimated local-compute cost
unattributed spend
```

## Data quality

Every rollup should be able to say what it does not know.

Useful flags include:

- provider usage complete;
- direct-provider calls may be missing;
- subscription usage allocated or excluded;
- environment cost measured or estimated;
- builder time measured or estimated;
- historical pricing exact or reconstructed;
- run contribution classified;
- resolution evidence complete;
- outcome and value review complete.

The system should improve data quality over time without pretending early records are cleaner than they are.

## Retention and access

Resource records may contain sensitive operational and personnel information.

Define:

- who can see raw request metadata;
- whether prompts or content are retained;
- how long run records remain available;
- which human data is stored;
- what is aggregated before leadership or portfolio reporting;
- how dispositions and corrections are made.

Economic observability should increase trust, not create a new reason to avoid the workflow.
