# Playbook: Promote Learning into the System

Use this when a Change or initiative reveals repeated friction, missing context, weak proof, design drift, architecture problems, estimation error, routing failure, or an unnecessary human bottleneck.

## Principle

The system improves when human judgment and delivery evidence become reusable structure.

If a builder notices something once, a comment may be enough.

If the team keeps paying for the same issue, the system should learn.

## Step 1: State the learning plainly

Examples:

- “The issue did not specify the forbidden header behavior.”
- “The agent could not find the approved component pattern.”
- “Tests passed, but the browser console failed.”
- “Every reviewer asks for the same architecture boundary.”
- “Authentication Changes exceed their forecast because the repository lacks a reusable credential-lifecycle skill.”
- “Increasing agent budget does not increase throughput because product shaping is the current constraint.”
- “The initiative delivered inside its range, but the expected customer adoption did not appear.”

Avoid vague lessons such as “be more careful.” They are emotionally satisfying and operationally useless.

## Step 2: Classify the variance

Separate the kinds of learning before choosing a fix:

- **Intent variance:** the desired outcome or boundary was unclear.
- **Delivery variance:** actual resource use, elapsed time, or quality differed from forecast.
- **Value variance:** realized customer or business value differed from the initiative thesis.
- **Capacity variance:** a human, agent, environment, or operational constraint limited throughput.
- **Data variance:** attribution or measurement was too incomplete to support the decision.

Efficient delivery of a low-value initiative is not a delivery lesson alone. An over-budget Change may reveal architecture friction rather than weak agent performance.

## Step 3: Find the right layer

Use this promotion ladder:

1. **Review comment** — one-off correction.
2. **Documentation** — missing explanation or context.
3. **Example** — agents need to see what good looks like.
4. **Skill** — a repeated procedure should be performed a particular way.
5. **Reviewer prompt** — judgment can be checked consistently.
6. **Gate or threshold** — the concern needs to become part of done or a governed decision.
7. **Mechanical check** — the rule can be tested or linted.
8. **Routing rule** — a task class needs a different model, agent, or escalation path.
9. **Estimator update** — the forecast features, comparable set, or confidence calibration should change.
10. **Capacity or staffing decision** — a binding human or infrastructure constraint needs investment.
11. **Product or portfolio rule** — opportunity selection or value review should change.
12. **Scheduled cleanup** — drift matters but should not block every PR.

Choose the smallest layer that will change future behavior.

## Step 4: Make the improvement

Update the doc, template, skill, gate, test, workflow, routing policy, estimator, initiative record, or reviewer prompt in the same Change when it is small and clearly related.

Create a follow-up Change when the improvement is substantial or would distract from the original outcome.

Preserve the evidence and forecast version that motivated the update. A learned system needs lineage, not just a new rule.

## Step 5: Prove the system improvement

Show how the new structure would help:

- the template now requests the missing information
- the gate now catches the regression
- the skill now captures the evidence
- the architecture check now blocks the import
- the reviewer agent now returns a focused finding
- the routing rule lowers recovery without increasing total cost per trustworthy landed Change or evidence-backed decision
- the estimator range is better calibrated on a holdout cohort
- the capacity change relieves the measured constraint
- the initiative review changes which product bets receive the next investment.

System improvements deserve evidence too.

## Step 6: Watch for unintended cost

A new rule can create noise, false confidence, or block useful work.

After a few Changes or the next initiative review, ask whether the improvement:

- prevents the failure
- reduces total human and machine effort
- creates false positives
- remains understandable
- preserves data privacy and appropriate access
- belongs at a different layer
- still applies after model, pricing, workflow, or architecture changes.

## Definition of done

The learning has been promoted when future builders and agents can benefit from it without needing the original conversation or the person who noticed it, and the system has a way to verify that the change actually helped.
