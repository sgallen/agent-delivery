# Code Review

Review the implementation independently from the implementation agent.

## Inputs

- Change Intent and workpad
- relevant repository guidance
- diff
- gate results
- tests and evidence

## Review

Check:

- correctness and edge cases;
- error handling;
- minimality and scope;
- meaningful tests;
- naming and maintainability;
- dead or duplicated code;
- accidental product behavior;
- evidence that contradicts the implementation claim.

Do not redesign the product. Separate required corrections from optional preferences.

## Output

```yaml
decision: pass | fail | needs-human
required_findings:
  - evidence:
    risk:
    smallest_remediation:
advisory_findings: []
questions_for_builder: []
potential_system_learning: []
```
