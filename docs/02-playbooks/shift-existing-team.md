# Playbook: Shift an Existing Team

Introducing agents into an established team is not mainly a tooling rollout. It changes where work starts, where judgment is applied, and who gets stuck cleaning up when the system is weak.

Handle that honestly.

The goal is to create a better path for real product work without producing fear, slop, review overload, or a parallel process nobody trusts. Pair this with [The First 30 Days](first-30-days.md) for a bounded rollout.

## 1. Name the shift without insulting the team

Do not lead with a story about roles disappearing.

Lead with the practical change:

> Agents can now perform meaningful implementation and investigation work. Our job is to redesign delivery so that human judgment has more leverage—not so that the same people inherit a larger cleanup queue.

Acknowledge what people have already seen. Agents can move quickly. They can also create plausible-looking mess. Reviewers can become the bottleneck. Product builders can remain trapped behind implementation queues. Important judgment often lives in a few people’s heads.

The operating model exists to deal with those facts, not to wave them away.

## 2. Give a small group permission to work differently

Choose two to five builders with enough product, design, and engineering judgment to act across the old boundaries.

Give them explicit permission to:

- collapse handoffs that do not improve the outcome;
- make ideas concrete earlier;
- replace some status rituals with working evidence;
- discard an implementation without treating the experiment as a personal failure;
- question steps that no longer earn their cost.

That is not permission to lower standards. It is permission to find a better way to meet them.

Protect the pilot from recreating the entire old process around a few new tools. The old process plus agents is usually just the old process with more output.

## 3. Establish enough truth to compare

Before changing the path, capture a small baseline:

- elapsed time and waiting time;
- active builder and reviewer attention;
- common sources of rework;
- quality or regression signals;
- work repeatedly blocked on scarce specialists;
- current environment and observability gaps;
- model, tool, and infrastructure cost when it is easy to capture.

Do not build a management dashboard with twelve gradients. You need enough truth to tell whether the new path reduces total burden or merely moves it.

## 4. Start with one safe class of work

Choose work that is real, observable, and reversible: deterministic bugs, small UI behavior fixes, regression tests, documentation, internal tooling, or bounded investigations.

Avoid the dramatic project. Early trust is built through boring competence.

Use [Run the First Experiment](first-experiment.md) for the first Change and [The First 30 Days](first-30-days.md) for the cohort.

## 5. Protect the people with the strongest judgment

Do not turn senior engineers, designers, or product leaders into an endless review layer.

Use small Changes, scope and regression gates, focused reviewer agents, concise evidence packages, explicit stop conditions, and limits on concurrent review demand.

Watch the full burden. A pilot is not successful because implementation became faster while review, recovery, or product clarification doubled.

When review load rises materially, stop expanding. Improve the system first.

## 6. Learn in public, without creating a blame machine

After each Change, ask where the path was weak:

- Was the intent underspecified?
- Could the agent observe the product?
- Did the evidence help?
- Where did a builder intervene, and was that intervention high leverage?
- Did the Change resolve cleanly, including when nothing landed?
- When resource data was available, did a model or tool look cheap but create expensive rework?
- What should become durable context, a skill, a gate, or a better stop rule?

Invite skeptics to inspect the evidence and failure modes. Skepticism is useful when it is allowed to meet reality.

Keep telemetry aimed at the system. Capability mix and team-level patterns can improve staffing and workflow decisions. Individual token counts are a poor substitute for judgment and a fast way to poison the experiment.

## 7. Expand by earned trust

Add another Change class only when the current one has a track record, its failures are understood, the evidence is credible, and total human burden is stable or lower.

Trust belongs to a class of work inside a particular operating system. “We trust AI now” is not a useful policy.

As the path matures, the records can help reveal the real constraint. More agent capacity may help. Or the team may need stronger product shaping, better test infrastructure, more review capacity, or a builder who can turn customer understanding into ready work.

## 8. Let roles become higher leverage

A product manager may move closer to working product and evidence. A designer may encode taste in examples, components, and review gates. An engineer may spend more time on architecture, environments, and the delivery system than on typing every implementation.

Those are not diminished versions of the old roles. They are often the more valuable parts of the work, finally made visible.

Reward people for improving the system, reducing repeated effort, making judgment durable, creating useful evidence, and producing customer outcomes. Do not reward generated-code volume. The system can create plenty of that without encouragement.

## Definition of done for the first phase

The shift is working when one bounded class of Changes moves repeatedly through the new path, review burden is stable or lower, failures produce system improvements rather than blame, and the team can make a clear decision to expand, hold, or redesign.

The real test is not whether agents are busy. It is whether capable people have more room to do the parts of product work that require them.
