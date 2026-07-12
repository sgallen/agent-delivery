# Initiatives and the Value Loop

At the Change level, the system learns what work costs and how it resolves.

At the initiative level, it learns whether the investment was worth making—and whether stopping, narrowing, or changing course was the right decision.

An **initiative** is a meaningful product investment: a large feature, a new product line, a platform capability, a reliability program, or another coherent bet that may require many Changes.

The Change remains the unit of execution and resolution. The initiative is the unit of investment and product learning.

## Close the complete loop

```text
Opportunity
  → value hypothesis
  → investment and resolution forecast
  → delivery, experiments, and decisions
  → actual resource use
  → initiative disposition
      ↘ release and value realization
      ↘ evidence-backed conclusion without release
  → learning and reallocation
```

Delivery completion is an important milestone. It is not the final answer.

A team can deliver the wrong thing cheaply and on time. It can also spend a modest amount proving that a promising initiative should not continue. Both the delivered capability and the decision not to invest further should be examined against the original thesis.

## Initiative lifecycle

A practical initiative lifecycle is:

```text
Proposed → Investigating → Shaped → Committed → Delivering → Decision
                                                             ↙      ↘
                                                        Released   Concluded
                                                             ↓      ↓
                                                        Outcome review
                                                             ↓
                                            Expand / Adapt / Hold / Stop / Close
```

- **Proposed** — an opportunity or problem is worth considering.
- **Investigating** — customer, market, operational, and technical evidence is being gathered.
- **Shaped** — the value hypothesis, scope, risks, proof, Change funnel, and investment range are clear enough to decide.
- **Committed** — the organization has allocated the initial resource envelope.
- **Delivering** — Changes are being executed and rolled up.
- **Decision** — evidence supports releasing, continuing, narrowing, replacing, deferring, or stopping the initiative.
- **Released** — the capability is available to its intended users or operators.
- **Concluded** — the initiative stopped without release through an explicit, evidence-backed decision.
- **Outcome review** — actual customer, business, operational, strategic, or decision outcomes are compared with the original thesis.

Not every Change needs a parent initiative. Routine maintenance and small independent improvements can stand alone. Use an initiative when the product decision, resource commitment, or value horizon deserves a durable record.

## Begin with a value hypothesis

Before committing significant resources, state:

- the problem or opportunity;
- who should benefit;
- the customer outcome expected;
- the business, operational, or strategic value expected;
- the evidence supporting the belief;
- the baseline;
- the indicators that would confirm or weaken it;
- the time horizon in which value should appear;
- confidence and major unknowns;
- what evidence would justify stopping or changing course before release.

Value may include:

- new revenue or expansion;
- retention;
- customer time saved;
- customer risk reduced;
- operating cost reduced;
- reliability, security, or compliance improvement;
- access to a market or strategic capability;
- reduced uncertainty;
- a reusable platform capability.

Do not force everything into immediate revenue. Do not hide behind vague value language either. Name what should change and how the team expects to recognize it.

## Forecast the complete investment and Change funnel

The initiative forecast should include the resource mix required to test the thesis and, when warranted, turn it into an observable outcome:

```text
customer discovery
+ product and design shaping
+ architecture and technical direction
+ agent execution
+ builder review and exception handling
+ execution infrastructure
+ rollout and operational support
+ continuing ownership
```

It should also account for the fact that not every planned Change will land:

```text
Changes proposed
→ Changes shaped
→ Changes entering execution
→ Changes resolved
   ↘ delivered and landed
   ↘ work-derived decision without landing
   ↘ administrative closure
   ↘ unresolved loss
```

Use ranges, confidence, and assumptions. A useful forecast may include:

- expected number and classes of proposed Changes;
- expected execution starts;
- expected landed Changes;
- expected productive non-landed Changes;
- expected administrative closures;
- expected unresolved-loss range;
- builder hours by capability;
- agent, tool, and environment spend by resolution class;
- elapsed time;
- expected review and recovery load;
- likely operating and maintenance cost;
- current capacity constraints;
- meaningful alternatives or staged investment options.

The forecast should evolve after discovery, shaping, and early delivery. Preserve each version so the team can learn which stage reduced uncertainty, which assumptions were wrong, and whether it forecast the resolution mix honestly.

## Roll actual delivery and decisions into the initiative

Every linked Change contributes:

- resolution status, class, disposition, landing status, and release status;
- model, tool, and environment use;
- builder attention by activity;
- elapsed time;
- retries, rework, and recovery;
- gate and evidence results;
- uncertainty reduced and decisions changed;
- estimate variance;
- new risks or assumptions.

The initiative record should summarize rather than duplicate the run data. The underlying Change Records remain the evidence.

At an initiative checkpoint, compare:

```text
forecast investment
versus
actual investment to date

forecast Change funnel
versus
actual landed, decision-resolved, administratively closed, and unresolved Changes

forecast capability and decision evidence
versus
actual delivered capability and uncertainty reduced

forecast constraints
versus
constraints that actually limited progress
```

A material variance should produce an explanation and a decision, not merely a red number.

## Treat productive non-landing as initiative evidence

An initiative may correctly conclude without release because:

- customer evidence weakens the value hypothesis;
- a prototype shows the workflow is not useful;
- technical investigation exposes an unacceptable constraint;
- economics no longer justify the expected value;
- a better non-build alternative appears;
- a resource gate shows that further investment is not warranted;
- another initiative supersedes it.

Record the evidence, uncertainty reduced, actual spend, and decision. Do not claim that every stop created value. Distinguish evidence-backed conclusion from unresolved loss.

A counterfactual such as “this experiment avoided $500,000 of future spend” can be informative, but it is an estimate. Preserve the assumptions and confidence rather than booking hypothetical savings as realized value.

## Revisit outcomes after release or conclusion

Choose review points that match the value and decision horizon: perhaps 30, 90, 180, and 365 days, or initiative-specific milestones.

For released initiatives, record:

- adoption or usage;
- customer outcome against baseline;
- business or operational result;
- continuing human, agent, and infrastructure cost;
- unintended consequences;
- confidence in attribution;
- whether the thesis should be expanded, adapted, held, stopped, or retired.

For initiatives concluded without release, record:

- whether later evidence supports the stop or redirection;
- whether the avoided or deferred commitment was actually avoided;
- whether the same uncertainty was rediscovered elsewhere;
- whether reusable artifacts or platform learning paid off;
- whether the conclusion should be revisited.

Separate evidence types:

- **directly attributable** — the initiative has a credible causal link to the result;
- **influenced** — the initiative contributed alongside other factors;
- **proxy** — an early indicator used because the ultimate value has not appeared yet;
- **counterfactual estimate** — a reasoned estimate of avoided cost or risk, with explicit uncertainty.

Product value and decision value are often noisy and delayed. Preserve uncertainty rather than manufacturing clean attribution.

## Learn from three variances

There are three distinct questions:

```text
Delivery variance
  What did the initiative consume compared with the forecast?

Resolution variance
  How did its Changes and the initiative itself resolve compared with the expected funnel?

Value variance
  What did the initiative produce compared with the hypothesis?
```

For released initiatives, the familiar delivery/value matrix remains useful:

| Delivery | Value | Interpretation |
| --- | --- | --- |
| Less expensive than expected | More valuable than expected | Expand, reuse, and study what worked |
| More expensive than expected | More valuable than expected | Product thesis may be strong; improve the delivery model |
| Less expensive than expected | Less valuable than expected | Efficient execution of an insufficient idea |
| More expensive than expected | Less valuable than expected | Reconsider the thesis, approach, or continuation |

For initiatives concluded without release, ask whether the evidence was strong enough, the decision arrived early enough, and the learning changed future investment. This prevents a team from confusing “nothing shipped” with “nothing was accomplished”—or from calling every abandoned effort a valuable experiment.

## Include continuing cost

The cost of an initiative does not stop at launch.

Track, where material:

- ongoing model and agent maintenance;
- cloud and data infrastructure;
- human operational ownership;
- support and customer-success load;
- compliance and security obligations;
- incident risk;
- future migration or retirement cost.

A feature that creates meaningful revenue while consuming nearly as much ongoing support and infrastructure is a different investment from one that produces the same revenue with a light operational footprint.

The full lifecycle may include:

```text
cost to discover
cost to decide
cost to create
cost to launch
cost to operate
cost to maintain and evolve
cost to retire
```

## Improve product judgment, not only estimation

Over time, initiative records can help answer:

- Which customer signals predict adoption?
- Which experiments predict a useful stop or pivot?
- Which kinds of initiatives create the most durable value?
- Where are value forecasts systematically optimistic or timid?
- Where are landing rates lower than forecast, and why?
- Which discovery activities reduce expensive product rework?
- Which platform investments make later Changes cheaper?
- Which initiatives create hidden support or operating cost?
- Which constraints repeatedly prevent useful agent spend from being absorbed?
- Which non-landed efforts produced durable learning, and which merely disappeared?

Historical delivery and resolution evidence improves cost and funnel forecasts.

Historical product outcomes improve value forecasts.

Together they improve investment decisions.

## Rule

Treat an initiative as an investment hypothesis, not a collection of tickets.

State the value expected, forecast the complete resource envelope and Change funnel, roll up actual delivery, non-landed decisions, administrative closures, and unresolved loss, revisit outcomes after release or conclusion, and use all three forms of variance to improve what the organization chooses and how it delivers.
