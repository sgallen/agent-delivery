# Why This Exists

I did not arrive at this playbook from a whiteboard.

I arrived here by using AI coding tools and agents, experimenting with orchestration, and watching my team adopt the tooling in real product work.

The experience was promising and messy in roughly equal measure.

I saw agents do work that would have been hard to imagine a short time earlier. They could investigate unfamiliar code, make meaningful changes, run tools, recover from failures, and move an idea much closer to reality before a person had invested days in it.

I also saw the predictable failure mode. When the tools were added to the existing process without changing the system around them, code volume rose faster than confidence. Some people pushed more work into the pipeline because the leverage was obvious. Quality-focused builders inherited the review burden. The same queues and handoffs remained, now with more material arriving at them.

That is not a reason to retreat from the capability. It is a reason to take the operating model seriously.

## The realization

The models changed. The economics changed with them.

Current agents can perform meaningful product development work. The cost of making an idea concrete, investigating a bug, trying an implementation, writing a test, or producing a reviewable artifact has fallen enough that old assumptions about scarce implementation capacity no longer hold in the same way.

Continuing to organize product work as though nothing fundamental changed may produce incremental gains. It will not capture the full advantage.

The question stopped being:

> Which steps in the current process can AI make faster?

It became:

> If agents are core participants in product development, how should the work, team, repository, quality system, resource flow, and human attention be organized—and how should the organization learn whether the resulting investment was worthwhile?

This playbook is an attempt to answer that question well enough to act on it.

## Experience first, sources second

Several resources helped put sharper language and concrete examples around what I was seeing.

The [Gusto Cofounder story](https://youtu.be/5FKBkUCaLa8) showed a small, empowered team using working software in place of prolonged abstract debate, throwing away code without treating that as failure, and letting people work beyond their traditional role boundaries.

OpenAI's [Harness Engineering](https://openai.com/index/harness-engineering/) work showed the other side of the same shift: when agents are doing sustained, consequential work, the environment has to become legible. Context, architecture, browser access, observability, skills, and quality constraints become part of the product-development system.

[Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/) moved the unit of management from an interactive coding session to the work itself. The issue tracker becomes a control plane, `WORKFLOW.md` carries the standing process, and agents can keep working through the lifecycle of a task without someone supervising a row of terminal tabs.

[ExecPlans](https://developers.openai.com/cookbook/articles/codex_exec_plans) showed how a self-contained, living document can sustain complex multi-hour work when a prompt and a short checklist are not enough.

Geoffrey Huntley’s [argument about the new economics of software development](https://ghuntley.com/real/) sharpened the stakes. If model-enabled companies can build and operate with meaningfully lower product-development costs, this is not only a better engineering workflow. It affects company design, margins, capital needs, and the pressure on incumbents. The essay is intentionally stark. I take the direction seriously without treating every forecast or headline number as settled fact.

These examples do not produce one tidy recipe. That is useful.

One team can move quickly with almost no formal artifacts because five people are working in a high-bandwidth room. Another needs deeply structured repository knowledge because agents are working asynchronously across a large codebase. The principle is not “always write more docs” or “throw out all process.” The principle is to keep the minimum structure that makes intent, execution, proof, resource use, recovery, and learning clear enough for the work at hand.

## The promise of this playbook

I do not want to explain this idea to a capable builder, have them nod, and leave them with nothing more useful than agreement.

The playbook needs to do two jobs:

1. make the current thinking clear enough to challenge; and
2. give the reader a concrete way to begin.

That is why it contains both a case and a set of operating playbooks. The case explains the shift. The playbooks turn it into a first experiment, a greenfield starting point, or a path for changing an existing team.

This is current thinking, not finished doctrine. Some of it will be wrong. The models will change. The tools will change. The team will learn things that are not obvious from a Markdown file.

That is not a weakness in the approach. It is the approach.

Start from a serious position. Run real Changes. Inspect the evidence. Improve the system.

---

[← The Case](index.md) · Next: [The Economics Changed](01-the-economics-changed.md) →
