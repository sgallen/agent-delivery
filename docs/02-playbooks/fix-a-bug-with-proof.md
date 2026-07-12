# Playbook: Fix a Bug with Proof

A bug is one of the best places to begin because reality has already supplied a test: something that should work does not.

Use this for low- or medium-risk defects reported by customers, support, monitoring, or another builder. The path is simple:

```text
report → reproduce → fix → prove → review by risk → learn
```

The hard part is resisting the temptation to skip the reproduction and trust a plausible edit.

## 1. Shape the Change

Capture:

- who or what observed the problem;
- expected and actual behavior;
- the affected route, workflow, service, or customer group;
- useful logs, screenshots, traces, or examples;
- non-goals and forbidden changes;
- risk, reversibility, and required proof;
- a parent initiative or resource range only when either will improve the decision.

Describe the failure, not your preferred implementation theory. Let the investigation earn the diagnosis.

## 2. Reproduce before fixing

Ask the agent for one stable failure signal:

- a failing unit or integration test;
- a failing eval;
- a deterministic browser journey;
- a log or trace query;
- a minimal reproduction script;
- a clear before-state screenshot or video.

Put the signal in the workpad.

When the issue cannot be reproduced with reasonable effort, do not let the agent guess its way into the codebase. Improve the context, engage a builder, or resolve the work as an investigation with an honest evidence record.

A fix without a credible failure signal is often just a plausible edit wearing confidence as a hat.

## 3. Investigate and make the smallest credible fix

Work in the isolated environment. Give the agent the Change, workpad, reproduction, repository context, observability tools, gate profile, and scope boundaries.

The workpad should show the likely cause, the evidence behind it, the intended fix, and material uncertainty. Update a forecast when the project uses one and the evidence changes it.

The implementation should address the reproduced cause, preserve unrelated behavior, and avoid opportunistic product or architecture work. A worthwhile side discovery becomes another Change; it does not hitch a ride because the branch is open.

Use an ExecPlan only if the investigation becomes genuinely complex.

## 4. Prove the behavior changed

Run the proof in this order:

1. The original reproduction no longer fails.
2. A regression test or eval passes when practical.
3. Targeted checks for the affected surface pass.
4. Required mechanical gates pass.
5. Browser, runtime, accessibility, design, architecture, or security checks pass where relevant.
6. Scope and forbidden-surface checks pass.

For user-facing bugs, capture before and after evidence when it adds confidence. For runtime bugs, show the relevant log or trace signal before and after.

The point is not to collect artifacts. It is to make the claim easy to judge.

## 5. Prepare review around risk

The issue, workpad, and PR should answer:

- What was broken?
- How was it reproduced?
- What changed?
- What proves the fix?
- What proves the Change stayed in scope?
- Where is human judgment still needed?
- Which failed attempts or human interventions materially affected confidence?

Low-risk, highly observable bugs may eventually need only evidence review. Higher-risk work may still need code, architecture, product, or security judgment.

The goal is not to remove review. It is to stop charging every Change the same human toll regardless of consequence or proof.

## 6. Improve the system

Ask why the bug escaped and what would make the next one cheaper to understand:

- Was the failure hard to observe?
- Was reproduction too manual?
- Did the repository lack context?
- Should the regression join a broader suite?
- Did the agent repeat a known bad pattern?
- Did the selected model, skill, or environment create avoidable recovery?
- When resource data was captured, did it reveal an avoidable pattern?

Promote only the learning likely to matter again: a better issue field, signal, test, skill, gate, routing rule, or repository explanation.

## Definition of done

The Change is complete when the failure is credibly reproduced or explicitly documented as not reproducible, the fix is focused, the proof supports the before-and-after claim, required judgment is recorded, optional resource records are current when used, and the next builder does not need private chat history to understand what happened.
