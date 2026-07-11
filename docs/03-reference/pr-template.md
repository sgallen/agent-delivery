# Reference: Pull Request Template

```markdown
## Change

Fixes #<issue-number>
Workpad: <link>
ExecPlan, if used: <link>

## Outcome

What is now observably different?

## Acceptance criteria

| Criterion | Status | Evidence |
| --- | --- | --- |
| Criterion 1 | pass | link |
| Criterion 2 | pass | link |

## Scope

Expected surfaces changed:

Unexpected surfaces changed: none / explain

Non-goals and forbidden changes confirmed:

## Gates

| Gate | Status | Evidence |
| --- | --- | --- |
| Scope |  |  |
| Lint / typecheck / build |  |  |
| Targeted tests |  |  |
| Behavior proof |  |  |
| Browser / runtime check |  |  |
| Reviewer agents |  |  |

## Evidence

Screenshots, traces, logs, videos, preview links, reports, or other proof.

## Risks and gaps

Known tradeoffs, uncertainty, or follow-up work.

## Required builder judgment

What, if anything, still needs a human decision?

## Learning checkpoint

- [ ] No reusable learning
- [ ] System improvement included in this Change
- [ ] Follow-up Change created: <link>
```

## Rule

The PR is a review package, not a mystery novel.

A builder should be able to understand the outcome, proof, scope, and remaining judgment without reconstructing the implementation history.
