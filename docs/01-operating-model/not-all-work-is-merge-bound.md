# Not All Work Is Merge-Bound

Agents make it cheaper to turn uncertainty into something concrete.

A team no longer has to choose only between abstract debate and a multi-week human spike. It can ask an agent to build two approaches, reproduce a suspected failure, test an integration, or create a working prototype—and then judge the result with evidence.

The code may merge. It may be rebuilt. It may be thrown away.

That is not automatically waste. Working software can be a decision artifact.

## Resolved does not mean merged

A Change may end as delivered work, a useful work-derived decision, an accountable administrative closure, or unresolved loss. [Changes](changes.md) defines those classes in detail.

The important distinction is not simply **merged versus not merged**. It is whether the work improved the product, improved the decision, closed responsibly for an external reason, or vanished without enough evidence and judgment.

A prototype that disproves an assumption can be valuable. A dead branch with a retrospective paragraph is not automatically an experiment.

## Define the decision before execution

Exploratory work is easier to judge when the Change Intent states:

```text
decision question   What do we need to know or decide?
resource envelope   How much are we willing to spend?
evaluation criteria What evidence will distinguish the options?
stop conditions     What should end the work early?
resolution criteria What is enough to conclude without merging?
```

This prevents a failed delivery attempt from being relabeled as successful learning after the fact.

A useful non-landed outcome should leave behind the evidence, uncertainty reduced, decision made, reusable findings, and next action. An administrative closure should name the external reason and accountable owner. Unresolved loss should remain visible with the consumed resources and the system improvement needed to prevent a repeat.

## Preserve the full cost

Do not make the winning path look cheap by hiding the branches, retries, prototypes, and review effort that led to it.

Keep delivered spend, decision spend, administrative spend, and unresolved loss visible. They answer different questions and should not be blended into one flattering average.

A $200 prototype that prevents a $100,000 mistake may be excellent work. Treat the avoided investment as an uncertain counterfactual, not booked value.

## A simple pattern

1. Write the decision question, evidence bar, resource envelope, and stop conditions.
2. Create one or more bounded Changes.
3. Ask agents to produce working behavior and evidence, not code volume.
4. Compare the outcomes.
5. Land the best path, combine ideas, narrow the initiative, or discard them all.
6. Record the decision, actual resource use, and what happens next.

Do not build a large exploration framework until this pattern stops working.

## The risk

Cheap exploration is useful only when the system can compare, curate, and stop it.

Otherwise the team creates five half-finished branches, consumes the full budget, learns nothing durable, and calls it innovation.

Please do not call that innovation.

## Principle

> A Change is complete when it produces an explicit, adequately evidenced disposition—not only when code lands.
