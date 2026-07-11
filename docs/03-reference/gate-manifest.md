# Reference: Gate Manifest

Example profile for a low-risk user-visible Change.

```yaml
id: low-risk-ui
summary: Prove a bounded UI Change without requiring full-project review.

entry:
  required:
    - issue_has_outcome
    - issue_has_acceptance_criteria
    - issue_has_non_goals
    - issue_has_forbidden_changes
    - issue_has_risk_label
    - issue_has_gate_profile
    - workpad_exists

required:
  - id: scope
    purpose: Prevent unrelated or forbidden changes.
    runner: pnpm gate:scope
    evidence: changed-file and behavior summary
    failure_action: repair_or_block

  - id: format
    runner: pnpm format:check
    evidence: command output

  - id: lint
    runner: pnpm lint
    evidence: command output

  - id: typecheck
    runner: pnpm typecheck
    evidence: command output

  - id: targeted_tests
    runner: pnpm test -- --related
    evidence: test report

  - id: behavior_proof
    runner: pnpm test:e2e -- --grep "@change-${CHANGE_ID}"
    evidence: Playwright report and screenshots

  - id: browser_console
    runner: pnpm agent:browser-check --change "${CHANGE_ID}"
    evidence: console and page-error summary

  - id: evidence_package
    runner: pnpm gate:evidence --change "${CHANGE_ID}"
    evidence: PR evidence manifest

advisory:
  - id: code_review
    runner: agent:code-reviewer

  - id: design_review
    runner: agent:design-reviewer

conditional:
  - id: architecture_review
    applies_when: architecture_boundaries_changed
    runner: agent:architecture-reviewer

  - id: execplan_current
    applies_when: execplan_required
    runner: docs/exec-plans/active/${CHANGE_ID}-*.md

loop_policy:
  max_attempts: 3
  stop_if_same_gate_fails_twice: true
  stop_if_forbidden_surface_changed: true
  stop_if_no_progress_between_attempts: true
  engage_builder_when:
    - intent_is_missing_or_conflicting
    - risk_increased
    - specialist_judgment_required
```

## Rule

A gate profile should tell the system what “done” means for this class of Change, how it is proven, and when the loop must stop.

If done is vague, the agent will discover exciting interpretations of it.
