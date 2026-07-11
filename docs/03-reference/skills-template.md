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

## Procedure

1. Step one.
2. Step two.
3. Step three.

## Evidence to capture

- Screenshot
- Log excerpt
- Test output
- Summary

## Failure modes

What to do when the procedure fails.

## Output

What the agent should produce.
```

## Rule

A skill should encode a useful habit, not a vague preference.
