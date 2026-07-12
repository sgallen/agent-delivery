# Evidence

Evidence is the new handoff.

Traditional workflows often rely on explanation: product explains the desired behavior, design explains the intent, engineering explains the implementation, QA explains the failure, and reviewers explain what remains.

Some explanation will always be necessary. But the system should make more of the outcome directly inspectable.

Evidence creates shared reality.

## Good evidence answers six questions

1. **Intent:** What was this Change supposed to accomplish?
2. **Outcome or decision:** What now behaves differently, or which question was answered?
3. **Quality:** Which required gates passed, failed, or became not applicable—and what do those results prove?
4. **Scope:** What did not change, and were the boundaries respected?
5. **Resources:** What did the Change consume, how complete is the record, and did variance change a decision?
6. **Resolution:** What class and disposition were selected, did anything land or release, and why is that conclusion justified?

A builder should be able to inspect the Change and understand why the system believes it is ready for a decision or adequately resolved without reconstructing the story from private chats.

## Evidence examples

Useful evidence may include:

- targeted test results
- screenshots and visual comparisons
- short videos for interaction-heavy behavior
- browser traces
- console and server-log summaries
- API responses or contract checks
- accessibility snapshots
- deployment or preview links
- reviewer-agent findings
- gate summaries
- diff and scope summaries
- model, tool, environment, retry, elapsed-time, and builder-attention telemetry
- original estimate, latest forecast, actual, threshold decisions, and variance explanation when economics are being measured
- resolution status, class, disposition, landing and release state, resolution quality, and learning value
- initiative link and later value or decision-value evidence when the Change serves a larger product bet.

## Minimum evidence by Change type

| Change type | Minimum useful evidence |
| --- | --- |
| Documentation | Link check, rendered preview when relevant, changed-file summary |
| Backend behavior | Targeted tests, relevant logs, API/contract proof, migration proof if applicable |
| UI behavior | Browser journey, screenshot or video, console check, targeted tests |
| Bug fix | Reproduction before, regression proof after, targeted test |
| Refactor | Behavior unchanged, tests green, architecture/scope evidence |
| Exploration or investigation | Working artifact or prototype when useful, bounded comparison or research evidence, decision question, conclusion, uncertainty reduced, and next recommendation |
| Administrative closure after execution | Accountable owner, external basis, date, effect on linked work, preserved state, and resumption condition when one exists |
| Unresolved loss | Preserved partial artifacts and resource record, explicit reason resolution failed, unknowns, ownership gap, and preventive follow-up |

This is a starting point, not a compliance table for all of human history. Adapt it to the risk.

## Where evidence lives

Use the right surface for the right material:

```text
Issue body
  Stable intent and validation expectations.

Workpad
  Live status, concise gate summary, and evidence links.

PR body, when one exists
  Review package and delivered or decision-criteria mapping.

CI / artifact store
  Screenshots, traces, videos, logs, reports, and raw gate output.

Run resource store
  Provider usage, environment events, attempts, builder-attention records, and data-quality flags.

Initiative record
  Value hypothesis, resolution funnel, investment rollup, delivery and resolution variance, and later value or decision-value reviews.
```

The workpad should summarize and link. It should not contain giant raw logs or every model request. Resource telemetry should live with the run artifacts or observability store and be linked from the Change when it informs a decision.

No one becomes wiser because a 2,000-line test log was pasted into a ticket comment. They become older.

## Evidence quality

Evidence should be:

- **relevant** — tied to the delivered or non-landed resolution criteria and risk
- **specific** — clear about what passed and what was observed
- **repeatable** — reproducible by CI or another builder when possible
- **fresh** — produced from the current Change and environment
- **accessible** — linked from the workpad and PR
- **honest** — known gaps, estimated values, missing usage, attribution limits, and uncertain results are visible
- **comparable** — the model, pricing snapshot, workflow version, and cohort are preserved when the evidence will support later estimation.

## Make the product observable to agents

For UI and runtime work, the harness should expose the running product directly:

- app instance
- browser access
- DOM or accessibility snapshots
- screenshots
- console and network errors
- server logs
- traces and metrics when relevant.

Agents should not need humans to paste screenshots or narrate browser failures. Tools provide visibility. Skills teach the agent how the team expects that visibility to be used.


## Match evidence to the resolution class

Do not ask every Change to prove the same thing.

- A `delivered` resolution needs evidence that the intended behavior works, quality is acceptable, and the artifact landed or released as recorded.
- A `decision` resolution needs work-derived evidence that supports the stop, reject, narrow, replace, defer, or supersede decision.
- An `administrative` resolution needs an accountable external basis and must state which product or technical questions remain unanswered.
- An `unresolved_loss` record preserves what is known, what was consumed, why resolution failed, and what should prevent recurrence.

Evidence makes non-landing reviewable. It does not make every non-landing valuable.
