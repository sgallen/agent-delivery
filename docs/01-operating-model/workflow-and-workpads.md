# `WORKFLOW.md` and Workpads

`WORKFLOW.md` and the workpad solve different problems.

The ticket says what this Change should achieve.

`WORKFLOW.md` says how this repository handles work.

The workpad says what is happening right now.

## Manage Changes, not agent sessions

A coding session is an implementation detail. The Change is the unit that matters.

This is one of the useful shifts in [Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/): the issue tracker becomes the control plane, and the orchestrator is responsible for keeping eligible work moving. An agent can stop, restart, compact context, or hand work to another agent without changing the desired outcome.

The system should answer:

- Which Changes are ready?
- Which are actively progressing?
- Which are proving their outcome?
- Which are blocked, and why?
- Which need builder judgment?
- Which are complete?

It should not require a builder to supervise a row of terminal tabs and remember which one was doing something important. That is not orchestration. It is a new kind of babysitting.

## `WORKFLOW.md`

`WORKFLOW.md` is the standing operating contract for the repository. It should answer:

- What lifecycle states does a Change move through?
- What makes a Change ready?
- Where must agents record progress?
- Which gate profiles exist?
- What evidence is expected by Change type?
- How should failed gates be handled?
- When should a builder be engaged?
- When is work ready for review or release?
- What should happen at the learning checkpoint?

Keep it concrete enough to execute and short enough to follow.

If `WORKFLOW.md` becomes a novella, agents and humans will both skim it. The novella will then become the real source of truth only during incidents, which is not a compliment.

## Workpads

Every orchestrated Change should have exactly one workpad.

In the default GitHub implementation, the workpad is a single persistent issue comment headed:

```md
## Agent Workpad
```

The agent finds or creates that comment and updates it in place throughout the Change.

The workpad is not:

- the issue body
- the PR body
- a private chat transcript
- a thread of progress comments
- an ephemeral local scratch file
- a dumping ground for raw logs.

It should contain the live state a builder or another agent needs to resume or review the work:

- current status and environment
- plan and checklist
- mirrored acceptance criteria
- validation and gate state
- discoveries and decisions that affect execution
- blockers and questions
- evidence links
- handoff summary.

Large artifacts belong in CI or an artifact store. The workpad should summarize and link.

## When no ticket exists

For local exploration, a file under `.agent/workpads/` is acceptable.

When a ticket exists, the persistent ticket comment is the canonical workpad. A local file may mirror it for tooling convenience, but it should not become a conflicting source of truth.

## Why this matters

Traditional work often scatters truth across tickets, Slack, Figma, PR comments, CI, meetings, and memory.

That was painful with humans. It is worse with agents because resumability and handoff depend on explicit state.

A good workpad makes the Change inspectable and recoverable. A builder should be able to open the issue and understand where the work stands without asking the original agent to reconstruct its afternoon.

## Practical split

```text
Issue body      = stable intent
WORKFLOW.md     = repo-level process
Workpad comment = live execution state
PR body         = review package
Artifact store  = large evidence
```
