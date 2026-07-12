# `WORKFLOW.md` and Workpads

Three artifacts answer three different questions:

- the **Change Intent** says what this work should achieve;
- **`WORKFLOW.md`** says how this repository handles work;
- the **workpad** says what is happening now.

An initiative record, when one exists, explains why the larger bet is worth considering and when its value will be revisited.

## Manage Changes, not sessions

An agent session is an implementation detail. The Change is the thing the team is responsible for.

That means an agent can stop, restart, compact context, switch models, or hand the work to another agent without losing the desired outcome or the state of the decision.

The system should make it easy to see which Changes are ready, running, proving, blocked, approaching a resource threshold, waiting for judgment, or resolved. It should not require a builder to supervise a row of terminal tabs and remember which one was doing something important.

That is not orchestration. It is a new kind of babysitting.

## `WORKFLOW.md`: the standing contract

`WORKFLOW.md` should answer the questions that recur across Changes:

- What states does work move through?
- What makes a Change ready?
- Where do agents record live state?
- Which gate profiles exist?
- What evidence is expected?
- How are failed gates and retries handled?
- Which resources are recorded, and what do thresholds do?
- When must a builder be engaged?
- What is required before a Change can resolve?
- How do Changes link to initiatives and later value reviews?

Keep it concrete enough to execute and short enough to follow.

If `WORKFLOW.md` becomes a novella, agents and humans will both skim it. The novella will then become the source of truth only during incidents, which is not a compliment.

## Workpads: the live surface

Every orchestrated Change should have one canonical workpad.

In the default GitHub implementation, it is a single persistent issue comment headed:

```md
## Agent Workpad
```

Update that comment in place. Do not scatter status across a sequence of progress comments, private chats, local notes, and a PR body that was last accurate three hours ago.

The workpad should contain only what another builder or agent needs to resume or judge the work:

- current status, run identity, branch, and environment;
- parent initiative when relevant;
- outcome or decision sought;
- current plan and checklist;
- gate and validation state;
- discoveries, blockers, and decisions;
- resource actuals, forecast, and threshold status when used;
- evidence links;
- proposed outcome and handoff;
- learning checkpoint.

Large artifacts and raw request events belong in CI, the run directory, or an observability store. Summarize and link.

## Update the forecast only when it matters

A forecast is useful when it can change a decision.

Update the workpad when discovery changes the expected work, spend approaches a threshold, a failed path changes the completion range, a different model or environment is needed, scope must narrow, or a builder authorizes more resource.

Record the cause and the decision, not merely the new number:

```text
Variance:
The existing permission layer cannot support the required boundary.

Options:
1. Continue current scope: $52–$65
2. Narrow scope: $37–$43
3. Stop and create a prerequisite Change

Decision:
Narrow scope; follow-up Change created.
```

## When no ticket exists

For local exploration, a file under `.agent/workpads/` is fine.

When a ticket exists, its persistent workpad comment is canonical. A local file may mirror it for tooling convenience, but it should not become a competing truth.

Even informal exploration should keep attribution and an explicit outcome when the spend or learning matters.

## The separation is deliberate

| Artifact | Holds |
| --- | --- |
| Initiative record | Value thesis, investment range, rollup, later reviews |
| Issue body | Stable Change Intent and original assumptions |
| `WORKFLOW.md` | Standing repository process |
| Workpad | Live plan, proof, forecast, decisions, handoff |
| Run records | Detailed provider, tool, environment, attempt, and human-attention data |
| PR, when one exists | Review package for work that may land or support a decision |
| Artifact store | Large evidence and raw logs |
| Change Record | Final outcome, actuals, and learning |

The split makes interruption, handoff, recovery, and later analysis possible without forcing one document to carry the entire history of software development.
