# Resource Observability and Delivery Economics

Agent delivery turns product delivery into a more observable production system.

That does not mean every judgment can be reduced to dollars or every builder should be treated like a row in a utilization report. It means the system can preserve enough evidence about what work consumed, what it produced, how it resolved, and where it became constrained to make better decisions next time.

The complete system converts several inputs into outcomes:

```text
human judgment
+ machine intelligence
+ execution infrastructure
+ elapsed time and capital
→ delivered capability, evidence-backed decisions, and learning
```

A mature team does not minimize any one input in isolation. It improves the cost, speed, quality, and reliability with which the whole system produces worthwhile, trustworthy resolutions.

## The Change is an economic unit

The Change is where resource use and delivery outcome meet.

A run can tell you which model was called and how much it cost. A Change can tell you whether those runs, environments, retries, and builder interventions produced delivered capability, a useful decision not to land, or unresolved loss.

The useful hierarchy is:

```text
Portfolio
  Initiative
    Change
      Run
        Model request, tool call, and environment event
```

Each level answers a different question:

- **Run:** What happened during this attempt?
- **Change:** What did it take to reach this resolution, and did the work land?
- **Initiative:** What did it take to test or create this product capability, and what value or decision did it produce?
- **Portfolio:** Where should the next human hour, agent dollar, infrastructure dollar, and unit of management attention go?

Do not begin by building the portfolio layer. Begin by making runs attributable to Changes and Changes explicit about their resolution.

## Observe the complete resource mix

The minimum useful record includes more than tokens.

### Machine resources

- provider and model;
- requested and served model when routing or fallback occurs;
- input, cached, output, and other billable usage;
- tools, search, storage, and provider-specific charges;
- execution-environment, browser, database, and CI cost;
- retries, failed attempts, and fallback chains;
- elapsed time and run outcome.

### Human resources

Record the kind of builder attention involved, not only a single total:

- customer discovery;
- product shaping;
- design judgment;
- architecture and technical direction;
- agent direction;
- evidence review;
- specialist review;
- exception handling and recovery;
- release and operational ownership.

Keep raw time or effort separate from any monetary conversion. Hourly cost assumptions change, and some teams will reasonably choose not to monetize human time at all.

Measure this to understand the system, not to create simplistic individual rankings. Human contribution is contextual, collaborative, and often most valuable when it prevents work that should not happen. Prefer capability mix, team-level patterns, and consent-aware data over surveillance disguised as precision.

### Resolution and outcome data

Resource use only becomes meaningful when paired with:

- resolution status: resolved or unresolved;
- resolution class: delivered, decision, administrative, or unresolved loss;
- specific disposition;
- landed: true, false, or not applicable;
- released: true, false, or not applicable;
- resolution quality and learning value;
- gate results and first-pass success;
- rework, rollback, or later defect;
- uncertainty reduced and decision changed;
- reusable artifacts and follow-up work;
- link to the parent initiative when one exists.

A non-landed Change should not disappear. It should become a work-derived decision resolution, an accountable administrative closure, or a visible unresolved loss.

## Start small and mature deliberately

Resource observability is a foundational principle. Full financial control is not a prerequisite for the first experiment.

A useful maturity path is:

### 1. Attribute

Associate provider usage, environment usage, attempts, builder attention, and final resolution with a Change.

This is enough to replace a provider dashboard with two delivery questions:

> What did this work consume?

> What did it resolve?

### 2. Estimate

Add an expected amount, a likely range, confidence, assumptions, and—when material—the expected resolution mix.

```text
Expected agent and environment spend: $35
Likely range: $20–$55
Expected builder attention: 45–90 minutes
Resolution intent: deliver, with evidence-backed stop allowed
Estimated landing probability: 70–85%
Confidence: low
Based on: four comparable Changes
```

Ranges matter. A point estimate without uncertainty is usually a wish wearing a necktie.

### 3. Govern

Use resource thresholds as decision gates.

A resource gate may apply to:

- model and tool spend;
- environment or CI spend;
- elapsed time;
- reviewer capacity;
- use of a scarce test environment;
- total builder attention.

The progression should normally be:

```text
approaching threshold
  → forecast and warn

soft threshold reached
  → checkpoint, explain variance, and replan

hard threshold reached
  → preserve state and require a builder decision
```

A hard threshold may produce approval to continue, narrower scope, a different route, a prerequisite Change, or an evidence-backed stop. A hard stop that destroys context is not governance. It is an expensive way to forget what the system learned.

### 4. Learn and route

Compare similar work by Change type, resolution intent, repository area, agent, model, gate profile, environment, workflow version, and final resolution class.

Use the result to improve:

- task decomposition;
- model selection;
- escalation rules;
- skills and context;
- gate strength;
- environment choice;
- estimates, landing probabilities, and budgets.

A model that costs more per request may cost less per landed Change. A cheaper exploratory route may still be best when its purpose is to reach a decision quickly. The correct comparison depends on the intended resolution.

### 5. Plan capacity and investment

Roll Changes into initiatives. Forecast the human, agent, infrastructure, elapsed-time, and resolution funnel required. Identify the binding constraint before adding budget.

This is the advanced mode. It becomes credible only after the earlier records are consistent enough to support it.

## Forecasts should evolve with knowledge

One frozen estimate throws away useful information. Preserve the forecast at several points:

```text
Opportunity estimate
  Rough order of magnitude before discovery.

Post-discovery estimate
  Updated after customer and domain learning.

Post-shaping estimate
  Updated after scope, architecture, proof, Change decomposition,
  and expected resolution mix are clearer.

In-flight forecast
  Updated from actual progress, spend, and discovered complexity.

Final actual
  Complete resource and resolution record.
```

This teaches the system three things:

1. how accurate cost and capacity estimates can be at each stage;
2. which activities meaningfully reduce uncertainty;
3. how often different Change classes land, resolve through a decision, close administratively, or become unresolved loss.

Discovery and shaping may consume resources while still lowering the total expected cost of the initiative. A productive non-landed Change may also prevent a much larger commitment. The data should make that visible without pretending counterfactual value is certain.

## Use a metric set, not one misleading headline

The useful cost equation is:

```text
model and tool cost
+ execution-environment cost
+ all attempt cost
+ builder-attention cost, when monetized
= total recorded delivery cost
```

Pair it with resolution and quality:

```text
resolution class and disposition
landed or not landed
released or not released
resolution quality and learning value
cycle time
first-pass gate success
rework and rollback
builder attention
uncertainty reduced
customer or business value, at the initiative level
```

No single denominator is sufficient.

### For delivery work

```text
cost per trustworthy landed Change
= cost of delivered Changes, including their failed attempts
  ÷ landed Changes
```

### For exploratory or decision work

```text
cost per evidence-backed decision
= cost of decision-resolved Changes
  ÷ evidence-backed decision resolutions
```

Do not blend these cohorts. A cheap rejection is not interchangeable with shipped capability, and a prototype that invalidates a thesis should not be counted as failed delivery.

### Funnel health

```text
resolution yield
= evidence-backed resolved Changes
  ÷ Changes that entered execution

landing yield
= landed Changes
  ÷ Changes that entered execution

decision yield
= evidence-backed, decision-resolved, non-landed Changes
  ÷ Changes that entered execution

administrative closure rate
= administratively resolved Changes
  ÷ Changes that entered execution

unresolved-loss rate
= Changes ending without sufficient resolution
  ÷ Changes that entered execution
```

Report spend by the same classes:

```text
delivered spend
decision and uncertainty-reduction spend
administrative closure spend
unresolved-loss spend
```

A team can then distinguish “we spent $18,000 disproving three costly hypotheses early” from “we spent $18,000 on work that vanished without a decision.”

Do not optimize resolution yield in isolation. A system could game it by rejecting useful work quickly. Pair funnel metrics with evidence quality, delivered value, decision quality, rework, and later outcomes.

“Recorded” matters. A system may miss subscription usage, local compute, work performed outside the workflow, or unmeasured human effort. Report completeness and assumptions rather than pretending the ledger sees everything.

## Agent budget is not independently scalable

Additional model spend only creates useful throughput when the surrounding system can absorb it.

A team may have money for another $10,000 of agent execution and still be constrained by:

- insufficient customer discovery;
- too little product shaping;
- senior review capacity;
- weak automated gates;
- execution-environment capacity;
- release and operational support;
- a shortage of worthwhile, ready work;
- an unplanned volume of exploration or unresolved work.

A simple capacity view makes the constraint visible:

| Resource | Available | Required by plan | Constraint? |
| --- | ---: | ---: | --- |
| Customer discovery | 90 h | 150 h | yes |
| Change shaping | 120 h | 110 h | no |
| Agent execution | $25,000 | $18,000 | no |
| Builder review | 140 h | 210 h | yes |
| Execution compute | 4,000 h | 3,100 h | no |
| Release support | 80 h | 60 h | no |

The question is not merely, “Can we spend more on agents?”

It is:

> Can the complete delivery system convert that spend into trustworthy delivered capability and useful decisions?

The next dollar may belong in models. It may belong in another product-oriented builder, stronger review capacity, a better test environment, or a gate that allows existing reviewers to supervise more work safely.

## The system can learn to estimate

Every resolved or unresolved Change should improve the next forecast.

Useful estimator features may include:

- Change type, resolution intent, and risk;
- repository, subsystem, and architectural boundaries;
- expected test and evidence surface;
- amount of unfamiliar code or domain context;
- quality of the Change Intent and decision question;
- agent, model, skill, and gate profile;
- environment class;
- comparable historical Changes;
- historical landing, decision, administrative-closure, and unresolved-loss rates;
- expected human capability mix;
- current queue and reviewer constraints.

The estimator should produce ranges, confidence, and a resolution distribution rather than theatrical precision.

```text
Expected execution starts: 14–17
Expected landed Changes: 9–12
Expected decision-resolved, non-landed Changes: 2–4
Expected administrative closures: 0–1
Expected unresolved loss: 0–2
Expected total spend: $11,000–$17,000
```

Preserve the model, pricing, workflow, and repository version used to make the forecast because the system itself changes over time.

Evaluate the estimator with measures such as:

- absolute and percentage cost error;
- coverage of the forecast range;
- calibration of landing and disposition probabilities;
- systematic underestimation by Change class;
- unresolved-loss prediction error;
- accuracy before and after discovery or shaping.

Do not let a learned estimator quietly turn old organizational habits into permanent truth. Review its features, drift, and errors. New models, stronger gates, better architecture, and more experienced builders should change what similar work costs and how it resolves.

## Rule

Make resource use observable at the level where a decision can be improved.

Begin with attribution and explicit resolution. Add estimates, gates, routing, funnel forecasting, and capacity planning only when the underlying records have earned that sophistication.
