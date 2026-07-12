# Playbook: Forecast and Review an Initiative

A major feature, platform capability, product line, or operating program is not merely a larger ticket. It is an investment hypothesis.

This playbook connects the value the team expects, the resources likely to be required, the Changes that actually happen, and the value—or decision value—that appears later.

Use the copyable [Initiative Template](../03-reference/initiative-template.md).

## Outcome

The initiative has:

- a clear value thesis and baseline;
- staged resource ranges with confidence and assumptions;
- an expected Change funnel that admits not all work will land;
- commitment, stop, and reforecast points;
- linked Change actuals and outcomes;
- an explicit release, pivot, narrowing, or conclusion decision;
- a later review of realized value or the quality of the stop decision.

## 1. Name the opportunity

Write who has the problem, the current baseline, what happens if the organization does nothing, and the evidence that makes the opportunity worth investigating.

Include alternatives. “Build the feature we already imagined” is not the same thing as defining the opportunity.

## 2. State the value hypothesis

Separate customer value from business, operational, or strategic value.

For each, record:

```text
expected result and likely range
baseline
confidence
supporting and invalidating evidence
review horizon
attribution type
```

Value may be revenue, retention, customer time saved, risk reduced, lower operating cost, reliability, compliance, market access, reduced uncertainty, or a reusable capability.

Name what should change. Do not force false precision, and do not hide behind “strategic.”

## 3. Define the decisions and stop conditions

State what discovery and early Changes must decide.

```text
Is the problem painful enough to change behavior?
Can the architecture satisfy the privacy boundary?
Does the expected value justify the continuing support cost?
Which workflow, if any, should proceed?
```

Write the evidence required to commit, narrow, pivot, or conclude without release. A stop condition is part of responsible investment, not pessimism wearing a project-plan badge.

## 4. Create the opportunity range and Change funnel

Before detailed discovery, estimate the rough range for customer investigation, shaping, architecture, agent and environment spend, builder review and recovery, rollout, continuing cost, and elapsed time.

Then forecast the funnel:

```text
proposed Changes
shaped Changes
execution starts
landed Changes
useful non-landed decisions
administrative closures
unresolved loss
released capabilities
```

Early ranges may be wide and low confidence. Preserve them anyway. The purpose is to decide how much investigation is justified and later learn what the team misunderstood.

## 5. Use discovery to reduce the expensive uncertainty

Run customer research, prototypes, technical investigations, and bounded experiments against the assumptions most likely to change the investment decision.

After discovery, record what was spent, what landed, what did not, which beliefs strengthened or weakened, and the revised value, resource, and Change-funnel ranges.

Discovery that stops an initiative can be a good outcome when the evidence is strong and the larger commitment is genuinely avoided.

## 6. Shape the investment and find the constraint

Once scope, architecture, proof strategy, and Change decomposition are clearer, build a capacity view:

| Resource | Expected | Likely range | Available | Constraint? |
| --- | ---: | ---: | ---: | --- |
| Customer discovery |  |  |  |  |
| Product and design shaping |  |  |  |  |
| Architecture |  |  |  |  |
| Agent and tool spend |  |  |  |  |
| Review and recovery |  |  |  |  |
| Environment and CI |  |  |  |  |
| Rollout and operations |  |  |  |  |

Consider staged release, narrower scope, platform work first, buy or partner options, or doing nothing.

Set the initial authorized envelope, soft and hard thresholds, evidence required for the next stage, and the person accountable for crossing the limit.

## 7. Roll Changes up and reforecast

Each linked Change should carry its intended role, forecast, actual resource use, final outcome, landing and release status, evidence, and effect on the initiative thesis.

Do not hide discarded or rejected paths because a later Change succeeded.

At meaningful checkpoints, compare:

```text
original forecast ↔ latest forecast ↔ actual to date
expected funnel   ↔ actual outcomes  ↔ remaining funnel
expected value    ↔ latest evidence  ↔ current value range
```

Explain material variance and the decision it triggered: continue, add resource, narrow, stage, change approach, create a prerequisite, pivot, or stop.

## 8. Make the initiative decision

At the decision point, record one clear outcome:

- **Released:** what reached users, the complete actual investment, continuing obligations, and scheduled value reviews.
- **Concluded without release:** the evidence, uncertainty reduced, actual investment, reusable artifacts, redirected work, and date to revisit the decision if appropriate.
- **Narrowed or pivoted:** what stopped, what remains, and whether a new initiative record is cleaner.
- **Administrative closure or unresolved loss:** the external basis or the failure to reach a sufficient decision, without decorating either as product learning.

## 9. Review value at the promised horizon

For released initiatives, compare adoption, customer outcome, business or operational result, continuing cost, and unintended effects with the original thesis.

For initiatives concluded without release, ask whether later evidence supported the stop, whether the investment was actually avoided or merely delayed, and whether the learning or artifacts were reused.

Keep direct attribution, influenced outcomes, proxies, and counterfactual estimates separate.

Finally, review three variances:

```text
Delivery:   What did it consume compared with the forecast?
Resolution: How did the work conclude compared with the expected funnel?
Value:      What appeared compared with the thesis?
```

A team can estimate delivery well and choose a weak product bet. It can underestimate delivery and still create exceptional value. Do not collapse those lessons.

## 10. Promote the learning

Update only what the evidence earns: value assumptions, Change-funnel priors, discovery practice, estimates, routing, architecture, gates, thresholds, capacity plans, or initiative-selection criteria.

Every initiative should make the organization better at deciding about the next one.

## Definition of done

- [ ] the original value thesis, baseline, horizon, and confidence remain visible;
- [ ] commitment, stop, and pivot conditions are explicit;
- [ ] staged forecasts are preserved rather than overwritten;
- [ ] the expected and actual Change funnels are visible;
- [ ] linked Changes roll up actual resources and outcomes;
- [ ] the initiative has an explicit final decision;
- [ ] delivery, resolution, and value variance remain separate;
- [ ] continuing cost is included when material;
- [ ] a value or decision-value review is scheduled and completed at the appropriate horizon;
- [ ] a future forecast or investment decision changed because of the evidence.
