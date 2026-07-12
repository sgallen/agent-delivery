# WORKFLOW.md

This repository uses its own operating model while developing the playbook.

The goal is not documentation volume. The goal is a coherent, useful artifact that helps readers understand the shift and act on it.

## Before starting a Change

Read:

1. `README.md`
2. `VOICE.md`
3. `docs/00-the-case/00-why-this-exists.md`
4. `AGENTS.md`
5. the pages and templates directly related to the requested Change

Then identify:

- the intended reader
- the confusion or need being addressed
- the concepts touched
- the files likely to change
- the evidence that the edit improved the repo or supported a decision not to make the proposed edit
- whether the Change affects Run, Change, Initiative, or Portfolio concepts
- the expected disposition and what would justify resolving without landing the proposed edit
- the concrete “so what” or next action the reader should receive.

## Planning posture

Use the lightest planning artifact that keeps the work coherent.

- Small copy or link edit: short checklist.
- Multi-file conceptual edit: workpad plus explicit plan.
- Deep reorganization or ambiguous doctrine Change: optional ExecPlan.

The plan should protect coherence, not justify ceremony.

## Workpad expectation

Every orchestrated Change should maintain one workpad.

In the default GitHub implementation, it is a single persistent issue comment headed:

```md
## Agent Workpad
```

For local-only work, a temporary file under `.agent/workpads/` is acceptable. When a ticket exists, the ticket comment is canonical.

## Quality bar

A good Change should make the repo clearer, more useful, or more actionable—not merely larger.

Before proposing resolution, check:

- the README still earns attention, reflects the lived origin of the thesis, and provides a clear path into action
- The Case builds logically without avoidable repetition
- operating-model pages answer “how does this work?”
- playbooks provide concrete steps and definitions of done
- reference files and templates agree with one another
- voice matches `VOICE.md`
- lifecycle states, resolution classes, dispositions, landing status, and artifact locations are consistent
- productive non-landing is distinguished from unresolved loss
- internal links resolve
- claims are grounded in direct experience, cited references, or clearly presented as the author’s current thesis
- volatile price claims are dated, sourced from providers, and consistent with `data/model-pricing.csv`
- resource use, estimates, gates, and value reviews remain proportionate to maturity and decision need
- non-landed work is distinguished from unresolved loss and supported by evidence when called productive;
- the edit does not add process that fails to improve intent, execution, proof, resource visibility, resolution, recovery, or learning.

## Evidence for documentation Changes

Useful evidence includes:

- changed-file list
- before/after excerpts for important prose
- link-check output
- search results for outdated terms or paths
- table-of-contents review
- notes on remaining open questions.

## Stop conditions

Stop and surface the issue when:

- a requested edit conflicts with settled doctrine
- terminology cannot be made consistent without a larger decision
- the source package is missing required context
- a factual claim requires verification that is not available
- a broad rewrite would reduce usefulness without a clear replacement.

## Learning checkpoint

End every meaningful resolved Change—and every explicit abandonment review—by asking:

> Did this reveal anything that should make the next Change easier, safer, faster, less wasteful, easier to estimate, more likely to resolve cleanly, or more likely to create value?

If yes, update a voice rule, workflow, template, reference, or playbook. Do not leave the lesson trapped in the chat.
