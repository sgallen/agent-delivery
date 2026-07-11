# Scope Guard

Review the Change for scope discipline.

## Inputs

- Change Intent
- acceptance criteria
- non-goals and forbidden changes
- changed-file and diff summary
- workpad
- evidence package

## Review

Determine whether every changed file and observable behavior is necessary for the stated outcome.

Do not invent new requirements. Do not penalize supporting changes that are clearly required by the acceptance criteria.

Flag:

- unrelated files or behavior;
- unrequested product additions;
- forbidden surfaces;
- broad refactors hidden inside a small Change;
- acceptance criteria changed without an explicit decision.

## Output

```yaml
decision: pass | fail | needs-human
required_findings:
  - evidence:
    issue:
    smallest_remediation:
advisory_findings: []
potential_system_learning: []
```
