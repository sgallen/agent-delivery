# Reference: Workpad Template

The workpad is the live state of one Change. It is not a diary of everything the agent thought.

The starter is [`templates/.agent/workpad-template.md`](../../templates/.agent/workpad-template.md).

## Canonical location

For GitHub-driven work, use one persistent Issue comment headed:

```md
## Agent Workpad
```

Update it in place. A local `.agent/workpads/<change>.md` may mirror the comment or serve as a fallback when no ticket exists.

## Core content

Keep the moving parts visible:

- state, run, branch, worktree, environment, and gate profile;
- the outcome or decision question;
- current plan and next action;
- material discoveries, blockers, and builder questions;
- gates and evidence;
- final handoff and learning.

The workpad should let another capable person or agent resume the Change without reconstructing a terminal session.

## Optional sections

Add these when the work requires them:

- parent initiative;
- run history;
- forecast, actual, and threshold state;
- formal resolution class and disposition;
- landing and release status;
- a detailed non-landed decision record.

A completed run is not a resolved Change. A resolved Change is not necessarily landed.

When nothing may land, make the workpad a decision surface: what question was answered, what evidence supports the conclusion, what remains uncertain, and what happens next.

Do not add a `productive_non_landing` checkbox. The record should earn that conclusion.
