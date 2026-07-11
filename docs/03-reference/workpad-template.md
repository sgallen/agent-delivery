# Reference: Workpad Template

Use this template for the live per-Change workpad.

## Default location

In the default GitHub implementation, the workpad is a **single persistent GitHub Issue comment**.

Start the comment with this marker so agents can find and update it:

```markdown
## Agent Workpad
```

Edit the same comment throughout the Change. Do not create a stream of progress comments that another agent has to assemble into a narrative later.

## Template

```markdown
## Agent Workpad

### Status

state: running
last_updated: <timestamp>
runner: <agent/tool>
run_id: <id>
branch: <branch>
commit: <sha>
environment: <url or identifier>

### Outcome

Short restatement of what should be observably true.

### Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

### Plan

- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

### Validation and gates

- [ ] Scope
- [ ] Lint / typecheck / build
- [ ] Targeted tests
- [ ] Behavior proof
- [ ] Browser or runtime check, if applicable
- [ ] Evidence package

### Discoveries and decisions

- <Only items that affect the plan, scope, risk, or outcome>

### Blockers / builder judgment

- <Question, decision needed, or none>

### Evidence

- PR:
- CI:
- screenshots / video:
- logs / traces:
- preview / deployment:

### Handoff

- current outcome:
- remaining work:
- known gaps:
- recommended reviewer:

### Learning checkpoint

- no reusable learning / improvement included / follow-up Change:
```

## Maintenance rules

- Keep the status and checklist current.
- Summarize; link large artifacts elsewhere.
- Record decisions that change scope, risk, or approach.
- Surface builder questions explicitly.
- Close with the final outcome and learning checkpoint.

## Rule

The workpad should be useful at a glance and sufficient to resume the Change.

If it becomes a landfill, stop and clean it up.
