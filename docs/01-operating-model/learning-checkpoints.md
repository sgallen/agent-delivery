# Learning Checkpoints

Every meaningful Change should end with a lightweight question:

> Did this reveal anything that should make the next Change easier, safer, faster, or better?

Sometimes the answer is no.

That is fine. Not every typo fix needs a philosophy retreat.

When the answer is yes, the learning should not remain trapped in a chat, PR comment, or someone’s memory.

## Look for friction in five places

1. **Intent** — Was the Change underspecified or misleading?
2. **Context** — Did the agent lack product, design, architecture, or domain knowledge?
3. **Execution** — Was a tool, skill, environment, or workflow missing?
4. **Proof** — Were the gates or evidence too weak, expensive, or unclear?
5. **Engagement** — Was a builder pulled in too early, too late, or for the wrong reason?

## Possible outcomes

A learning checkpoint may produce:

- a better Change Intent template
- revised `WORKFLOW.md`
- a new or sharper gate
- a regression test
- design guidance or an example
- an architecture rule
- a reviewer prompt update
- a skill update
- better browser, log, or trace access
- a scheduled cleanup check
- a different builder-engagement policy for the Change class.

## Human-governed, agent-assisted

Agents can detect friction, suggest improvements, and open PRs to update docs, tests, gates, or skills.

Builders govern whether those improvements are directionally right.

The system may improve itself operationally. It does not govern itself.

## Keep it lightweight

The checkpoint should usually take minutes, not become a retrospective meeting with catering.

Record one of three outcomes:

```text
no reusable learning
learning promoted now
follow-up Change created
```

The compounding advantage does not come from one impressive agent run.

It comes from the system getting better after many ordinary Changes.
