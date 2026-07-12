# Agent Instructions

This repository is a Markdown-first playbook for human-governed, agent-enabled product delivery.

It is not a generic AI tooling guide. It is an operating doctrine and a set of practical playbooks for turning customer intent into evidence-backed product change.

## Read first

Before making substantive edits, read:

1. `README.md`
2. `VOICE.md`
3. `docs/00-the-case/00-why-this-exists.md`
4. `docs/00-the-case/index.md`
5. `docs/00-the-case/06-invert-the-default.md`
6. `docs/01-operating-model/index.md`
7. `docs/01-operating-model/resource-observability-and-delivery-economics.md`
8. `docs/01-operating-model/initiatives-and-value.md` when the Change touches product investment or value realization
9. the pages directly related to the requested Change

For implementation-oriented edits, also read:

- `docs/02-playbooks/first-experiment.md`
- `docs/02-playbooks/fix-a-bug-with-proof.md` for bug-workflow edits
- `docs/02-playbooks/run-a-change-with-github.md`
- `docs/02-playbooks/first-30-days.md` when changing adoption guidance
- the relevant reference and template files

## Preserve the voice

The tone is thoughtful, direct, grounded, and human.

Do not make the docs sound like:

- venture hype
- academic prose
- process theater
- a vendor whitepaper
- a cult pamphlet with Markdown headings.

The intended reader is a serious builder: a founder, CTO, senior or staff engineer, product leader, designer, or operator who has lived through real delivery friction.

They should feel respected, better oriented, and able to act.

## Core doctrine

Keep these ideas intact:

- The thesis comes from direct use and team adoption, not tool hype.
- Current agents can perform meaningful product development work.
- Future model improvement is upside, not a dependency.
- The bottleneck is shifting from implementation capacity to builder attention.
- The goal is not maximum autonomy. It is maximum leverage from human judgment.
- Builders govern intent, risk, taste, accountability, and the operating model.
- Agents execute inside a harness and repo-defined workflow.
- Gates make quality durable.
- Evidence makes outcomes reviewable.
- `WORKFLOW.md` is the standing repo process.
- The workpad is the live per-Change execution surface.
- ExecPlans are optional, durable artifacts for complex work.
- A Change is complete when it reaches an explicit, evidence-backed disposition; landing and release are separate facts.
- Productive non-landing must be distinguished from accountable administrative closure and unresolved loss.
- Work-derived resolutions should improve the product or the decision. Administrative closure and unresolved loss should still improve the record and future planning; do not present them as equivalent outcomes.
- A Change is both a unit of execution and resolution and a natural unit of resource attribution.
- Resource use includes builder attention, agent and tool usage, execution infrastructure, elapsed time, retries, and failed attempts.
- Major initiatives are investment hypotheses. Preserve expected value and investment, actual delivery, realized value, and uncertainty.
- Optimize the complete system for trustworthy resolution and worthwhile outcomes—not tokens, generated code, merge rate, raw autonomy, or one input cost in isolation.
- Every resolved effort, and every honestly recorded unresolved loss, should improve the organization’s ability to estimate, route, govern, or decide about the next one.

## Editing rules

- Lead with why the idea matters, then explain the mechanism and the practical consequence.
- Prefer clarity over cleverness and concrete language over buzzwords.
- Keep paragraphs short and bullets natural.
- Avoid repeating the same thesis across adjacent pages unless the repetition adds a new consequence.
- Do not imply that engineers, PMs, designers, QA, security, or operations are obsolete.
- Do not imply quality standards are lower because agents are involved.
- Explain concepts before naming them.
- Add examples when they help a reader apply the idea. Distinguish the author’s experience from external examples and current inference.
- Major claims should answer “so what should the reader do differently?”
- Keep volatile model prices out of evergreen doctrine. Date them, cite official sources, expose assumptions, and update `data/model-pricing.csv`.
- Never imply that agent and employee costs represent equivalent productive capacity.
- Keep the canonical employer-cost benchmark in `docs/03-reference/model-economics.md` and `data/economics-scenarios.csv`; other pages should link to it rather than invent a separate salary figure.
- Call it an employer-cost benchmark, not a universal senior-engineer cost.
- Use ranges, confidence, assumptions, data-quality notes, and forecast stages. Do not manufacture precision from sparse delivery history.
- Keep human time and any monetary conversion separate. Prefer capability and team-level patterns over simplistic individual ranking or covert performance surveillance.
- Distinguish delivery variance, resolution variance, and value variance. Efficient delivery does not prove the initiative was worth doing, and non-landing is neither automatically failure nor automatically learning.
- End playbooks with a clear definition of done.
- Keep reference files copyable and terse.

## Section expectations

- `README.md` should earn attention, establish the thesis quickly, and give the reader a clear next step.
- `docs/00-the-case/` should build the argument in a coherent sequence.
- `docs/01-operating-model/` should define the system clearly enough to reason with and adapt.
- `docs/02-playbooks/` should specify inputs, steps, evidence, and completion criteria.
- `docs/03-reference/` should provide practical starting points.
- `templates/` should remain internally consistent and implementation-ready.

## Quality checks

Before completing an edit, verify:

- the core idea is easier to understand
- the page gives the reader insight, a principle, or an action
- terms, lifecycle states, dispositions, and landing/release flags are consistent
- links resolve
- ExecPlan and workpad locations are consistent
- templates match the doctrine
- Change, Run, Initiative, and Portfolio levels remain distinct
- resource observability is staged rather than made mandatory at maximum sophistication
- no unnecessary process, false precision, or buzzword was introduced.

## The test

A senior or staff engineer should be able to read the README, nod at the problem, understand the proposed shift, and know what to try next—even if they disagree with parts of the conclusion.
