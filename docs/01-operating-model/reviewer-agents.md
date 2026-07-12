# Reviewer Agents

Reviewer agents are narrow, independent judges.

The implementation agent should self-review. It should not be the only party grading its own work.

## Why they matter

Agent-enabled delivery can increase output faster than human review capacity.

Without gates and reviewer agents, quality-focused builders become the cleanup crew. They get buried under diffs, comments, and the vague dread that nobody else has looked closely.

Reviewer agents can inspect specific concerns before scarce human attention is engaged. That makes them part of the capacity model as well as the quality model.

## Good reviewer agents are narrow

Useful roles include:

- scope reviewer
- code reviewer
- architecture reviewer
- design reviewer
- security reviewer
- test sufficiency reviewer
- regression reviewer
- decision-evidence reviewer for proposed evidence-backed non-landed resolutions
- resource-and-resolution reviewer for material, thresholded, or non-landed Changes.

Each reviewer should have:

- a single clear concern
- fresh context rather than the implementation agent’s private reasoning
- access to the Change Intent, parent initiative when relevant, docs, diff, gates, evidence, and applicable resource summary
- read-only posture by default
- a structured output format
- a boundary against inventing new product requirements or retrospective precision.

A decision-evidence reviewer independently tests whether a proposed decision-class resolution follows from relevant evidence, materially reduces uncertainty, and changes a forecast, next action, or investment decision. It should not reward a failed branch merely for producing a narrative after the fact.

A resource-and-resolution reviewer does not decide whether spending was “good” from the number alone. It checks whether attribution is complete enough, thresholds were followed, forecasts and actuals are distinguishable, variance is explained, and the resolution class is supported. It should challenge decision-class work without decision evidence, administrative closure presented as learning, and unresolved loss hidden behind a vague cancellation.

## Review output

A reviewer should return:

```text
decision: pass | fail | needs-human
required findings
advisory suggestions
questions requiring builder judgment
potential learning to promote into the system
```

A useful finding explains:

- what failed
- why it matters
- the evidence
- the smallest reasonable remediation
- whether the lesson should become a doc, example, skill, gate, test, estimator feature, routing rule, or capacity adjustment.

Reviewer agents should reduce ambiguity, not manufacture more of it.

## Review economics

A stronger reviewer model may be worth its higher request cost when it prevents expensive rework or focuses senior attention. Evaluate reviewers by their contribution to trustworthy delivered capability and useful decisions:

- material findings caught before builder review
- false-positive burden
- review and recovery time avoided
- downstream defects or rollbacks
- total cost of the Change resolution
- false classification of administrative or unresolved work as productive learning prevented.

Do not optimize a reviewer merely to produce fewer tokens or more comments.

## When humans still review

Use builder review when:

- risk or consequence is high
- taste, value, resource allocation, or product judgment is central
- the evidence or resource record is incomplete
- reviewer agents disagree
- a threshold requires an accountable decision
- the Change class has not earned trust
- accountability requires a named approver.

Reviewer agents focus human attention. They do not erase responsibility.
