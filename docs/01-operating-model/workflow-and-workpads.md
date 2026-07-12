# `WORKFLOW.md` and Workpads

Three artifacts answer three different questions:

- the **Change Intent** says what this work should achieve;
- **`WORKFLOW.md`** says how this repository handles work;
- the **workpad** says what is happening now.

Keeping those questions separate makes the work easier to start, interrupt, resume, review, and improve.

## Manage Changes, not sessions

An agent session is an implementation detail. The Change is the thing the team is responsible for.

A session may stop, restart, compact context, switch models, or hand the work to another agent. The desired outcome, current state, evidence, and next decision should survive all of that.

The system should make it easy to see which Changes are ready, running, proving, blocked, waiting for judgment, or resolved. It should not require a builder to supervise a row of terminal tabs and remember which one was doing something important.

That is not orchestration. It is a new kind of babysitting.

## `WORKFLOW.md`: the standing contract

`WORKFLOW.md` should answer the questions that recur across Changes:

- What makes a Change ready?
- What states does work move through?
- Where is live state recorded?
- How is an execution environment created and identified?
- Which gates apply, and what evidence do they produce?
- What happens after a failed check?
- When should the agent continue, stop, or ask for judgment?
- What is required before the work can resolve?
- What learning should be preserved?

Keep it concrete enough to execute and short enough to follow.

If `WORKFLOW.md` becomes a novella, agents and humans will both skim it. The novella will then become the source of truth only during incidents, which is not a compliment.

## Workpads: the live surface

Every orchestrated Change should have one canonical workpad.

In the default GitHub implementation, it is a single persistent issue comment headed:

```md
## Agent Workpad
```

Update that comment in place. Do not scatter status across progress comments, private chats, local notes, and a PR body that was last accurate three hours ago.

A useful workpad contains only what another builder or agent needs to resume or judge the work:

- current state, run identity, branch, and environment;
- the outcome or decision sought;
- the current plan;
- discoveries, blockers, and material decisions;
- gate and validation state;
- evidence links;
- the proposed outcome and handoff;
- one learning checkpoint.

Large artifacts and raw logs belong in CI, the run directory, or an artifact store. Summarize and link. The workpad is a control surface, not a landfill.

## Add mature fields only when they help

Some teams will later add a parent initiative, resource forecast, threshold state, model route, or formal resolution fields. Put those in the workpad when they affect the next decision—not because a template happens to have room.

A forecast deserves an update when new evidence changes the expected path, remaining effort, risk, or authorized spend. Record the reason and the choice, not just the new number.

## When no ticket exists

For local exploration, a file under `.agent/workpads/` is fine.

When a ticket exists, its persistent workpad comment is canonical. A local file may mirror it for tooling convenience, but it should not become a competing truth.

Even informal exploration should end with a clear statement of what was tried, what was learned, and what happens next when the work matters enough to preserve.

## The separation is deliberate

| Artifact | Holds |
| --- | --- |
| Issue body | Stable Change Intent and original assumptions |
| `WORKFLOW.md` | Standing repository process |
| Workpad | Live plan, state, proof, decisions, and handoff |
| Branch and environment | The work and the runtime needed to observe it |
| PR, when one exists | A review package for work or evidence |
| Artifact store | Large evidence and raw logs |
| Change Record | Final outcome and learning |

Initiative records and detailed run or resource records can join this set when the team needs them. They should not make the basic path harder to understand.
