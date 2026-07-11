# Evidence

Evidence is the new handoff.

Traditional workflows often rely on explanation: product explains the desired behavior, design explains the intent, engineering explains the implementation, QA explains the failure, and reviewers explain what remains.

Some explanation will always be necessary. But the system should make more of the outcome directly inspectable.

Evidence creates shared reality.

## Good evidence answers four questions

1. **Intent:** What was this Change supposed to accomplish?
2. **Outcome:** What now behaves differently?
3. **Quality:** Which required gates passed?
4. **Scope:** What did not change, and were the boundaries respected?

A builder should be able to inspect the Change and understand why the system believes it is ready without reconstructing the story from private chats.

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
- model, environment, retry, and builder-attention telemetry when economics are being measured.

## Minimum evidence by Change type

| Change type | Minimum useful evidence |
| --- | --- |
| Documentation | Link check, rendered preview when relevant, changed-file summary |
| Backend behavior | Targeted tests, relevant logs, API/contract proof, migration proof if applicable |
| UI behavior | Browser journey, screenshot or video, console check, targeted tests |
| Bug fix | Reproduction before, regression proof after, targeted test |
| Refactor | Behavior unchanged, tests green, architecture/scope evidence |
| Exploration | Working artifact or prototype, comparison notes, conclusion and next recommendation |

This is a starting point, not a compliance table for all of human history. Adapt it to the risk.

## Where evidence lives

Use the right surface for the right material:

```text
Issue body
  Stable intent and validation expectations.

Workpad
  Live status, concise gate summary, and evidence links.

PR body
  Review package and acceptance-criteria mapping.

CI / artifact store
  Screenshots, traces, videos, logs, reports, and raw gate output.
```

The workpad should summarize and link. It should not contain giant raw logs. Economics telemetry should live with the run artifacts and be linked from the Change when it informs a decision.

No one becomes wiser because a 2,000-line test log was pasted into a ticket comment. They become older.

## Evidence quality

Evidence should be:

- **relevant** — tied to the acceptance criteria and risk
- **specific** — clear about what passed and what was observed
- **repeatable** — reproducible by CI or another builder when possible
- **fresh** — produced from the current Change and environment
- **accessible** — linked from the workpad and PR
- **honest** — known gaps and uncertain results are visible.

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
