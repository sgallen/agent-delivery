# Resolve a Change That Does Not Land

Not every Change should end in a merge.

An experiment may invalidate the hypothesis. A technical investigation may expose a hard constraint. A resource checkpoint may show that the remaining investment is not justified. Another path may supersede the work. A portfolio decision may remove the need altogether.

The goal is not to force the branch across the finish line. It is to reach the most honest resolution the evidence supports, preserve the full economics, and make the next decision better.

Use this playbook when a Change entered execution but the likely correct outcome is now something other than landing the proposed implementation.

## Outcome

At the end:

- resolution status, class, and specific disposition are explicit;
- `landed` and `released` are recorded separately;
- a decision-class resolution is supported by reviewable work-derived evidence;
- an administrative closure is not mislabeled as product learning;
- unresolved loss is recorded honestly when the evidence or accountability is insufficient;
- all material run, environment, and builder resources remain attached to the Change;
- uncertainty reduced, decisions changed, and reusable artifacts are named where they exist;
- the parent initiative reflects the actual outcome and forecast impact;
- the learning checkpoint improves the system or explicitly records that no durable change is warranted.

## Inputs

You need:

- the Change Intent;
- the current workpad;
- the parent initiative, when one exists;
- run and resource records;
- gate results and evidence;
- the accountable builder or owner for the final decision.

## Procedure

### 1. Restate the decision now required

Write the decision the work must support.

Examples:

```text
Should this workflow be built for the next release?
Can this provider meet the latency and privacy constraints?
Is the remaining scope worth another $4,000 of agent and review capacity?
Which implementation path should continue?
Has an external portfolio decision removed the reason to continue?
```

If no decision question or accountable closure reason can be stated, the Change may not be ready to conclude.

### 2. Preserve current state before stopping

Before ending execution:

- update the workpad;
- preserve the branch, patch, prototype, logs, and evidence that matter;
- finalize current run records and mark each run’s status and contribution;
- record actual-to-date and the latest completion or decision forecast;
- identify what remains unknown;
- make the work resumable when practical;
- stop additional consumption if a hard resource gate was reached.

A resource gate that deletes context creates a second failure on top of the first.

### 3. Select the resolution class before the disposition

Choose the broad class first:

| Resolution class | Use when |
| --- | --- |
| `decision` | Work-derived evidence supports a useful non-landed decision |
| `administrative` | An external priority, ownership, policy, or funding decision closes the work without claiming material work-derived learning |
| `unresolved_loss` | Execution ended without enough evidence, preserved context, ownership, or judgment to support an adequate conclusion |

`delivered` is not normally the path for this playbook, although a supporting artifact may still have landed.

Then choose the most specific disposition the evidence supports:

```text
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

Typical mappings are:

| Disposition | Usual class |
| --- | --- |
| `experiment_concluded` | `decision` |
| `hypothesis_rejected` | `decision` |
| `technically_infeasible` | `decision` |
| `stopped_at_resource_gate` | `decision` when the stop is evidence-backed; otherwise possibly `unresolved_loss` |
| `superseded` | `decision` when comparison evidence chose a better path; `administrative` when an external decision replaced it |
| `deprioritized` | `decision` when work-derived evidence changed priority; otherwise `administrative` |
| `rejected_at_review` | `decision` when the review evidence supports a final stop or redesign; otherwise the Change may remain open or unresolved |
| `cancelled_external` | `administrative` |
| `abandoned_without_resolution` | `unresolved_loss` |

The disposition describes how the Change ended. The resolution class explains what kind of outcome that ending represents.

### 4. Prove the conclusion appropriate to its class

#### Decision resolution

Match the evidence to the claim:

- Product hypothesis: customer research, experiment results, adoption signal, or prototype evaluation.
- Technical infeasibility: reproducible constraint, benchmark, integration result, or architecture analysis.
- Resource stop: actual-to-date, updated completion forecast, threshold history, remaining scope, and expected-value comparison.
- Supersession: bounded comparison and a link to the replacing path.
- Review rejection: explicit unmet criteria, gate findings, or accountable judgment.

A decision resolution does not require every implementation gate to pass. It requires the evidence and decision gates needed to support the conclusion.

#### Administrative resolution

Record:

- the accountable owner;
- the external reason;
- the effective date;
- the effect on linked work and committed resources;
- any condition under which the Change should be reconsidered.

Do not claim uncertainty reduction or product learning that the work did not create.

#### Unresolved loss

Record:

- why resolution failed;
- resources consumed;
- what state or evidence remains;
- whether the work can be recovered;
- the ownership, recovery, or workflow change intended to prevent recurrence.

Closing an issue does not convert unresolved loss into an administrative resolution.

### 5. Assess resolution quality

For `decision` and `administrative` resolutions, classify the basis as:

- **strong** — the evidence or accountable external basis directly supports the decision and material alternatives were considered;
- **sufficient** — the decision is reasonable and reviewable, but some uncertainty remains;
- **weak** — the conclusion rests mostly on assumption, incomplete evidence, or unavailable ownership;
- **not assessed** — use for unresolved loss or migrated records that cannot be reconstructed responsibly.

A weak resolution may still be the best available decision. It should not be presented as high-confidence learning.

### 6. Apply the productive non-landing test

Do not set a checkbox. Productive non-landing is derived when the final record is a decision-class resolution with adequate evidence and at least one material effect:

- a consequential uncertainty was reduced;
- a costly mistaken investment was credibly avoided or redirected;
- a better alternative was selected;
- a product, architecture, or operating assumption changed;
- reusable evidence or artifacts were created;
- a future Change or initiative can now be shaped more accurately;
- a system failure was diagnosed well enough to change the workflow.

Record the uncertainty reduced, decision changed, and next action.

A retrospective alone is not enough. Effort spent is not proof of learning. Interesting observations inside unresolved work do not automatically make the Change productively resolved.

### 7. Finalize the Change resource record

Include:

- all runs, including failed, discarded, recovery, and superseded paths;
- model, tool, environment, and validation cost;
- builder attention by capability;
- elapsed time;
- forecast versus actual;
- resources that materially supported the final resolution;
- supporting evidence cost;
- other attempts that did not contribute materially;
- data-quality gaps.

This resource use belongs to the Change and parent initiative. It should not disappear because no product code landed.

### 8. Record the final Change outcome

A decision-class example:

```yaml
outcome:
  resolution_status: resolved
  resolution_class: decision
  disposition: hypothesis_rejected
  landed: false
  released: false
  resolution_quality: strong
  reason_category: customer_evidence
  summary: >
    Customer testing showed that the proposed workflow did not address
    the highest-priority problem.
  criteria_result: non_landed_resolution_criteria_met
  decision:
    owner: product-builder
    decided_at: 2026-07-12T01:15:00Z
    basis: prototype and customer-test evidence
  evidence:
    - research-summary.md
    - prototype-evaluation.md
  learning:
    value: high
    uncertainty_reduced:
      - customer workflow fit
    decisions_changed:
      - pursue the alternative workflow before implementation
    reusable_artifacts:
      - prototype
      - interview synthesis
  follow_up:
    decision: pursue_alternative
    changes:
      - CHANGE-184
```

An administrative example:

```yaml
outcome:
  resolution_status: resolved
  resolution_class: administrative
  disposition: cancelled_external
  landed: false
  released: false
  resolution_quality: sufficient
  reason_category: portfolio_reallocation
  summary: Funding moved to a regulatory commitment before the experiment completed.
  decision:
    owner: portfolio-owner
    decided_at: 2026-07-12T01:15:00Z
    basis: approved portfolio decision
  evidence:
    - portfolio-decision-2026-q3.md
  learning:
    value: none
    uncertainty_reduced: []
    decisions_changed: []
    reusable_artifacts: []
  follow_up:
    decision: reconsider_if_funding_returns
    changes: []
```

An unresolved-loss example:

```yaml
outcome:
  resolution_status: unresolved
  resolution_class: unresolved_loss
  disposition: abandoned_without_resolution
  landed: false
  released: false
  resolution_quality: not_assessed
  reason_category: ownership_lost
  summary: Work stopped after ownership changed; evidence is insufficient to decide whether to continue.
  evidence:
    - partial-prototype.md
  learning:
    value: low
    uncertainty_reduced: []
    decisions_changed: []
    reusable_artifacts:
      - partial prototype
  follow_up:
    decision: recover_or_archive
    changes: []
```

A PR can carry the decision when the branch itself is the proposal or evidence. A PR is not required merely to close an investigation.

### 9. Update the parent initiative

Roll up:

- resolution status, class, and disposition;
- landed and released state;
- actual resource use;
- effect on the expected Change funnel and remaining investment forecast;
- value-hypothesis evidence;
- scope, stop, pivot, reallocation, or recovery decision;
- any credible avoided-cost estimate and its confidence.

Keep `decision`, `administrative`, and `unresolved_loss` counts and spend separate. If several Changes conclude without landing, revisit whether the initiative itself should continue.

### 10. Complete the learning checkpoint

Ask what should change in:

- future Change shaping;
- product discovery;
- architecture or repository context;
- model routing;
- skills and prompts;
- gate profiles;
- resource thresholds;
- estimator features and resolution probabilities;
- recovery and ownership rules;
- initiative selection and stop conditions.

Create the smallest durable improvement that prevents rediscovery. For an administrative closure, it may be correct to record that no work-derived system change is warranted. For unresolved loss, require an ownership or recovery lesson even when product learning is absent.

## Reviewer test

A reviewer should be able to answer:

```text
What class of resolution is this?
What specific decision or closure occurred?
What evidence or accountable basis supports it?
What did the work consume?
What uncertainty or forecast changed, if any?
What landed or released, if anything?
What happens next?
Would another builder understand why the Change did not land?
```

If those answers are missing, do not call the Change productively resolved.

## Definition of done

- [ ] resolution status, class, disposition, and reason are explicit;
- [ ] `landed` and `released` are recorded separately;
- [ ] decision evidence or administrative basis supports the conclusion;
- [ ] resolution quality is stated without false confidence;
- [ ] all material resource use and attempts are included;
- [ ] decision resolution, administrative closure, and unresolved loss are not conflated;
- [ ] productive non-landing is derivable from the evidence rather than asserted;
- [ ] uncertainty reduced, decisions changed, reusable artifacts, and follow-up are recorded where applicable;
- [ ] the parent initiative and its forecast are updated when one exists;
- [ ] the learning checkpoint changes future behavior or explicitly records that no durable change is warranted.

## Related material

- [Changes](../01-operating-model/changes.md)
- [Not All Work Is Merge-Bound](../01-operating-model/not-all-work-is-merge-bound.md)
- [Resource Observability and Delivery Economics](../01-operating-model/resource-observability-and-delivery-economics.md)
- [Delivery Economics Records](../03-reference/delivery-economics-records.md)

