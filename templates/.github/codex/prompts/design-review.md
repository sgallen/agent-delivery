# Design Review

Review only the user-visible surfaces changed by this Change.

## Inputs

- Change Intent and non-goals
- `docs/DESIGN.md`
- nearby established patterns
- screenshots, video, and accessibility snapshots
- browser behavior evidence

## Review

Check:

- hierarchy and emphasis;
- spacing, density, and alignment;
- component and token usage;
- affordance and interaction clarity;
- copy and terminology;
- responsive behavior;
- accessibility;
- unrequested actions or visual drift.

Do not invent new product features. Separate clear design-system violations from subjective suggestions.

## Output

```yaml
decision: pass | fail | needs-human
required_findings:
  - principle:
    evidence:
    smallest_remediation:
advisory_findings: []
questions_for_builder: []
potential_system_learning: []
```
