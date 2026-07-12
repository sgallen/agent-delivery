# WORKFLOW.md

This repository uses its own operating model while developing the playbook.

The outcome is not documentation volume. It is a coherent, useful package that helps capable readers see the shift and act on it.

## Before a Change

Read `README.md`, `VOICE.md`, `AGENTS.md`, and the pages or templates directly involved.

Then name:

- the reader and the confusion being addressed;
- the one job this Change should do;
- the concepts and files affected;
- the evidence that would show the edit improved the package;
- the practical consequence or next action the reader should receive;
- any credible reason the proposed edit should not land.

## Plan lightly

Use the smallest planning artifact that protects coherence.

- Small copy or link edit: a short checklist.
- Multi-file conceptual edit: a workpad and explicit plan.
- Deep reorganization or unsettled doctrine: an optional ExecPlan.

The plan should prevent drift, not justify ceremony.

## Keep one workpad

For orchestrated work, maintain one canonical workpad. In GitHub, use a single Issue comment headed:

```md
## Agent Workpad
```

For local-only work, `.agent/workpads/<id>.md` is acceptable.

The workpad should carry the plan, material discoveries, changed assumptions, evidence, resource status when measured, and final handoff. Do not turn it into a transcript.

## Edit for the reader

A good Change makes the package clearer, more engaging, or more actionable—not merely larger.

Check the full path:

- the README earns attention and gives a way in;
- The Case builds without avoidable repetition;
- operating-model pages explain the system without reading like schemas;
- playbooks provide concrete steps and a definition of done;
- reference pages and templates agree and remain copyable;
- voice matches `VOICE.md`;
- economics and resolution practices remain progressive rather than mandatory at maximum sophistication;
- useful non-landing remains distinct from administrative closure and unresolved loss.

When adding a factual or price claim, verify and cite it. Keep dated values in the reference data rather than evergreen doctrine.

## Evidence

For documentation Changes, useful proof includes:

- changed-file and word-count summaries;
- before-and-after excerpts for important prose;
- link and code-fence checks;
- YAML, JSON, CSV, shell, and Python validation;
- searches for outdated terms, paths, or repeated explanations;
- a review of the reader path from README to first action.

## Stop conditions

Stop and surface the issue when the requested edit conflicts with settled doctrine, required context is missing, terminology needs a larger decision, or a factual claim cannot be verified.

Do not keep writing merely because more text is possible.

## Resolution and learning

Before resolving, ask:

> Did this make the core idea easier to grasp, the next action easier to take, or the system easier to improve?

If not, narrow, revise, or do not land it.

End meaningful work by asking what should change in the voice rules, workflow, template, reference, or playbook so the next edit is better. Do not leave the lesson trapped in the chat.
