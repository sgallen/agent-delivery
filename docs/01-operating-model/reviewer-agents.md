# Reviewer Agents

Reviewer agents are narrow, independent judges.

The implementation agent should self-review. It should not be the only party grading its own work.

## Why they matter

Agent-enabled delivery can increase output faster than human review capacity.

Without useful gates and reviewer agents, the builders with the strongest judgment become the cleanup crew. They get buried under diffs, comments, and the vague dread that nobody else has looked closely.

A reviewer agent can inspect a specific concern before scarce human attention is engaged. Its job is not to approve the work on behalf of the team. Its job is to make the remaining judgment smaller and sharper.

## Keep reviewers narrow

Useful roles include:

- scope reviewer;
- code reviewer;
- architecture reviewer;
- design reviewer;
- security reviewer;
- test-sufficiency reviewer;
- regression reviewer.

Each reviewer should have:

- one clear concern;
- fresh context rather than the implementation agent’s private reasoning;
- access to the Change Intent, relevant docs, diff, gates, and evidence;
- read-only posture by default;
- a structured output;
- a boundary against inventing new product requirements.

A reviewer that checks everything usually checks nothing particularly well.

## Review output

A useful reviewer returns:

```text
decision: pass | fail | needs-human
required findings
advisory suggestions
questions requiring builder judgment
potential learning to preserve
```

Each material finding should explain:

- what is wrong;
- why it matters;
- where the evidence is;
- the smallest reasonable remediation;
- whether the lesson should become a test, gate, example, skill, or repository rule.

Reviewer agents should reduce ambiguity, not manufacture more of it.

## Specialized reviewers

As the operating model matures, a team may add reviewers for decision evidence, resource records, or initiative claims.

A decision-evidence reviewer asks whether a proposed non-landed outcome actually follows from the evidence and changes what happens next. It should not reward a failed branch merely for producing a thoughtful paragraph afterward.

A resource reviewer checks attribution, forecast-versus-actual separation, threshold behavior, and material variance. It should not decide whether a number was “good” without the outcome and context beside it.

These roles are useful when the underlying records exist. They are not prerequisites for the first credible Change.

## Judge reviewers by what they improve

A reviewer model that costs more per request may still be the economical choice if it prevents rework, catches meaningful risk, or focuses senior attention. A cheap reviewer that produces a dozen false positives is not cheap in any sense the team should care about.

Look at material findings, false-positive burden, downstream defects, review time, and the quality of the final outcome—not comment count.

## When humans still review

Use builder review when:

- consequence or risk is high;
- taste, value, or product judgment is central;
- evidence is incomplete or reviewers disagree;
- the Change class has not earned trust;
- an accountable approval is required.

Reviewer agents focus human attention. They do not erase responsibility.
