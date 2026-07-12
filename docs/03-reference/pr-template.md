# Reference: Pull Request Template

A pull request is a review package when an artifact may land or when a branch is useful decision evidence. It is not the terminal state of every Change.

The copyable template lives at:

```text
templates/.github/PULL_REQUEST_TEMPLATE.md
```

## Required distinctions

The PR should propose, not infer:

- resolution status;
- resolution class;
- specific disposition;
- landed state;
- released state;
- resolution quality.

A merged PR may still be unreleased. A closed PR may support a strong decision resolution. A closed PR without adequate evidence may remain unresolved loss.

## Delivered work

For a proposed `delivered` resolution, show:

- acceptance-criteria mapping;
- required gate results;
- behavior evidence;
- rollout and rollback;
- continuing obligations;
- complete Change resource use, including failed and recovery attempts.

## Non-landed work

For a proposed `decision` resolution, show:

- the decision question;
- evidence supporting the conclusion;
- why landing is not justified or not required;
- uncertainty reduced;
- alternatives considered;
- accountable decision owner;
- reusable artifacts and follow-up.

Implementation gates may fail or be not applicable when that result is itself part of the decision evidence. Decision and evidence gates still need to be validly resolved.

## Administrative and unresolved closure

An administrative closure should name the external reason, owner, effective date, and resumption condition without claiming work-derived learning. Unresolved loss should be labeled honestly and retain the resource record and recovery lesson.

## Resource summary

The PR should link to or summarize forecast, actual, thresholds, variance, attempt cost, builder attention, and data-quality limits. Do not make the path that landed look artificially cheap by omitting discarded runs.
