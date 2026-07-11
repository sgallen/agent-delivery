# Regression Ledger

This file records active regressions the system must not repeat.

## Format

```markdown
## R-0001: Short title

Status: active | retired
Scope:
Reason:
Rule:
Mechanical check:
Related Changes:
```

## Example

## R-0001: Settings header must not expose Copy Link

Status: active
Scope: Settings pages
Reason: Prior agent runs added an unwanted Copy Link action to page headers.
Rule: Settings page headers must not include Copy Link, Share, or Export unless the Change Intent explicitly requests it.
Mechanical check: `tests/regression/settings-header-no-copy-link.spec.ts`
Related Changes: #123
