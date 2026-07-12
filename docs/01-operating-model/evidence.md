# Evidence

Evidence is the new handoff.

Traditional delivery often moves through explanation: product explains the need, design explains the intent, engineering explains the implementation, QA explains the failure, and reviewers explain what remains.

Some explanation will always matter. But the result should be directly inspectable wherever possible.

Evidence creates shared reality.

## What good evidence answers

A builder should be able to inspect the Change and answer:

1. **What was intended?**
2. **What now works differently, or what question was answered?**
3. **What proves it?**
4. **Were the boundaries respected?**
5. **What did the work consume, and did a material variance change the decision?**
6. **How did the Change resolve, and did anything land or release?**

The builder should not need to reconstruct the story from private chats or replay the entire agent session.

## Useful evidence

Depending on the Change, evidence may include targeted tests, a failing-before/passing-after reproduction, screenshots, short videos, browser traces, console and server-log summaries, API responses, accessibility snapshots, preview links, gate results, reviewer findings, scope summaries, resource actuals, and a concise variance explanation.

For an investigation or experiment, the evidence must answer the decision question. For an administrative closure, it must identify the external reason and accountable owner. For unresolved loss, it must preserve what is known, what was consumed, and why the work could not be resolved well.

## A practical minimum

| Change type | Minimum useful proof |
| --- | --- |
| Documentation | Link check, changed-file summary, rendered preview when useful |
| Backend behavior | Targeted tests, relevant logs, contract or migration proof |
| UI behavior | Browser journey, screenshot or video, console check, targeted tests |
| Bug fix | Reproduction before, regression proof after |
| Refactor | Tests green, behavior unchanged, scope and architecture boundaries respected |
| Exploration | Decision question, bounded evidence, conclusion, uncertainty reduced, next action |
| Administrative closure | Accountable owner, external basis, preserved state, resumption condition if any |
| Unresolved loss | Partial artifacts, resource record, unknowns, reason resolution failed, preventive follow-up |

This is a starting point, not a compliance table for all of human history. Match the proof to the risk.

## Put evidence in the right place

```text
Issue body       stable intent and expected proof
Workpad          live status, concise gate summary, links
PR, when useful  review package and criteria mapping
CI/artifact store screenshots, traces, videos, reports, raw logs
Run records      model, tool, environment, attempt, and data-quality detail
Initiative       value thesis, rollup, and later outcome reviews
```

The workpad should summarize and link. It should not contain giant raw logs or every request event.

No one becomes wiser because a 2,000-line test log was pasted into a ticket comment. They become older.

## Evidence quality

Good evidence is:

- **relevant** to the outcome, decision, and risk;
- **specific** about what passed and what was observed;
- **repeatable** by CI or another builder when possible;
- **fresh** from the current Change and environment;
- **accessible** from the workpad or review package;
- **honest** about gaps, estimates, missing usage, and attribution limits.

When the evidence will support later estimation, preserve the model, pricing snapshot, workflow version, and comparable cohort. Otherwise the numbers age into folklore.

## Make the product observable to agents

For UI and runtime work, expose the running product directly: app instance, browser access, DOM or accessibility snapshots, screenshots, console and network errors, server logs, traces, and metrics where relevant.

Agents should not depend on a human pasting screenshots or narrating a browser failure. Tools provide visibility. Skills teach the system how the team expects that visibility to be used.

## Match proof to the outcome

Delivered work needs proof that the intended behavior works and the artifact landed or released as recorded.

A non-landed decision needs evidence that supports the stop, rejection, narrowing, replacement, or deferral. An administrative closure needs an accountable external basis. Unresolved loss needs an honest record of what remains unknown.

Evidence makes non-landing reviewable. It does not make every non-landing valuable.
