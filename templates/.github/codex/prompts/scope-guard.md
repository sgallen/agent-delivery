# Scope Guard

Review the Change for scope discipline.

## Inputs

- Change Intent
- delivered and non-landed resolution criteria
- non-goals and forbidden changes
- changed-file and diff summary
- workpad
- evidence package

## Review

Determine whether every changed file and observable behavior is necessary for the stated outcome or decision question.

Do not invent new requirements. Do not penalize supporting work clearly required by the applicable resolution criteria.

Flag:

- unrelated files or behavior;
- unrequested product additions;
- forbidden surfaces;
- broad refactors hidden inside a small Change;
- delivered or non-landed criteria changed without an explicit decision.
- a failed delivery path retrospectively relabeled as an experiment without an evidence bar.

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
