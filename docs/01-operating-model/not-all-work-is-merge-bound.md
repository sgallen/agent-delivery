# Not All Work Is Merge-Bound

Agents make it cheaper to turn uncertainty into something concrete.

A team no longer has to choose only between abstract debate and a multi-week human spike. It can ask an agent to build two approaches, reproduce a suspected failure, test an integration, or create a working prototype—and then judge the result with evidence.

The code may merge. It may be rebuilt. It may be thrown away.

That is not automatically waste. Working software can be a decision artifact.

## Define the decision before the work

Exploratory work is easier to judge when the Change Intent states:

```text
decision question   What do we need to know or decide?
evidence bar        What would distinguish the options?
resource envelope   How much are we willing to spend?
stop conditions     What should end the work early?
resolution criteria What is enough to conclude without merging?
```

This prevents a failed delivery attempt from being relabeled as successful learning after the fact.

A useful non-landed outcome should leave behind the evidence, the uncertainty reduced, the decision made, reusable findings, and the next action.

A branch that disappeared because nobody decided what to do with it is different.

## Resolve does not mean merge

The important distinction is not simply **merged versus not merged**. It is whether the work improved the product, improved the decision, closed responsibly for an external reason, or consumed resources without reaching a defensible conclusion.

[Changes](changes.md) defines the formal resolution classes for teams that need them. Most daily work only needs the plain-language distinction.

## Preserve the real path

Do not make the winning option look cheap by hiding the prototypes, retries, review effort, or discarded approaches that led to it.

A small experiment that prevents a much larger mistake may be excellent work. Treat the avoided investment as an uncertain counterfactual, not booked value.

## A simple pattern

1. Write the decision question, evidence bar, resource envelope, and stop conditions.
2. Create one or more bounded Changes.
3. Ask agents to produce working behavior and evidence, not code volume.
4. Compare the outcomes.
5. Land the best path, combine ideas, narrow the initiative, or discard them all.
6. Record the decision, what the work consumed when useful, and what happens next.

Do not build a large exploration framework until this pattern stops working.

## The risk

Cheap exploration is useful only when the system can compare, curate, and stop it.

Otherwise the team creates five half-finished branches, consumes the full budget, learns nothing durable, and calls it innovation.

Please do not call that innovation.

## Principle

> A Change is complete when it produces an explicit, adequately evidenced outcome—not only when code lands.
