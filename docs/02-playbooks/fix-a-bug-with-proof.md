# Playbook: Fix a Bug with Proof

Use this for a low- or medium-risk bug reported by a customer, support, monitoring, or another builder.

This is a strong first Change class because the desired outcome is usually concrete: reproduce the failure, make the smallest credible fix, and prove the behavior changed without introducing something else.

## Outcome

The Change produces:

- a deterministic reproduction signal
- a focused fix
- a regression test or eval when practical
- passing required gates
- evidence of the before and after behavior
- a reviewable Change Record
- the run and Change resource record, at the workflow's adopted maturity
- any useful system learning.

## Step 1: Shape the Change Intent

Capture:

- who or what observed the problem
- expected behavior
- actual behavior
- affected route, workflow, service, or customer class
- known logs, screenshots, traces, or examples
- non-goals and forbidden changes
- risk and reversibility
- required validation
- parent initiative, when the bug affects a larger product investment
- a resource forecast, likely range, confidence, and thresholds when the workflow uses them.

Avoid turning the ticket into a theory about the implementation. Describe the outcome and the evidence. Let the investigation earn the diagnosis.

## Step 2: Reproduce before fixing

The first behavioral gate is reproduction.

Ask the agent to produce one of:

- a failing unit or integration test
- a failing eval
- a deterministic browser journey
- a log or trace query that exposes the failure
- a minimal reproduction script
- a stable before-state screenshot or video.

Record the reproduction signal in the workpad.

If the agent cannot reproduce the issue with reasonable effort, do not let it guess at a fix. Reclassify the Change as an investigation, improve the context, or engage a builder.

A fix without a credible failure signal is often just a plausible edit wearing confidence as a hat.

## Step 3: Investigate in an isolated environment

Give the agent:

- the issue and workpad
- the relevant repository context
- the failing signal
- browser, logs, metrics, or traces when applicable
- the gate profile
- the scope boundaries.

The agent should update the workpad with:

- likely cause
- evidence supporting the diagnosis
- intended fix
- risks or ambiguities
- validation plan
- actual resource use to date and a revised completion forecast when the investigation changes the estimate.

For a straightforward bug, a compact workpad is enough. Use an ExecPlan only if the investigation becomes genuinely complex.

## Step 4: Implement the smallest credible fix

The implementation should:

- address the reproduced cause
- stay within the stated scope
- avoid opportunistic product or architecture changes
- add or retain the regression proof
- preserve unrelated behavior.

If the agent finds a worthwhile out-of-scope improvement, create another Change Intent. Do not smuggle it into the current diff because the branch was already open.

## Step 5: Prove the fix

Run validation in this order:

1. The original reproduction now passes or no longer occurs.
2. The new regression test or eval passes.
3. Targeted tests for the affected surface pass.
4. Required mechanical gates pass.
5. Relevant browser, log, trace, accessibility, design, or architecture checks pass.
6. Scope and forbidden-change checks pass.

For user-facing bugs, capture before and after evidence when doing so adds real confidence.

For runtime bugs, include the relevant log or trace signal before and after the fix.

## Step 6: Prepare the review package

The PR and workpad should make it easy to answer:

- What was broken?
- How was it reproduced?
- What changed?
- What proves the fix?
- What proves unrelated behavior was respected?
- Where is human judgment still needed?
- What did the Change resolution consume, which failed or discarded attempts are included, and did a threshold require a decision?

A reviewer should not have to reconstruct the bug from chat history or rerun the entire investigation to understand the claim.

## Step 7: Apply risk-appropriate review

Low-risk and highly observable bugs may need only evidence review once the system has earned trust for that class.

Higher-risk bugs may still require code, architecture, security, or product review.

The goal is not to eliminate review. It is to match review to the risk and uncertainty rather than applying the same human tollbooth to every Change.

## Step 8: Complete the learning checkpoint

Ask:

- Why did the bug escape existing gates?
- Was the issue easy for the agent to understand?
- Was reproduction too manual?
- Did the environment expose the right signals?
- Should the regression test join a broader suite?
- Did the agent repeat a known bad pattern?
- Can this class of bug require less builder attention next time?
- Was the selected model, skill, or environment economical for the delivered resolution—or for the evidence-backed decision if the proposed fix should not land?
- Did the actual fall inside the forecast range, and what should change in the estimator?

Promote only the learning that will be useful again.

## Definition of done

The bug Change is complete when:

- the original failure is reproducible or explicitly documented as not reproducible
- the fix is focused and within scope
- the regression proof passes
- required gates are green or an accountable waiver is recorded
- evidence supports the before and after claim
- the workpad and PR tell the story without private context
- resource actuals, failed attempts, and material variance are recorded when measured
- the parent initiative is updated when one exists
- the learning checkpoint is complete.

The useful loop is simple:

```text
report
  → reproduce
  → fix
  → prove
  → review by risk
  → learn
```

Do that well enough, and a customer-reported bug can move from signal to reviewable resolution without waiting in line for someone to manually carry every step.
