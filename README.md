# Agent Delivery

*A practical playbook for product teams adapting to a world where agents can participate directly in the work—and humans govern the system around them.*

The tools changed. Most delivery systems have not.

Agents can already inspect unfamiliar code, form a plan, edit files, run tests, use browsers and other tools, debug failures, gather evidence, and prepare meaningful work for review. This is no longer better autocomplete. It is a new operating capability.

Most teams will make the understandable first move: keep the existing process, add agents around the edges, and ask everyone to move faster.

It will help. It may also produce more queues, more review pressure, more half-trusted output, and more cleanup for the people with the strongest judgment. The new capability gets poured into a system designed around a different constraint.

That leaves the important question unanswered:

> What should product delivery look like now that agents can participate directly in the work?

This playbook is my current answer.

It grew out of using the tools, experimenting with orchestration, and watching a team adopt them in real product work. I saw the leverage. I also saw how quickly leverage turns into burden when the surrounding system does not change.

Agent Delivery is an attempt to close that gap.

## TL;DR

- Agents can now perform meaningful product-development work, not merely generate code snippets.
- Traditional delivery still works, but it was shaped around scarce human implementation capacity. That constraint has changed.
- Bolting agents onto the old process can increase output without reducing handoffs, waiting, review burden, or uncertainty.
- The stronger move is to redesign the operating model: let agents attempt more of the work, then place human judgment where it has the most leverage.
- Builders remain responsible for intent, product judgment, architecture, taste, risk, and outcomes. Agents execute inside a system that makes the work legible, bounded, provable, and recoverable.
- The practical unit is a **Change**, not a prompt or terminal session. A Change carries intent, execution state, evidence, an accountable decision, and learning.
- Not every useful Change has to merge. Some deliver capability; some produce enough evidence to stop, narrow, or redirect. The distinction should be explicit.
- As the system matures, attributable resource and outcome history can improve estimation, model routing, capacity planning, and product-investment decisions. That is an important consequence, not a prerequisite for the first experiment.
- The approach is useful with current models. Better models would compound the advantage for teams that have already learned how to absorb them.

## The constraint changed

For most of software history, more product output required more human implementation capacity. More capacity brought more specialization, more coordination, more planning, more management, and more cost.

Much of modern product delivery evolved around protecting that scarce resource.

Prioritize carefully. Specify before building. Queue the work. Hand it across functions. Review it. Release it. Repeat.

That was not foolish. It was a rational response to the economics and capabilities of the time.

Current agents alter the equation. They can make an idea concrete before a team spends days debating whether it deserves scarce engineering capacity. They can investigate a customer issue, attempt a fix, compare approaches, produce a prototype, run validation, and return with evidence.

The default question changes with them.

**Old question:** Is this worth assigning to a developer?

**New question:** Can the system make this concrete enough that builders can judge it with evidence?

Small wording change. Large organizational consequence.

## Adapt the operating model

The point is not to automate the old process step by step.

Start with a harder thought experiment:

> If the agent-enabled system attempted the work by default, where would it fail—and where would human judgment materially improve the outcome?

Then design around the answer.

Builders shape worthwhile intent, resolve ambiguity, make high-consequence tradeoffs, encode taste and standards, govern risk, and own the result. Agents investigate, implement, test, inspect, repair, and prepare evidence. The repository, execution environment, workflow, gates, and review system make that collaboration trustworthy.

This is **human-governed, agent-enabled delivery**.

The goal is not maximum autonomy. It is maximum leverage from scarce human judgment.

## What it looks like in practice

A Change is the practical unit that carries the larger idea into daily work.

```text
clear Change Intent
  + a legible repository and standing workflow
  → one persistent workpad
  → isolated execution
  → agent work
  → gates and evidence
  → builder decision
  → explicit resolution
  → learning folded back into the system
```

The core pieces are straightforward:

- **Builders** own outcomes, judgment, taste, risk, and the operating model itself.
- **Changes** preserve the work across runs, model switches, failures, and human handoffs.
- **`WORKFLOW.md`** carries the standing repository contract so the process is not trapped in private memory.
- **Workpads** hold the live plan, discoveries, blockers, validation state, and handoff.
- **Execution environments** give agents a safe place to run and observe the product.
- **Gates** make important quality and risk rules durable.
- **Evidence** makes the result easier to judge than the activity that produced it.
- **Learning checkpoints** turn repeated friction into better context, tests, skills, gates, and workflows.

The machinery should make good judgment easier to apply. If it becomes a new ceremony layer, it has lost the plot.

## Why the advantage compounds

There are two improvement curves.

The first is external: models, tools, and harnesses may continue to improve.

The second is internal: the team gets better at using them. Repository context becomes clearer. Environments become more reliable. Gates get sharper. Repeated corrections become tests and skills. Builders learn which work to shape, where to intervene, and which classes of Change the system can handle safely.

A team that only swaps in a better model receives an incremental benefit.

A team that has also redesigned the operating model can absorb that improvement across the whole delivery system.

This is why the case does not depend on future model magic. Current capability is enough to justify learning how to work differently. Future capability would make that learning more valuable.

## What maturity unlocks

Once work is attributable to a Change and paired with a real outcome, the delivery system starts to develop a useful memory.

It can learn what different kinds of work tend to consume, which models and agents perform well after review and rework, where human attention becomes the bottleneck, and why estimates miss. At the initiative level, it can compare the value the team expected with what the work actually cost and what value appeared later.

That opens the door to better estimation, deliberate spend thresholds, model routing, capacity planning, and more honest product-investment reviews.

Those capabilities matter. They should be earned progressively.

Do not build a finance platform, routing layer, learned estimator, and portfolio dashboard before one useful Change can move through the system end to end. Start with enough attribution to learn. Add machinery when a real decision needs it.

## Start with one credible Change

Pick a low-risk bug, bounded improvement, or explicit feasibility question.

Shape the intent. Give the agent enough context and an isolated place to work. Require a few meaningful gates and enough evidence to judge the result. Resolve it honestly. Then improve one part of the system before the next Change.

Choose the path that matches where you are:

- **Understand the argument:** read [Why This Exists](docs/00-the-case/00-why-this-exists.md) and [The Case](docs/00-the-case/index.md).
- **Run one useful experiment:** use [Run the First Experiment](docs/02-playbooks/first-experiment.md).
- **Fix a real bug with proof:** follow [Fix a Bug with Proof](docs/02-playbooks/fix-a-bug-with-proof.md).
- **Shift an existing team:** start with [Shift an Existing Team](docs/02-playbooks/shift-existing-team.md) and [The First 30 Days](docs/02-playbooks/first-30-days.md).
- **Go further once the basics work:** explore [Delivery Economics](docs/01-operating-model/resource-observability-and-delivery-economics.md), [Initiatives and the Value Loop](docs/01-operating-model/initiatives-and-value.md), and [Delivery Capacity](docs/02-playbooks/plan-delivery-capacity.md).

## What is in the kit

- [**The Case**](docs/00-the-case/index.md) explains what changed, why the old assumptions no longer fit as well, and what a stronger response looks like.
- [**The Operating Model**](docs/01-operating-model/index.md) connects builders, agents, Changes, workflows, workpads, environments, gates, evidence, review, recovery, and learning.
- [**Playbooks**](docs/02-playbooks/index.md) help you run a first experiment, shift a team, prove a bug fix, improve the system, and adopt advanced practices when they earn their place.
- [**Reference and templates**](docs/03-reference/index.md) provide copyable GitHub-first starting points rather than one sacred implementation.

The complete map is in [`docs/index.md`](docs/index.md).

## What this is not

This is not an argument that engineers, product managers, designers, QA, security, or operators matter less. Their judgment matters more when implementation becomes more abundant. The work is to apply that judgment where it changes the outcome.

It is not permission for sloppy speed. Reliability, security, accessibility, architecture, and taste do not become optional because a model wrote the code. Move faster because the system is better, not because the standards are lower.

It is not a headcount-reduction thesis or a people-ranking system wearing an observability badge. Measure the system to improve decisions. Do not confuse telemetry with judgment.

And it is not finished doctrine. Some of this will be wrong. The models will change, the tools will change, and teams will discover better patterns. The point is to start from a serious position, run real work, preserve the evidence, and improve from reality rather than enthusiasm.

## Where the thinking came from

The thesis is grounded in direct use and team experience. A few outside examples gave sharper language to things I was already seeing: [Gusto’s use of Claude Code](https://youtu.be/5FKBkUCaLa8), OpenAI’s work on [harness engineering](https://openai.com/index/harness-engineering/), [Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/), [Codex ExecPlans](https://developers.openai.com/cookbook/articles/codex_exec_plans), and Geoffrey Huntley’s deliberately stark argument about [the new economics of software development](https://ghuntley.com/real/).

They do not add up to one universal process. They reinforce the same conclusion: the capability is real, the operating model matters, and the useful next step is to build, inspect, and learn.
