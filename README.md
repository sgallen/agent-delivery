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
- A Change is complete when it reaches an explicit, evidence-backed disposition. Code does not have to land for the work to be valuable.
- Distinguish productive non-landing from unresolved loss; do not hide either behind a merge rate or a learning story.
- Work-derived resolutions should improve the product or the decision. Administrative closure and unresolved loss should still make the record and the next planning decision more honest; they are not equivalent outcomes.
- Make resource use observable at the Change: human attention, models, tools, environments, retries, elapsed time, disposition, and outcome.
- Treat major initiatives as investment hypotheses. Compare expected value and resource use with actual delivery and realized value.
- Use the history to improve estimates, route work, govern budgets, find capacity constraints, and decide where the next dollar or human hour should go.
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

The meaningful comparison is not agent versus employee. It is whether the complete delivery system can turn human judgment, machine intelligence, infrastructure, and capital into trustworthy outcomes with less waste and better learning.

At the Change level, use a small metric set rather than one flattering ratio: **cost per trustworthy landed Change** for delivery work, **cost per evidence-backed decision** for exploratory work, **resolution yield** across all work that entered execution, and spend by resolution class so productive non-landing and unresolved loss remain visible. At the initiative level, the system should also ask whether released capability—or the evidence-backed decision not to continue—created enough customer, business, operational, strategic, or decision value to justify the investment.

That makes economics part of the operating model rather than a provider bill reviewed after the fact. Estimates can become ranges, thresholds can become governed pause points, actuals can improve routing and forecasting, and portfolio planning can expose whether product shaping, review, infrastructure, or agent budget is the real constraint.

See [The Cost Curve Made Concrete](docs/00-the-case/02-the-cost-curve-made-concrete.md) for the dated assumptions, [Resource Observability and Delivery Economics](docs/01-operating-model/resource-observability-and-delivery-economics.md) for the operating principle, and [Model Economics](docs/03-reference/model-economics.md) for the benchmark derivation, living price table, and calculator.

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
  + optional resource forecast and initiative link
  → one persistent workpad
  → isolated worktree and execution environment
  → agent implementation, investigation, or experiment
  → gates, evidence, and resource checkpoints
  → builder decision, with a PR when something may land
  → delivered resolution, evidence-backed non-landing, or unresolved loss
  → Change Record with actuals, disposition, and landing status
  → initiative rollup and learning checkpoint
  → later outcome review when the Change serves a larger initiative
```

The core pieces are:

- **Builders** — the humans responsible for outcomes, judgment, taste, risk, and improving the system.
- **Changes** — units of product work that carry intent, execution state, evidence, resource use, explicit disposition, and learning.
- **`WORKFLOW.md`** — the standing operating contract for how work moves through a repository.
- **Workpads** — the live per-Change plan, checklist, validation state, blockers, and evidence links.
- **Gates** — mechanical, behavioral, and judgment checks that make quality durable.
- **Evidence** — tests, screenshots, logs, traces, reviews, and other proof that the outcome is real.
- **Skills** — reusable procedures that encode how the team wants agents to perform important steps.
- **Resource observability** — attribution of human, agent, infrastructure, time, and failure cost to the Change and outcome that caused it.
- **Initiatives** — product investment hypotheses that group Changes, forecast the landing and non-landing funnel, preserve expected value and investment, and later compare them with realized or decision value.
- **Learning checkpoints** — the mechanism for turning repeated corrections and estimate variance into better docs, gates, tests, skills, routing, forecasts, and workflows.

The machinery exists to focus human judgment, not bury it under a new layer of ceremony. Start with attribution. Add estimates, budgets, capacity planning, and learned routing only when the data and decisions have earned the extra structure.

## The system should learn from delivery

Every resolved effort—and every honestly recorded unresolved loss—should improve the organization’s ability to estimate and decide about the next one.

```text
Run and disposition data
  → better Change cost, resolution, and routing estimates
  → better initiative forecasts and capacity plans
  → better product and capital-allocation decisions
```

This is not a promise that software can be estimated with perfect precision. It is a commitment to preserve the original forecast, the actual resource use, the outcome, the uncertainty, and the lesson instead of repeatedly estimating from memory.

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

### I need to conclude work that should not land

Use [Resolve a Change That Does Not Land](docs/02-playbooks/resolve-a-change-that-does-not-land.md) to preserve the evidence, resource use, decision, and learning without pretending every stopped branch was valuable.

### I want to plan a major product investment

Use [Forecast and Review an Initiative](docs/02-playbooks/forecast-and-review-an-initiative.md) to preserve the value hypothesis, staged investment and Change-funnel forecasts, actual delivery dispositions, and later value or decision-value reviews. Pair it with [Plan Delivery Capacity](docs/02-playbooks/plan-delivery-capacity.md) before assuming that more agent budget will translate into more trustworthy outcomes.

## What this repo gives you

- **The Case** — why the economics and operating model of product delivery have changed.
- **The Operating Model** — how builders, agents, workflows, workpads, gates, evidence, resource use, initiatives, and learning fit together.
- **Playbooks** — concrete procedures for experiments, greenfield projects, existing-team adoption, bug fixes, gates, browser proof, execution environments, delivery economics, initiative forecasting, and capacity planning.
- **Reference material** — copyable templates for GitHub Issues, PRs, `WORKFLOW.md`, workpads, resource records, initiatives, gates, skills, reviewer agents, and a dated model-cost calculator.

For the complete map, see [`docs/index.md`](docs/index.md).

## What this is not

This is not an argument that engineers, product managers, designers, QA, security, or operators no longer matter. Their judgment matters more. The work is to apply it at the layer where it creates the most leverage.

This is not permission for sloppy speed. Reliability, security, accessibility, architecture, and taste still matter. Move faster because the system is better, not because the standards are lower.

Resource telemetry is not permission to collapse people into utilization numbers, label every abandoned branch “learning,” or pretend value attribution is cleaner than it is. Measure capability mix and system behavior to improve decisions. Preserve ranges, confidence, missing-data flags, explicit dispositions, and the distinctions among delivery efficiency, resolution quality, and product success.

This is also not a finished methodology. It is a versioned operating thesis meant to meet reality. Use what works, challenge what does not, and feed the learning back into the system.

## Influences

The thinking is grounded in direct use and team experience, and sharpened by a few especially useful examples:

- [Geoffrey Huntley on the new economics of software development](https://ghuntley.com/real/) — a deliberately stark argument about falling software-production costs, lean model-first companies, and the organizational consequences of treating agents as a core capability.
- [How Gusto’s CTO uses Claude Code to ship like a startup](https://youtu.be/5FKBkUCaLa8) — small-team permission, working software as a decision artifact, cheap discardable exploration, and eval-first bug fixing.
- [Harness engineering](https://openai.com/index/harness-engineering/) — agent legibility, isolated environments, durable constraints, feedback loops, and human attention as the scarce resource.
- [Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/) — managing deliverables rather than agent sessions, using the issue tracker as a control plane, and putting workflow policy in the repo.
- [Codex ExecPlans](https://developers.openai.com/cookbook/articles/codex_exec_plans) — self-contained, living plans for complex multi-hour work.

Those examples do not prescribe one universal process. They reinforce the same underlying point: the capability is real, the operating model matters, and the only useful next step is to build, measure, and learn.
