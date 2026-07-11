# Reference: Change Intent Issue Template

Use this as the starting shape for a GitHub Issue.

The issue body holds stable intent. It should not become the live execution scratchpad.

```markdown
# Change Intent

## Outcome

What should be observably true after this Change?

## Why it matters

Customer, business, product, or technical context.

## Change type

Bug / feature / improvement / refactor / documentation / exploration.

## Current behavior or starting state

For a bug, describe the failure signal and how it can be observed. For another Change, describe the current state that should change.

## Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Non-goals

What is intentionally outside this Change?

## Forbidden changes

Which surfaces, behaviors, or additions must not be introduced?

## Affected surfaces

Routes, modules, packages, data, docs, or workflows likely involved.

## Validation expectations

What proof is required?

- failing-before / passing-after reproduction for bugs
- targeted tests
- browser route or journey
- screenshots or video
- logs or traces
- accessibility check
- design, architecture, or security review

## Risk

Low / medium / high, with consequences and reversibility notes.

## Gate profile

Example: `low-risk-ui`

## Builder engagement

Where is human judgment expected: intent shaping, evidence review, specialist decision, collaborative execution, or human-led work?

## References

Customer examples, designs, logs, related Changes, or prior decisions.
```

## Readiness rule

The issue is ready only when the outcome, boundaries, risk, gate profile, and proof expectations are clear enough for the system to begin without guessing at the product decision.

The better the Change Intent, the less the system has to infer.

Inference is useful. Accidental product strategy is less so.
