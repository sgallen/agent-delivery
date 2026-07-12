# Skills Template

Repository skills live under:

```text
.agents/skills/<skill-name>/SKILL.md
```

Use skills for reusable procedures that agents should perform in the team’s preferred way.

## Template

```markdown
---
name: <skill-name>
description: Use when <specific trigger>. Do not use when <boundary>.
---

# <Skill Name>

## Purpose

What this skill helps the agent do.

## Use when

- Trigger 1
- Trigger 2

## Do not use when

- Boundary 1
- Boundary 2

## Inputs

- Required context
- Required files
- Required tools
- Required run, Change, or initiative identity
- Intended resolution path, decision question, and relevant delivered or non-landed criteria

## Procedure

1. Step one.
2. Step two.
3. Step three.

## Evidence to capture

- Screenshot
- Log excerpt
- Test output
- Resource event or artifact, when the procedure consumes a metered environment or provider
- Summary

## Resource and routing notes

- Recommended model or environment class, if evidence supports one
- Expected resource pattern or threshold
- Known expensive failure modes
- Data that should update the Change resource record
- Findings that may change the candidate resolution class, disposition, landing expectation, or stop decision

## Failure modes

What to do when the procedure fails, including how to preserve state and escalate at a threshold.

## Output

What the agent should produce, including any effect on the candidate resolution and the evidence required to support it.
```

## Rule

A skill should encode a useful habit, not a vague preference.

Observed economics may help decide when to use a skill or model. Do not freeze one noisy cohort into permanent routing doctrine.
