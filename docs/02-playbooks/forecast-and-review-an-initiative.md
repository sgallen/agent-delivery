# Forecast and Review an Initiative

A major feature, product line, platform capability, or operating program is not merely a larger ticket. It is an investment hypothesis with a delivery and resolution funnel.

This playbook connects the expected value to the complete resource envelope, the likely Change funnel, actual delivery dispositions, and later value or decision-value reviews.

## Outcome

At the end, the initiative has:

- an explicit value hypothesis and baseline;
- staged investment forecasts with ranges, confidence, and assumptions;
- an expected delivery funnel rather than an assumption that every Change will land;
- resource and decision gates;
- linked Change forecasts, actuals, and dispositions;
- an outcome review that can release, narrow, pivot, or conclude without release;
- scheduled value or decision-value reviews;
- lessons for future product judgment and estimation.

Use the copyable [Initiative Template](../03-reference/initiative-template.md).

## Procedure

### 1. Define the opportunity

Write:

- who has the problem or opportunity;
- the current baseline;
- what happens if the organization does nothing;
- the evidence that makes the opportunity worth investigating;
- important alternatives, including non-build options.

Do not begin with a backlog of presumed features. Begin with the outcome and the belief that it is worth pursuing.

### 2. State the value hypothesis

Separate customer value from business, operational, or strategic value.

For each, record:

```text
expected result
likely range
confidence
supporting evidence
invalidating evidence
review horizon
attribution type
```

Value may be revenue, retention, customer time saved, risk reduced, operating cost avoided, reliability, compliance, market access, reduced uncertainty, or a reusable capability.

Name the value. Do not force false precision.

### 3. Define the decisions and stop conditions

State what discovery and early Changes need to decide.

Examples:

```text
Is the problem painful enough to change customer behavior?
Can the architecture satisfy the required privacy boundary?
Does the expected value justify the continuing support cost?
Which workflow should proceed to full delivery?
```

Also state:

- what evidence would justify commitment;
- what evidence would justify narrowing or pivoting;
- what would justify concluding without release;
- which assumptions would invalidate the thesis.

A stop condition is part of responsible investment, not pessimism wearing a project-plan badge.

### 4. Create the opportunity estimate

Before detailed discovery, record a rough range for:

- customer and domain investigation;
- product and design shaping;
- architecture and technical work;
- agent, tool, and environment spend;
- builder review and recovery;
- rollout and operations;
- elapsed time;
- expected continuing cost.

Label confidence and major unknowns. The opportunity estimate exists to decide how much investigation is justified, not to become a contractual promise.

### 5. Forecast the Change funnel

Do not assume every proposed Change will enter execution or land.

Estimate ranges for:

```text
Changes proposed
Changes shaped
Changes entering execution
Changes resolved
Delivered Changes
Work-derived decision resolutions
Administrative closures
Unresolved losses
Released capabilities
```

For example:

```text
Proposed:                   30–40
Enter execution:            20–28
Delivered:                  14–20
Decision-resolved:           3–6
Administrative closure:      0–2
Unresolved loss:             0–2
```

Explain the basis. Early estimates may be low confidence. Preserve them anyway so the system can learn how the funnel changes after discovery and shaping.

### 6. Run discovery and update the forecast

Use customer research, prototypes, technical investigations, and bounded experiments to reduce the most consequential uncertainty.

Record:

- resources consumed;
- Changes and experiments resolved;
- what landed and what did not;
- hypotheses strengthened or weakened;
- updated value range;
- updated investment and funnel forecast;
- whether commitment is still justified.

Discovery that stops an initiative can be a successful outcome when the evidence is strong and the avoided investment is material.

### 7. Produce the post-shaping forecast

After scope, architecture, proof strategy, and Change decomposition are clearer, forecast the complete resource mix:

| Resource | Expected | Likely range | Available | Constraint |
| --- | ---: | ---: | ---: | --- |
| Customer discovery |  |  |  |  |
| Product and design shaping |  |  |  |  |
| Architecture |  |  |  |  |
| Agent and tool spend |  |  |  |  |
| Builder review and recovery |  |  |  |  |
| Environment and CI |  |  |  |  |
| Rollout and operations |  |  |  |  |
| Elapsed time |  |  |  |  |

Update the Change funnel and identify the binding constraint.

Record alternatives such as:

- staged release;
- narrower capability;
- prototype before commitment;
- platform investment first;
- buy, partner, or do nothing;
- different agent routing or environment posture.

### 8. Set commitment and resource gates

Define:

- initial authorized envelope;
- soft threshold and checkpoint behavior;
- hard threshold and accountable decision-maker;
- evidence required for the next stage;
- stop, narrow, or pivot conditions;
- allowed variance before a new investment decision.

A hard threshold should preserve state and force a decision. It should not erase the evidence needed to make one.

### 9. Link Changes and preserve dispositions

Every linked Change should carry:

- its role in the initiative;
- resolution intent: delivery, experiment, investigation, or either based on evidence;
- forecast and actual resource use;
- resolution status, class, and disposition;
- landed and released state;
- resolution quality and learning value;
- uncertainty reduced or reusable artifacts;
- effect on the initiative thesis and forecast.

Use a table such as:

| Change | Intended role | Resolution class | Disposition | Landed | Forecast | Actual | Learning / evidence |
| --- | --- | --- | --- | --- | ---: | ---: | --- |
|  |  |  |  |  |  |  |

Do not hide discarded paths or rejected work merely because a later Change succeeded.

### 10. Reforecast in flight

At meaningful checkpoints, compare:

```text
original investment forecast
latest investment forecast
actual to date

expected Change funnel
actual dispositions to date
latest funnel forecast

expected value
latest value range
```

Record the cause of material variance and the decision it triggered.

Useful decisions include:

- continue within the current envelope;
- authorize additional resource;
- narrow or stage scope;
- change model, gate, or environment strategy;
- create a prerequisite capability;
- pivot the thesis;
- conclude without release.

### 11. Hold the initiative outcome review

When delivery or investigation reaches a decision point, choose an explicit initiative outcome.

#### Released

Record:

- released capability;
- linked delivered, decision-resolved, administratively closed, and unresolved Changes;
- actual human, agent, infrastructure, and elapsed-time use;
- continuing obligations;
- delivery and resolution variance;
- planned value-review dates.

#### Concluded without release

Record:

- final decision and reason;
- evidence supporting the decision;
- linked Change dispositions;
- actual resource use;
- uncertainty reduced;
- reusable artifacts;
- redirected work or follow-up;
- credible avoided-cost estimate, if any, with assumptions and confidence;
- decision-value review date when the decision should be revisited.

#### Narrowed or pivoted

Record what remains, what stopped, which forecast changed, and whether a new initiative record is warranted.

### 12. Review realized value

For released initiatives, review at the horizon promised in the original thesis.

Capture:

- adoption and usage;
- customer outcome versus baseline;
- business, operational, or strategic result;
- continuing cost;
- unintended effects;
- attribution confidence;
- decision to expand, adapt, hold, stop, or retire.

For initiatives concluded without release, review decision value:

- Did later evidence confirm or weaken the stop decision?
- Was investment actually avoided or merely delayed?
- Were artifacts or learning reused?
- Did another initiative solve the need?
- Did the organization stop at the right time?

### 13. Compare three forms of variance

#### Delivery variance

What did the initiative consume compared with the forecast?

#### Resolution variance

How did the actual Change funnel and initiative outcome differ from expectation?

#### Value variance

What customer, business, operational, strategic, or decision value appeared compared with the hypothesis?

Do not collapse them. A team can estimate delivery well and choose a weak product bet. It can underestimate delivery and still create exceptional value. It can also spend modestly to discover that a promising initiative should not proceed.

### 14. Promote the learning

Update what the evidence earns:

- value-forecast assumptions;
- Change-funnel priors;
- discovery practices;
- delivery estimates;
- routing rules;
- architecture;
- gates and skills;
- resource thresholds;
- capacity plans;
- initiative selection criteria.

Every initiative should leave the organization better able to decide about the next one.

## Definition of done

- [ ] the original value hypothesis, baseline, horizon, and confidence are preserved;
- [ ] commitment, stop, and pivot criteria are explicit;
- [ ] opportunity, post-discovery, post-shaping, and in-flight forecasts remain distinguishable;
- [ ] the forecast includes an expected Change funnel;
- [ ] linked Changes roll up resource use, disposition, landed state, and learning;
- [ ] actual delivered, decision, administrative, and unresolved outcomes are visible;
- [ ] the initiative has an explicit released, concluded-without-release, narrowed, pivoted, administratively closed, or unresolved outcome;
- [ ] delivery, resolution, and value variance are separate;
- [ ] continuing cost is included when material;
- [ ] value or decision-value reviews are scheduled and completed at the appropriate horizon;
- [ ] future forecasts or investment decisions changed because of what was learned.

## Related material

- [Initiatives and the Value Loop](../01-operating-model/initiatives-and-value.md)
- [Resource Observability and Delivery Economics](../01-operating-model/resource-observability-and-delivery-economics.md)
- [Plan Delivery Capacity](plan-delivery-capacity.md)
- [Resolve a Change That Does Not Land](resolve-a-change-that-does-not-land.md)
- [Initiative Template](../03-reference/initiative-template.md)
