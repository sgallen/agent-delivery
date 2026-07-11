# Reviewer Agents

Reviewer agents are narrow, independent judges.

The implementation agent should self-review. It should not be the only party grading its own work.

## Why they matter

Agent-enabled delivery can increase output faster than human review capacity.

Without gates and reviewer agents, quality-focused builders become the cleanup crew. They get buried under diffs, comments, and the vague dread that nobody else has looked closely.

Reviewer agents can inspect specific concerns before scarce human attention is engaged.

## Good reviewer agents are narrow

Useful roles include:

- scope reviewer
- code reviewer
- architecture reviewer
- design reviewer
- security reviewer
- test sufficiency reviewer
- regression reviewer.

Each reviewer should have:

- a single clear concern
- fresh context rather than the implementation agent’s private reasoning
- access to the Change Intent, relevant docs, diff, gates, and evidence
- read-only posture by default
- a structured output format
- a boundary against inventing new product requirements.

## Review output

A reviewer should return:

```text
decision: pass | fail | needs-human
required findings
advisory suggestions
questions requiring builder judgment
potential learning to promote into the system
```

A useful finding explains:

- what failed
- why it matters
- the evidence
- the smallest reasonable remediation
- whether the lesson should become a doc, example, skill, gate, or test.

Reviewer agents should reduce ambiguity, not manufacture more of it.

## When humans still review

Use builder review when:

- risk or consequence is high
- taste or product judgment is central
- the evidence is incomplete
- reviewer agents disagree
- the Change class has not earned trust
- accountability requires a named approver.

Reviewer agents focus human attention. They do not erase responsibility.
