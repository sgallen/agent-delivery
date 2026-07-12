# Not All Work Is Merge-Bound

Agents make exploration cheaper.

In the old model, uncertain work often required meetings, whiteboarding, debate, estimation, or a time-boxed spike. Those practices still have value, but they should no longer be the only way to reduce uncertainty.

When implementation is cheap and fast, working software can become a decision artifact.

Instead of spending a week arguing about two plausible approaches, a team can ask agents to make both concrete, compare the behavior, and decide with evidence. A pull request can be a proposal. A prototype can answer the question. The code can then be merged, rebuilt, narrowed, or thrown away.

The [Gusto Cofounder example](https://youtu.be/5FKBkUCaLa8) makes this vivid: the team treated building and discarding a full implementation as part of product decision-making rather than as wasted engineering effort.

Not every agent-produced branch needs to merge. Some Changes exist to create clarity.

A prototype may be discarded. An implementation path may lose. A design may be rejected. A test may reveal the real problem. A resource gate may show that the remaining investment is not justified. A throwaway branch may teach the team what to build next.

This is not automatically waste.

It is an investment in reducing uncertainty—when the evidence changes a decision and the learning survives the branch.

## Resolved does not mean merged

A Change can reach one of four broad resolution classes:

| Resolution class | Meaning |
| --- | --- |
| `delivered` | The intended outcome was accepted and landed or released according to policy |
| `decision` | Work-derived evidence supported a useful stop, narrow, replace, defer, reject, or alternative decision |
| `administrative` | An accountable owner explicitly closed the Change for an external priority, ownership, policy, or funding reason without claiming material work-derived learning |
| `unresolved_loss` | Work entered execution and ended without enough evidence, preserved context, or explicit judgment to support delivery, decision, or accountable closure |

Delivered work and decision-resolved work can both be valuable outcomes. Administrative closure is useful control, but it is not automatically product learning. Unresolved loss is a failure of the operating system even when individual runs contained interesting observations.

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

Keep `landed` and `released` as separate fields. A disposition explains the conclusion. Landing says whether the artifact entered the maintained product or operating system. Release says whether the capability reached its intended users or operators.

Repositories may adapt the vocabulary, but they should preserve the four analytical classes. The same disposition can occasionally require context. For example, `deprioritized` may be a decision resolution when work-derived evidence changed the priority, or an administrative closure when funding moved for unrelated reasons.

## Define useful non-landing before execution

Exploratory work is easier to judge when the Change Intent states:

```text
decision question
  What do we need to know or decide?

bounded envelope
  How much resource or time are we willing to spend?

evaluation criteria
  What evidence will distinguish the options?

stop conditions
  What should end the work early?

resolution criteria
  What record is sufficient to conclude without merging?
```

This prevents a failed delivery attempt from being relabeled as a successful experiment after the fact.

A productive non-landed resolution should identify:

- the uncertainty reduced;
- the evidence produced;
- the assumption or forecast changed;
- the decision made;
- reusable artifacts or findings;
- follow-up work or an explicit decision not to create it.

An administrative closure should identify the accountable owner, external reason, effective date, and any resumption condition. It should not claim uncertainty reduction that the work did not produce.

An unresolved loss should remain visible with the cost incurred, context preserved, reason resolution failed, and the operating-system improvement intended to prevent recurrence.

## Preserve the full economics

Do not hide the agent, environment, or builder resources used by a discarded branch. Roll them into the Change and parent initiative rather than making the winning implementation look cheaper than the decision actually was.

Report spend by resolution class:

```text
delivered work
work-derived decisions
administrative closures
unresolved loss
```

Do not blend them into one average. Cost per landed Change and cost per evidence-backed decision answer different questions. Administrative and unresolved spend should remain visible rather than being quietly reallocated to successful work.

The useful question is not only:

> Which branch merged?

It is also:

> What uncertainty did this work remove, what decision changed, and was that learning worth the resources consumed?

A $200 prototype that prevents a $100,000 mistaken commitment may be one of the highest-value Changes in the portfolio. Treat the avoided investment as a counterfactual estimate, not automatically as booked value.

## A simple exploration pattern

1. Write the decision question and the uncertainty that matters.
2. Link the parent initiative and value hypothesis when one exists.
3. Define the evaluation criteria, resource envelope, and stop conditions.
4. Create one or more bounded Change Intents or branches.
5. Ask agents to produce working behavior, evidence, and honest resource records.
6. Compare outcomes, not generated-code volume or raw token use.
7. Land the best path, combine useful ideas, narrow the initiative, or discard all of them.
8. Record the resolution class, disposition, landing and release status, resolution quality, learning value, evidence, uncertainty reduced, decision, and reusable artifacts.
9. Roll delivered, decision, administrative, and unresolved spend into the initiative separately.

Do not invent a large exploration framework before this simple pattern stops working.

## The risk

Cheap exploration is powerful only if the system can summarize, gate, compare, curate, and stop the results.

Otherwise the organization creates five half-baked branches, spends the full envelope, learns nothing durable, and calls it innovation.

Please do not call that innovation.

## Principle

> A Change is complete when it produces an explicit, adequately recorded disposition—not only when code lands. Preserve the economics and learning of productive non-landing, distinguish administrative closure from product learning, and keep unresolved loss visible.
