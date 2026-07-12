# Reference: Workpad Template

The workpad is the live state of one Change. It is not a diary of everything the agent thought.

The starter is [`templates/.agent/workpad-template.md`](../../templates/.agent/workpad-template.md).

## Canonical location

For GitHub-driven work, use one persistent Issue comment headed:

```md
## Agent Workpad
```

Update it in place. A local `.agent/workpads/<change>.md` may mirror the comment or serve as a fallback when no ticket exists.

## What it should carry

Keep the moving parts visible:

- identity, state, run, branch, and environment;
- outcome or decision;
- current plan and next action;
- material discoveries, blockers, and builder questions;
- gates and evidence;
- resource status when measured;
- proposed resolution, landing, and release state;
- final handoff and learning.

A completed run is not a resolved Change. A resolved Change is not necessarily landed.

## When nothing may land

The workpad should become a decision surface. Make clear what question was answered, what evidence supports the conclusion, what uncertainty changed, what the work consumed, and what happens next.

Do not add a `productive_non_landing` checkbox. Productive non-landing is a conclusion supported by the record, not a label the run awards itself.

## Resource checkpoints

At a soft threshold, update the forecast, explain the variance, and present options. At a hard threshold, preserve state and wait for the named decision.

The workpad should remain useful even when the right answer is to stop.
