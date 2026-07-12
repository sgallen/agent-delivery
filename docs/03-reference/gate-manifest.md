# Reference: Gate Manifest

Example profile for a low-risk user-visible Change. It supports both a delivered resolution and an evidence-backed decision not to land the candidate work.

```yaml
id: low-risk-ui
summary: Prove a bounded user-visible Change or support a trustworthy decision not to land it.

entry:
  required:
    - issue_has_outcome_or_decision
    - issue_has_resolution_intent
    - issue_has_landing_expectation
    - issue_has_landed_criteria
    - issue_has_non_landed_resolution_criteria
    - issue_has_validation_plan
    - issue_has_non_goals
    - issue_has_forbidden_changes
    - issue_has_risk_label
    - issue_has_gate_profile
    - workpad_exists
    - workpad_mirrors_resolution_intent_and_criteria

required:
  - id: scope
    purpose: Prevent unrelated or forbidden changes and unexplained exploration.
    runner: pnpm gate:scope
    evidence: changed-file, investigation-surface, and behavior summary
    failure_action: repair_or_block

  - id: run_and_resource_record
    purpose: Preserve every material attempt and its contribution.
    runner: pnpm gate:resource-record --change "${CHANGE_ID}"
    evidence: normalized run and Change records

  - id: evidence_package
    purpose: Make the proposed disposition reviewable whether or not code lands.
    runner: pnpm gate:evidence --change "${CHANGE_ID}"
    evidence: Change evidence manifest

  - id: resolution_record
    purpose: Keep resolution status, class, disposition, landing, release, and learning consistent.
    runner: pnpm gate:resolution --change "${CHANGE_ID}"
    evidence: completed Change resolution record

conditional:
  - id: format
    applies_when: code_or_configuration_changed
    runner: pnpm format:check
    evidence: command output

  - id: lint
    applies_when: code_or_configuration_changed
    runner: pnpm lint
    evidence: command output

  - id: typecheck
    applies_when: typed_code_changed
    runner: pnpm typecheck
    evidence: command output

  - id: targeted_tests
    applies_when: executable_behavior_changed_or_candidate_for_landing
    runner: pnpm test -- --related
    evidence: test report

  - id: behavior_proof
    applies_when: candidate_resolution_class == delivered
    runner: pnpm test:e2e -- --grep "@change-${CHANGE_ID}"
    evidence: browser report and screenshots

  - id: browser_console
    applies_when: browser_behavior_is_material
    runner: pnpm agent:browser-check --change "${CHANGE_ID}"
    evidence: console and page-error summary

  - id: decision_evidence_review
    applies_when: candidate_resolution_class == decision
    runner: agent:decision-evidence-reviewer
    evidence: evidence-sufficiency and decision-quality review

  - id: administrative_basis
    applies_when: candidate_resolution_class == administrative
    runner: agent:resource-reviewer
    evidence: accountable owner, external basis, preserved actuals, and next action

  - id: unresolved_loss_record
    applies_when: candidate_resolution_class == unresolved_loss
    runner: agent:resource-reviewer
    evidence: missing resolution evidence, preserved actuals, owner, and recovery action

  - id: architecture_review
    applies_when: architecture_boundaries_changed
    runner: agent:architecture-reviewer

  - id: execplan_current
    applies_when: execplan_required
    runner: docs/exec-plans/active/${CHANGE_ID}-*.md

advisory:
  - id: code_review
    applies_when: code_or_configuration_changed
    runner: agent:code-reviewer

  - id: design_review
    applies_when: user_experience_changed_or_evaluated
    runner: agent:design-reviewer

  - id: resource_review
    applies_when: material_resource_policy_or_resolution_variance
    runner: agent:resource-reviewer

resource_policy:
  record_usage: true
  warning_at_percent: 80
  soft_limit_action: checkpoint_and_reforecast
  hard_limit_action: preserve_state_and_require_decision

loop_policy:
  max_attempts: 3
  stop_if_same_gate_fails_twice: true
  stop_if_forbidden_surface_changed: true
  stop_if_no_progress_between_attempts: true
  engage_builder_when:
    - intent_is_missing_or_conflicting
    - risk_increased
    - specialist_judgment_required
    - material_resource_variance
    - hard_resource_limit_reached
    - evidence_supports_a_different_resolution_path
```

## Interpret the profile by proposed disposition

A gate profile does not require every Change to produce a passing implementation.

For a `delivered` resolution, the implementation, behavior, and evidence gates required by the profile must pass. For a `decision` resolution, an implementation gate may be `not_applicable` or may fail when that result is material evidence, but the decision question, evidence bar, decision review, and resolution record still have to pass. Administrative closure requires an accountable owner and external basis. Unresolved loss requires an honest loss record and recovery action; it must not be converted into `decision` merely to improve the metrics.

A branch, run, or individual gate can fail while the Change still reaches a strong evidence-backed resolution. Conversely, stopping work is not itself proof that the Change resolved well.

## Rule

A gate profile should tell the system what “done” means for each credible resolution path, how that conclusion is proven, and when the loop must stop.

If done is vague, the agent will discover exciting interpretations of it. If non-landing is vague, the team will discover flattering interpretations of learning.
