# Agent Delivery

*A practical playbook for turning agent capability into trustworthy product outcomes—and making the delivery system better with every Change.*

Software teams are about to make a very understandable mistake.

They will use agents to produce more code, then feed that code into the same queues, handoffs, review rituals, and staffing assumptions they already have. Output will rise. So will review pressure. The people with the strongest judgment will become the cleanup layer.

It will look like progress because, in one narrow sense, it is.

It will also leave most of the advantage on the table.

Current agents can already inspect a codebase, form a plan, edit files, run tools, debug failures, operate a browser, gather evidence, and prepare work for review. This is not better autocomplete. It is a new operating capability.

The useful question is no longer:

> How can AI help the existing process move faster?

It is:

> What should product delivery look like when agents can participate directly in the work?

This playbook is my current answer.

It grew out of using the tools, experimenting with orchestration, and watching a team adopt them in real product work. I saw the leverage. I also saw the failure mode: more code, more review burden, and the same old handoffs underneath. The tools had changed faster than the system around them.

Agent Delivery is an attempt to close that gap.

## The idea in one page

Start with a **Change**: a bounded piece of product work with a clear outcome, known constraints, and an honest idea of what would count as proof.

Give the agent a legible repository, an isolated environment, and a standing workflow. Let it work through a persistent workpad. Use gates to make quality durable and evidence to make the result easy to judge. Bring builders in where product judgment, taste, risk, architecture, or accountability actually matter.

Then resolve the Change honestly.

Sometimes the work lands. Sometimes an experiment shows that it should not. Sometimes priorities change for reasons the work did not uncover. Sometimes the system simply loses the thread. Those are different outcomes, and the record should not flatten them into “merged” or “failed.”

At its smallest, the flow looks like this:

```text
clear Change Intent
  + repo-level WORKFLOW.md
  → one persistent workpad
  → isolated execution
  → agent work
  → gates and evidence
  → builder decision
  → explicit resolution
  → learning folded back into the system
```

The operating principles are simple:

- **Shape intent before prompting.** The agent needs a useful problem, not a longer incantation.
- **Manage Changes, not terminal sessions.** The work should survive a model switch, a failed run, or a human handoff.
- **Put human judgment where it has leverage.** Builders own outcomes, risk, taste, and the operating model; they do not need to touch every keystroke.
- **Make proof part of the work.** Tests, screenshots, logs, traces, and review evidence are not paperwork added at the end.
- **Resolve work honestly.** A good non-landed decision can be valuable. A dead branch with a bill is not automatically learning.
- **Make resource use visible.** Connect agent spend, infrastructure, retries, elapsed time, and builder attention to the Change that consumed them.
- **Let every effort improve the next one.** Better context, gates, skills, estimates, routing, and product decisions are part of the output.

## Why the economics belong in the workflow

The cost curve matters, but a provider bill does not tell you much about delivery.

A model dashboard can show tokens and dollars. It cannot tell you whether that spend produced a trustworthy capability, a useful decision not to continue, or three abandoned attempts that nobody wants to discuss.

The Change is where cost meets outcome.

Once runs, environments, retries, and builder attention are attributable to a Change, the team can begin to answer better questions:

- What did this kind of work actually cost?
- Which models or agents were economical after review and rework—not merely cheap per call?
- Why did a $40 estimate become $120?
- How much human shaping and review does another $10,000 of agent spend require?
- Is agent budget the constraint, or is the team short on customer discovery, product shaping, review, test infrastructure, or release capacity?

Start with attribution, not a finance platform. A run ID, a Change ID, a few machine totals, the kind of builder attention involved, and an explicit outcome are enough to create the first useful record.

With history, estimates can become ranges instead of guesses. Resource thresholds can become deliberate pause points. Routing can improve by task type. Capacity plans can show which human or technical constraint is preventing useful throughput.

That is the deeper opportunity: not cheaper code, but a delivery system that remembers what work consumed, what it produced, and what should change next time.

## From Changes to product bets

A major feature, platform capability, or new product line is not just a larger ticket. It is an investment hypothesis.

Before committing, preserve the expected customer or business value, the evidence behind that belief, the likely human and machine investment, the important unknowns, and the conditions that would cause the team to stop or change course.

During delivery, roll the actual Changes into the initiative. Some will land. Some will produce a useful decision. Some will close for external reasons. Some may become unresolved loss. Keep the distinctions visible.

Afterward, ask two separate questions:

1. What did it actually take to deliver or reach the decision?
2. Did the expected value appear?

A team can build the wrong thing efficiently. It can also spend a modest amount learning not to make a much larger mistake. Delivery quality and product judgment both deserve a feedback loop.

## Start smaller than your enthusiasm

You do not need a routing platform, a forecasting model, or a portfolio dashboard to begin. Please do not build all three before running one Change.

Pick a low-risk bug or bounded improvement. Write the intent. Create one workpad. Give the agent an isolated place to work. Require a few meaningful gates and enough evidence to judge the result. Record what it consumed and how it resolved. Then improve the system from what actually happened.

Choose the path that matches where you are:

- **Understand the argument:** read [Why This Exists](docs/00-the-case/00-why-this-exists.md) and [The Case](docs/00-the-case/index.md).
- **Run one useful experiment:** use [Run the First Experiment](docs/02-playbooks/first-experiment.md).
- **Fix a real bug with proof:** follow [Fix a Bug with Proof](docs/02-playbooks/fix-a-bug-with-proof.md).
- **Shift an existing team:** start with [Shift an Existing Team](docs/02-playbooks/shift-existing-team.md) and [The First 30 Days](docs/02-playbooks/first-30-days.md).
- **Measure the economics:** use [Measure Delivery Economics](docs/02-playbooks/measure-delivery-economics.md).
- **Plan a larger product bet:** use [Forecast and Review an Initiative](docs/02-playbooks/forecast-and-review-an-initiative.md) with [Plan Delivery Capacity](docs/02-playbooks/plan-delivery-capacity.md).

## What is in the kit

- [**The Case**](docs/00-the-case/index.md) explains why the constraint changed and why the old process, while still useful, is no longer enough.
- [**The Operating Model**](docs/01-operating-model/index.md) connects Changes, builders, workflows, workpads, gates, evidence, resource use, initiatives, and learning.
- [**Playbooks**](docs/02-playbooks/index.md) help you run the first experiment, shift a team, measure real delivery economics, resolve work that does not land, and plan initiatives and capacity.
- [**Reference and templates**](docs/03-reference/index.md) provide copyable GitHub-first starting points rather than one sacred implementation.

The complete map is in [`docs/index.md`](docs/index.md).

## What this is not

This is not an argument that engineers, product managers, designers, QA, security, or operators matter less. Their judgment matters more when execution becomes abundant. The work is to apply that judgment where it changes the outcome.

It is not permission for sloppy speed. Reliability, security, accessibility, architecture, and taste do not become optional because a model wrote the code. Move faster because the system is better, not because the standards are lower.

It is not a people-ranking system wearing an observability badge. Measure capability mix and system behavior to improve decisions. Keep raw human effort separate from cost assumptions, preserve uncertainty, and do not turn telemetry into covert surveillance.

And it is not finished doctrine. Some of this will be wrong. The models will change, the tools will change, and teams will find better patterns. The point is to start from a serious position, run real work, preserve the evidence, and improve from reality rather than enthusiasm.

## Where the thinking came from

The thesis is grounded in direct use and team experience. A few outside examples gave sharper language to things I was already seeing: [Gusto’s use of Claude Code](https://youtu.be/5FKBkUCaLa8), OpenAI’s work on [harness engineering](https://openai.com/index/harness-engineering/), [Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/), [Codex ExecPlans](https://developers.openai.com/cookbook/articles/codex_exec_plans), and Geoffrey Huntley’s deliberately stark argument about [the new economics of software development](https://ghuntley.com/real/).

They do not add up to one universal process. They do reinforce the same conclusion: the capability is real, the operating model matters, and the only useful next step is to build, measure, and learn. The fuller notes are in [References and Influences](docs/references.md).
