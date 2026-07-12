# Playbook: Resolve a Change That Does Not Land

Not every Change should end in a merge.

An experiment may weaken the product thesis. A technical investigation may expose a hard constraint. A resource checkpoint may show that the remaining investment is not justified. Another path may simply be better.

The goal is not to drag the branch across the finish line. It is to reach the most honest conclusion the evidence supports, preserve what the work consumed, and make the next decision better.

Use this playbook after execution has begun and landing is no longer the likely or sensible outcome.

## Outcome

The Change ends with:

- an explicit resolution and specific disposition;
- a separate record of whether anything landed or released;
- evidence that supports the decision—or an honest statement that it does not;
- material work, attempts, and context preserved;
- resource records preserved when the project measures them;
- a clear next action;
- the parent initiative updated when one exists.

## 1. Restate the decision

Write the decision the work now needs to support.

Examples:

```text
Should this workflow proceed to full delivery?
Can this provider meet the latency and privacy constraints?
Is the remaining scope worth another $4,000 and 30 review hours?
Which implementation path should continue?
Did an external portfolio decision remove the reason to proceed?
```

If nobody can state the decision or the accountable closure reason, the Change is probably not ready to end.

## 2. Preserve state before stopping

Update the workpad and save the branch, patch, prototype, logs, evidence, and run records that matter. Record what remains unknown and whether the work can be resumed. When a forecast or resource record exists, bring it current rather than leaving a flattering partial history.

If a hard resource threshold fired, stop further consumption—but do not destroy the context needed to decide what the spend taught you.

## 3. Choose the honest outcome class

Use [Changes](../01-operating-model/changes.md) for the full model. For a non-landed Change, the likely classes are:

- **Decision:** the work produced evidence for a useful stop, narrow, replace, defer, or alternative path.
- **Administrative:** an external priority, owner, policy, or funding decision closed the work without claiming product learning.
- **Unresolved loss:** execution ended without enough evidence, preserved context, ownership, or judgment to conclude well.

Then add the specific disposition: `experiment_concluded`, `hypothesis_rejected`, `technically_infeasible`, `stopped_at_resource_gate`, `superseded`, `deprioritized`, `rejected_at_review`, `cancelled_external`, or `abandoned_without_resolution`.

The words matter because future planning will treat these outcomes differently.

## 4. Match the evidence to the claim

For a decision resolution, show why the evidence supports the conclusion:

- customer research or prototype evaluation for a product thesis;
- a reproducible constraint or benchmark for technical infeasibility;
- actual-to-date, completion range, remaining scope, and expected value for a resource stop;
- a bounded comparison for supersession;
- explicit unmet criteria for a final review rejection.

For an administrative closure, record the accountable owner, external reason, effective date, effect on linked work, and any resumption condition. Do not claim uncertainty reduction the work did not produce.

For unresolved loss, record why resolution failed, what was consumed, what state remains, whether recovery is possible, and what ownership or workflow change should prevent a repeat.

Closing the issue does not improve the class of the outcome.

## 5. Test whether the non-landing was actually productive

A useful decision-class outcome should have at least one material effect:

- important uncertainty was reduced;
- a costly mistaken investment was credibly avoided or redirected;
- a better path was selected;
- a product, architecture, or operating assumption changed;
- reusable evidence or artifacts were preserved;
- a future Change can now be shaped more accurately;
- a system failure was diagnosed well enough to change the workflow.

Record the uncertainty reduced, the decision changed, and the next action.

A retrospective paragraph is not enough. Effort spent is not proof of learning.

## 6. Close the operational record

Preserve every material path: failed, discarded, recovery, and superseded attempts as well as the final one. Another builder should be able to see what was tried and why the decision changed.

When delivery economics is enabled, include model and tool cost, environments and CI, builder attention, elapsed time, forecast versus actual, and data-quality gaps. Non-landed work still belongs to the Change and its parent initiative; it does not disappear because no product code merged.

## 7. Update the initiative and learning checkpoint

When a parent initiative exists, update its Change funnel, actual investment, remaining forecast, and value thesis. Several non-landed Changes may be a signal that the initiative itself needs a decision.

Then ask what should change in product discovery, shaping, architecture, context, routing, skills, gates, thresholds, ownership, or stop conditions.

Create the smallest durable improvement. For an administrative closure, “no work-derived system change” may be the honest answer. For unresolved loss, an ownership or recovery improvement is usually required.

## Reviewer test

A reviewer should be able to answer:

```text
What decision or closure occurred?
What evidence or accountable basis supports it?
What did the work consume?
What remains uncertain?
Did anything land or release?
What happens next?
```

If those answers are missing, do not call the Change productively resolved.

## Definition of done

- [ ] the outcome class, disposition, and reason are explicit;
- [ ] landed and released status are recorded separately;
- [ ] the evidence or administrative basis supports the conclusion;
- [ ] uncertainty and confidence are stated honestly;
- [ ] all material attempts remain attached, with resource use when measured;
- [ ] useful decision, administrative closure, and unresolved loss are not conflated;
- [ ] the parent initiative is updated when relevant;
- [ ] the next action and learning checkpoint are complete.
