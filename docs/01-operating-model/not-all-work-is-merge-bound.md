# Not All Work Is Merge-Bound

Agents make exploration cheaper.

In the old model, uncertain work often required meetings, whiteboarding, debate, estimation, or a time-boxed spike. Those practices still have value, but they should no longer be the only way to reduce uncertainty.

When implementation is cheap and fast, working software can become a decision artifact.

Instead of spending a week arguing about two plausible approaches, a team can ask agents to make both concrete, compare the behavior, and decide with evidence. A pull request can be a proposal. A prototype can answer the question. The code can then be merged, rebuilt, or thrown away.

The [Gusto Cofounder example](https://youtu.be/5FKBkUCaLa8) makes this vivid: the team treated building and discarding a full implementation as part of product decision-making rather than as wasted engineering effort.

Not every agent-produced branch needs to merge. Some Changes exist to create clarity.

A prototype may be discarded. An implementation path may lose. A design may be rejected. A test may reveal the real problem. A throwaway branch may teach the team what to build next.

This is not waste.

It is cheaper learning.

## Principle

> When the debate is speculative and the cost of exploration is low, build the options and compare the evidence.

## A simple exploration pattern

1. Write one outcome and the decision the team needs to make.
2. Create two or more bounded Change Intents or branches.
3. Give each attempt the same constraints and evaluation criteria.
4. Ask agents to produce working behavior and evidence.
5. Compare outcomes, not generated-code volume.
6. Keep the best path, combine useful ideas, or discard all of them.
7. Record what the experiment taught the product and the system.

Do not invent a large exploration framework before this simple pattern stops working.

## The risk

Cheap exploration is powerful only if the system can summarize, gate, compare, and curate the results.

Otherwise the organization creates five half-baked branches and calls it innovation.

Please do not call that innovation.
