# Reference: Gate Manifest

A gate manifest turns a quality bar into something an agent, runner, and reviewer can all understand.

Start with the proof needed for the Change. Add formal resolution or resource policy only when the repository actually uses it.

The copyable starter is [`templates/.agent/gates/ui-change.yml`](../../templates/.agent/gates/ui-change.yml).

## Core example

```yaml
id: low-risk-ui
summary: Prove a bounded user-visible Change or support a well-evidenced decision not to land it.

entry:
  required:
    - issue_has_outcome_or_decision
    - issue_has_validation_plan
    - issue_has_non_goals
    - issue_has_forbidden_changes
    - issue_has_risk
    - workpad_exists

required:
  - id: scope
    purpose: Prevent unrelated or forbidden changes.
    runner: pnpm gate:scope
    evidence: changed-file and behavior summary
    failure_action: repair_or_block

  - id: evidence_package
    purpose: Make the proposed outcome reviewable.
    runner: pnpm gate:evidence --change "${CHANGE_ID}"
    evidence: Change evidence manifest
    failure_action: repair_or_request_judgment

conditional:
  - id: targeted_tests
    applies_when: executable_behavior_changed_or_candidate_for_landing
    runner: pnpm test -- --related
    evidence: test report

  - id: behavior_proof
    applies_when: user_visible_behavior_is_candidate_for_landing
    runner: pnpm test:e2e -- --grep "@change-${CHANGE_ID}"
    evidence: browser report and screenshots

  - id: browser_console
    applies_when: browser_behavior_is_material
    runner: pnpm agent:browser-check --change "${CHANGE_ID}"
    evidence: console and page-error summary

  - id: decision_evidence_review
    applies_when: decision_question_present_and_nothing_should_land
    runner: agent:decision-evidence-reviewer
    evidence: evidence-sufficiency and decision-quality review

advisory:
  - id: code_review
    applies_when: code_or_configuration_changed
    runner: agent:code-reviewer

  - id: design_review
    applies_when: user_experience_changed_or_evaluated
    runner: agent:design-reviewer

loop_policy:
  max_attempts: 3
  stop_if_same_gate_fails_twice: true
  stop_if_forbidden_surface_changed: true
  stop_if_no_progress_between_attempts: true
  engage_builder_when:
    - intent_is_missing_or_conflicting
    - risk_increased
    - specialist_judgment_required
    - evidence_supports_a_different_outcome
```

## What the profile should make clear

A useful profile says:

- what must be true before execution;
- which checks always apply;
- which checks depend on the kind of Change;
- what evidence each check produces;
- what the agent should repair;
- what requires builder judgment;
- when the loop must stop.

A gate profile does not require every Change to produce a passing implementation. An experiment may reach a sound decision because a bounded attempt failed in a revealing way. The decision question and evidence still have to pass review.

Conversely, stopping work is not proof that the work resolved well.

## Optional resource policy

Repositories that measure resource use can add:

```yaml
resource_policy:
  record_usage: true
  warning_at_percent: 80
  soft_limit_action: checkpoint_and_reforecast
  hard_limit_action: preserve_state_and_require_decision
```

The threshold should trigger a decision, not erase context. Preserve the workpad, diff, evidence, and recovery path.

## Optional formal outcome checks

Teams using the full resolution taxonomy may add checks for delivered, decision, administrative, and unresolved outcomes. Keep those checks in the manifest only when the labels and records behind them are real.

Do not make a low-risk UI fix satisfy an enterprise ontology merely because the reference page contains one.

## Rule

A gate profile should tell the system what “good enough to decide” means, how that conclusion is proven, and when another attempt would no longer be useful.

If done is vague, the agent will discover exciting interpretations of it.
