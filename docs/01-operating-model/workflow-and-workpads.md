# `WORKFLOW.md` and Workpads

`WORKFLOW.md` and the workpad solve different problems.

The ticket says what this Change should achieve.

`WORKFLOW.md` says how this repository handles work.

The workpad says what is happening right now.

An initiative record, when one exists, says why the larger investment was worth considering and how its value will be revisited.

## Manage Changes, not agent sessions

A coding session is an implementation detail. The Change is the unit that matters.

This is one of the useful shifts in [Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/): the issue tracker becomes the control plane, and the orchestrator is responsible for keeping eligible work moving. An agent can stop, restart, compact context, change models, or hand work to another agent without changing the desired outcome.

The system should answer:

- Which Changes are ready?
- Which are actively progressing?
- Which are proving their outcome?
- Which are approaching or beyond a resource threshold?
- Which are blocked, and why?
- Which need builder judgment?
- Which are ready for a decision?
- Which are resolved as delivered, decision, administrative, or unresolved loss?
- Which initiatives are consuming more or creating less value than forecast?

It should not require a builder to supervise a row of terminal tabs and remember which one was doing something important. That is not orchestration. It is a new kind of babysitting.

## `WORKFLOW.md`

`WORKFLOW.md` is the standing operating contract for the repository. It should answer:

- What lifecycle states does a Change move through?
- What makes a Change ready?
- Where must agents record progress?
- Which gate profiles exist?
- What evidence is expected by Change type?
- How should failed gates be handled?
- Which resource use is captured?
- Which default warnings, soft limits, hard limits, or approval rules apply?
- What must happen before a run pauses for resource reasons?
- When should a builder be engaged?
- When is work ready for a decision, and what permits each resolution class?
- How are landing and release recorded separately?
- What should happen at the learning checkpoint?
- How do Changes link to initiatives when the repository uses them?

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
- the initiative record
- the PR body
- a private chat transcript
- a thread of progress comments
- an ephemeral local scratch file
- a dumping ground for raw logs or request events.

It should contain the live state a builder or another agent needs to resume or review the work:

- current status, run identity, and environment
- parent initiative, when any
- resolution intent, decision question, and expected resolution
- plan and checklist
- mirrored delivered and non-landed resolution criteria
- validation and gate state
- discoveries and decisions that affect execution
- blockers and builder questions
- resource estimate, actual to date, completion forecast, and threshold status when used
- evidence links
- candidate resolution class and disposition, landing, release, quality, and learning value
- handoff summary
- learning checkpoint.

Large artifacts and raw usage events belong in CI, the run directory, or an observability store. The workpad should summarize and link.

## Resource updates belong with execution state

A forecast is useful only when it can change a decision.

Update the workpad when:

- discovery materially changes the expected work
- spend or builder attention approaches a threshold
- a failed approach changes the completion forecast
- the required model, reviewer, or environment class changes
- scope must be narrowed or a prerequisite Change created
- a builder authorizes more resource.

Record the cause and decision, not merely the new number.

```text
Variance:
The existing permission abstraction cannot support the required boundary.

Options:
1. Continue current scope: $52–$65
2. Narrow scope: $37–$43
3. Stop and create a prerequisite Change

Decision:
Narrow scope; follow-up Change created.
```

## When no ticket exists

For local exploration, a file under `.agent/workpads/` is acceptable.

When a ticket exists, the persistent ticket comment is the canonical workpad. A local file may mirror it for tooling convenience, but it should not become a conflicting source of truth.

Exploration should still preserve run attribution and an explicit resolution when the economics or learning matter. Administrative stops and unresolved losses should remain distinct from work-derived decisions.

## Why this matters

Traditional work often scatters truth across tickets, chat, design files, branches, provider dashboards, and people’s memories.

The split is deliberate:

| Artifact | Holds |
| --- | --- |
| Initiative record | Value hypothesis, investment forecast, rollup, and later value reviews |
| Issue body | Stable Change Intent and original resource posture |
| `WORKFLOW.md` | Standing repo process and resource policy |
| Workpad | Live plan, proof, forecast, threshold status, and handoff |
| Run records | Detailed provider, tool, environment, attempt, and builder-attention data |
| PR, when one exists | Review package for a delivered or decision proposal |
| Artifact store | Large evidence and raw logs |
| Resolution record | Status, class, disposition, landing, release, evidence, actuals, and follow-up |
| Learning checkpoint | What should improve next |

That separation makes interruption, handoff, recovery, and later analysis possible without making one document carry the entire history of software development.
