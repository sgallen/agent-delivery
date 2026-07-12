# Playbook: Run the First Experiment

Do not begin by building an orchestration platform.

Begin with one real Change.

The first experiment should be small enough to inspect, useful enough to matter, and honest enough to teach you something even when the work does not land. The purpose is not to prove that agents can write code. We know they can. The purpose is to see whether your surrounding system can turn that capability into a trustworthy result or a well-supported decision.

## What you are trying to prove

By the end, you should have:

- one bounded Change with clear intent;
- one persistent workpad;
- one isolated place to work;
- a small set of meaningful gates;
- evidence a builder can judge without reconstructing the session;
- an explicit resolution, whether the work lands or not;
- a lightweight record of what the work consumed;
- one improvement to make before the next run.

That is enough. The first experiment does not need a dashboard, a learned estimator, or a committee.

## Pick the right Change

Choose work that is real, low risk, observable, and reversible.

A customer-reported bug with a deterministic failure signal is often ideal. A narrow feasibility spike can also work when the decision question is explicit: *Can this approach meet the requirement within these constraints?*

Avoid billing, authentication, migrations, broad refactors, and work whose main requirement is “use good judgment” without explaining what good means. You are trying to learn about the delivery system, not test its appetite for danger.

## 1. Shape the intent

Write a GitHub Issue or equivalent Change record that explains:

- the outcome or decision;
- why it matters;
- what is in and out of scope;
- what would count as proof;
- the important risks and stop conditions;
- whether landing is expected, optional, or not required.

For exploratory work, state the non-landed success condition before execution begins. Do not invent a learning objective after the implementation becomes inconvenient.

Use [Changes](../01-operating-model/changes.md) for the minimum shape and [Not All Work Is Merge-Bound](../01-operating-model/not-all-work-is-merge-bound.md) when the result may be a decision rather than a merge.

## 2. Choose the minimum proof

Pick only the gates needed to judge this Change well.

For a bug, that usually means a failing reproduction, a passing fix, targeted regression coverage, and basic scope checks. For a UI Change, add browser evidence and console checks. For an experiment, define the evidence that would support continuing, narrowing, or stopping.

A large gate list does not create confidence by itself. A small set tied directly to the claim often does.

## 3. Create the workpad and environment

Create one canonical comment headed:

```md
## Agent Workpad
```

Use it for the plan, discoveries, blockers, evidence, resource status, and final handoff. Keep the issue body stable; let the workpad carry the moving state.

Give the Change its own branch and worktree. Isolate mutable data, ports, browser state, logs, and artifacts when behavior depends on them. A worktree isolates code. An execution environment isolates reality. Do not confuse the two.

## 4. Let the agent work

Provide the Change, `WORKFLOW.md`, the workpad, relevant repository context, gate commands, environment details, and stop conditions.

Then let the agent investigate, plan, execute, test, and repair. Ask it to keep the workpad current and preserve evidence as it goes.

Do not rescue the run at the first sign of friction; that friction is part of what you are trying to see. Step in when judgment is genuinely required, risk changes, progress stalls, or the stop policy says the next move belongs to a builder.

## 5. Review the evidence, not the performance

Do not review the session transcript as though effort were the outcome.

Review:

- the behavior or decision against the original intent;
- the diff or experiment artifact;
- tests, screenshots, logs, traces, research, or benchmarks;
- unrelated changes and known gaps;
- failed or discarded attempts that materially affected cost or confidence;
- where builder judgment was needed;
- what the agent and environment consumed, even if the numbers are incomplete.

The evidence package should make the result easier to judge than the raw activity that produced it.

## 6. Resolve the Change honestly

The work may be delivered. It may produce a useful decision not to proceed. It may close for an external reason. Or the system may have spent resources without reaching a defensible conclusion.

Those are different outcomes. Record the one that actually happened.

A good non-landed result says what question was answered, what evidence changed the decision, what uncertainty remains, and what happens next. An abandoned branch with a retrospective paragraph is not automatically learning.

Use [Resolve a Change That Does Not Land](resolve-a-change-that-does-not-land.md) when that distinction matters.

## 7. Improve one part of the system

Ask:

> What made this harder, riskier, more expensive, or more manual than it needed to be?

Then make one useful change. Improve the issue template. Add missing repository context. Tighten a gate. Preserve a better runtime signal. Remove a workpad section nobody used. Change the stop rule. Record a more honest estimate range.

Do not turn one experiment into a backlog of fifty process ideas. The point is to make the second Change better than the first.

## Definition of done

The experiment is complete when another builder can read the Change record and understand:

- what the team meant to accomplish or learn;
- what the agent did;
- what evidence exists;
- how the work resolved and whether anything landed;
- what resources were consumed, with gaps made explicit;
- what will change before the next run.

The first experiment has done its job when it leaves you with more than a demo. It should leave you with the first credible piece of evidence about how your delivery system needs to work.
