# Reference: Workpad Template

The workpad is the live per-Change execution and decision surface. It is not a stream of agent narration.

The copyable starter lives at:

```text
templates/.agent/workpad-template.md
```

## Canonical location

For a GitHub-driven Change, use one persistent issue comment headed:

```md
## Agent Workpad
```

Update it in place. A local `.agent/workpads/<change>.md` may mirror the comment or serve as a fallback when no ticket exists.

## Required distinctions

The workpad should keep these separate:

```text
run status
Change lifecycle state
resolution status
resolution class
specific disposition
landed state
released state
```

A completed run is not a resolved Change. A resolved Change is not necessarily landed. A closed issue is not automatically an evidence-backed resolution.

## Minimum useful sections

- identity and current lifecycle state;
- resolution intent and decision question;
- landed and useful non-landed criteria;
- current plan and discoveries;
- resource forecast, actual to date, thresholds, and variance when measured;
- gate and validation state;
- run status and contribution;
- evidence links;
- candidate resolution class and disposition;
- handoff or final resolution;
- learning checkpoint.

## Non-landed work

When nothing is likely to land, the workpad should become a decision surface rather than an implementation diary. It should make clear:

- what question the work answered;
- what evidence supports the conclusion;
- what resource was consumed;
- what uncertainty changed;
- why the proposed resolution is `decision`, `administrative`, or `unresolved_loss`;
- what happens next.

Do not add a `productive_non_landing` checkbox. Productive non-landing is derived from a decision-class resolution with adequate evidence and accountable review.

## Resource checkpoints

At a soft threshold, update the forecast, explain the variance, and present options. At a hard threshold, preserve state and stop additional consumption until the named decision-maker responds.

The workpad should remain useful even when the decision is to stop.

## Copyable template

Use [`templates/.agent/workpad-template.md`](../../templates/.agent/workpad-template.md).
