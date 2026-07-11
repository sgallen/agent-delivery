# Agent Delivery

*A practical playbook for product teams where agents are first-class participants and humans govern the system.*

Most teams will make the same understandable mistake: keep the existing product delivery process, add agents around the edges, and call the result transformation.

It will help. It will also leave most of the advantage on the table.

Current agents can already perform meaningful product development work. They can inspect a codebase, form a plan, edit files, run tests, use tools, debug failures, operate browsers, gather evidence, and prepare work for review. This is not better autocomplete. It is a new operating capability.

The useful question is no longer:

> How can AI help the existing process move faster?

It is:

> What should product delivery look like now that agents can participate directly in the work?

This playbook is my current answer.

It grew out of using AI coding tools and agents myself, experimenting with orchestration, and watching my team adopt the tooling in real work. I saw the leverage. I also saw the failure mode: more code, more review pressure, and the same old handoffs underneath. The tools had changed faster than the system around them.

The resources cited here helped sharpen the argument. The playbook exists to make it concrete enough to test, challenge, and improve—not merely interesting enough to agree with.

## TL;DR

- Agents can now do meaningful product development work, not just generate code snippets.
- Traditional product delivery still works, but it was designed around scarce human implementation capacity.
- Bolting agents onto that process can increase output without reducing queues, handoffs, or review burden.
- The better move is to invert the default: let the system attempt the work, then engage builders where human judgment creates the most leverage.
- Builders shape intent and govern risk, taste, and outcomes. Agents execute. Gates prove quality. Evidence makes the result reviewable.
- Every Change should make the product better. The best Changes also make the system better.
- This is a working playbook. Some of it will be wrong. The point is to start from a serious position, run real experiments, and improve it from evidence.

## The shift

For a long time, more product output meant more developers. More developers meant more coordination, more management, more meetings, and more process. Much of modern product delivery evolved to protect expensive human implementation time.

That constraint has changed.

Agents can make ideas concrete before a team spends days debating whether the work deserves scarce engineering capacity. They can investigate a customer issue, attempt a fix, compare approaches, run validation, and return with evidence.

That changes the default question.

**Old question:** Is this worth assigning to a developer?

**New question:** Can the system make this concrete enough that builders can judge it with evidence?

Small wording change. Large organizational consequence.

### The cost curve is no longer theoretical

Token counts do not translate cleanly into developer-days. The useful output depends on the model, the task, the codebase, the harness, and the quality of the gates. Pretending otherwise would create precision without meaning.

The budget comparison is still useful. The deliberately high-usage scenario in the reference calculator costs roughly **$600 to $6,000 per month** across representative current models. For orientation, public U.S. wage and benefit data supports an approximate employer-compensation benchmark of **$190,000 per year, or about $15,800 per month**, for a software developer. That benchmark is not universal, and it is not a claim of equivalent output. It simply makes the difference in cost envelopes easier to feel.

The meaningful comparison is not agent versus employee. It is whether the system can produce trustworthy Changes at a lower total cost and with less scarce builder attention.

The metric that ultimately matters is **total cost per accepted Change**, including models, tools, environments, failed attempts, and builder attention.

See [The Cost Curve Made Concrete](docs/00-the-case/02-the-cost-curve-made-concrete.md) for the dated assumptions, and [Model Economics](docs/03-reference/model-economics.md) for the benchmark derivation, living price table, and calculator.

## Invert the default

Do not start by assuming the existing human workflow is fixed and asking where an agent might help.

Start with a harder thought experiment:

> If the agent-enabled system attempted the work by default, where would it fail, and where would human judgment create the most leverage?

Then engineer around the answer.

That may mean builders shape intent at the start, review evidence at the end, resolve a product or architecture tradeoff in the middle, or lead the work directly when risk or ambiguity warrants it.

The point is not to remove people. The point is to engage them deliberately.

## The operating model

The default flow is intentionally simple:

```text
Change Intent in an issue
  + repo-level WORKFLOW.md
  → one persistent workpad
  → isolated worktree and execution environment
  → agent implementation
  → gates and evidence
  → PR and review
  → Change Record
  → learning checkpoint
```

The core pieces are:

- **Builders** — the humans responsible for outcomes, judgment, taste, risk, and improving the system.
- **Changes** — units of product work that carry intent, execution state, evidence, and learning.
- **`WORKFLOW.md`** — the standing operating contract for how work moves through a repository.
- **Workpads** — the live per-Change plan, checklist, validation state, blockers, and evidence links.
- **Gates** — mechanical, behavioral, and judgment checks that make quality durable.
- **Evidence** — tests, screenshots, logs, traces, reviews, and other proof that the outcome is real.
- **Skills** — reusable procedures that encode how the team wants agents to perform important steps.
- **Learning checkpoints** — the mechanism for turning repeated corrections into better docs, gates, tests, skills, and workflows.

The machinery exists to focus human judgment, not bury it under a new layer of ceremony.

## So what do I do?

Choose the smallest path that matches your situation.

### I want to understand the argument

Read [Why This Exists](docs/00-the-case/00-why-this-exists.md), [The Case](docs/00-the-case/index.md), and [The North Star](docs/00-the-case/10-the-north-star.md).

### I want to test it on a personal project

Run the [First Experiment](docs/02-playbooks/first-experiment.md). A low-risk bug is an especially useful starting point; use [Fix a Bug with Proof](docs/02-playbooks/fix-a-bug-with-proof.md) to reproduce it, fix it, and prove the outcome.

### I am starting a serious project

Use [Start a Greenfield Project](docs/02-playbooks/start-greenfield.md), then follow [The First 30 Days](docs/02-playbooks/first-30-days.md) to establish the initial workflow, environments, gates, and learning cadence.

### I need to evolve an existing team

Start with [Shift an Existing Team](docs/02-playbooks/shift-existing-team.md). Pick one safe class of work, give a small group explicit permission to work differently, and expand only through earned trust.

## What this repo gives you

- **The Case** — why the economics and operating model of product delivery have changed.
- **The Operating Model** — how builders, agents, workflows, workpads, gates, evidence, and learning fit together.
- **Playbooks** — concrete procedures for experiments, greenfield projects, existing-team adoption, bug fixes, gates, browser proof, execution environments, and measuring real Change economics.
- **Reference material** — copyable templates for GitHub Issues, PRs, `WORKFLOW.md`, workpads, gates, skills, reviewer agents, and a dated model-cost calculator.

For the complete map, see [`docs/index.md`](docs/index.md).

## What this is not

This is not an argument that engineers, product managers, designers, QA, security, or operators no longer matter. Their judgment matters more. The work is to apply it at the layer where it creates the most leverage.

This is not permission for sloppy speed. Reliability, security, accessibility, architecture, and taste still matter. Move faster because the system is better, not because the standards are lower.

This is also not a finished methodology. It is a versioned operating thesis meant to meet reality. Use what works, challenge what does not, and feed the learning back into the system.

## Influences

The thinking is grounded in direct use and team experience, and sharpened by a few especially useful examples:

- [Geoffrey Huntley on the new economics of software development](https://ghuntley.com/real/) — a deliberately stark argument about falling software-production costs, lean model-first companies, and the organizational consequences of treating agents as a core capability.
- [How Gusto’s CTO uses Claude Code to ship like a startup](https://youtu.be/5FKBkUCaLa8) — small-team permission, working software as a decision artifact, cheap discardable exploration, and eval-first bug fixing.
- [Harness engineering](https://openai.com/index/harness-engineering/) — agent legibility, isolated environments, durable constraints, feedback loops, and human attention as the scarce resource.
- [Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/) — managing deliverables rather than agent sessions, using the issue tracker as a control plane, and putting workflow policy in the repo.
- [Codex ExecPlans](https://developers.openai.com/cookbook/articles/codex_exec_plans) — self-contained, living plans for complex multi-hour work.

Those examples do not prescribe one universal process. They reinforce the same underlying point: the capability is real, the operating model matters, and the only useful next step is to build, measure, and learn.
