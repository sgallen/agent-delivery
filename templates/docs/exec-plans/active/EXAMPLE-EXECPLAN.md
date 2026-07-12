# Example: Add a Notification Preference

This ExecPlan is a living example maintained according to `docs/PLANS.md`.

## Purpose and desired outcome

Allow a user to enable or disable email notifications from Settings while preserving the existing page header and design-system behavior.

## Initiative and value context

- Parent initiative: `INIT-004: Reduce unwanted notification churn`
- Expected contribution: give customers direct control over a common source of dissatisfaction.

## Context and orientation

- Change Intent: GitHub Issue #123
- Workpad: linked issue comment
- Relevant modules: `apps/web/settings`, `packages/ui`, `packages/notifications`
- Gate profile: `low-risk-ui`

## Current state

The settings page displays notification status but does not provide an editable control.

## Desired state

The user can update the preference, receive visible confirmation, and reload the page with the saved state intact. No Copy Link, Share, or Export action appears in the header.

## Resolution intent and criteria

- Resolution intent: delivery
- Landing expectation: expected
- Delivered criteria: the preference can be changed, saved, and reloaded without regressions.
- Useful non-landed criteria: a decision resolution is allowed only if evidence shows the existing preference API or product constraint makes the requested behavior unsafe or unjustified.
- Stop conditions: stop and request a decision if the work requires a data migration, a new notification model, or more than the authorized resource envelope.

## Plan of work

1. Inspect the existing preference API and nearby settings patterns.
2. Add the control using the approved design-system component.
3. Connect save and error behavior.
4. Add targeted unit and browser tests.
5. Capture browser and runtime evidence.

## Resource forecast and constraints

- Forecast stage: post-shaping
- Agent, tool, and environment spend: expected $18; likely range $10–$32
- Builder attention: expected 30–60 minutes across product confirmation and evidence review
- Confidence: medium, based on two comparable settings Changes
- Soft threshold: $28, checkpoint and reforecast
- Hard threshold: $40, preserve state and request a scope decision
- Likely constraint: browser-proof reliability in the local environment

## Validation and resolution criteria

- Targeted tests pass.
- The browser journey toggles, saves, and reloads the preference.
- No unexpected console or server errors occur.
- Header regression assertion passes.
- Before/after screenshots are attached.

## Progress

- [ ] Inspect current implementation.
- [ ] Implement behavior.
- [ ] Add tests.
- [ ] Run gates.
- [ ] Prepare evidence.

## Discoveries and surprises

- None yet.

## Decision log

- Use the existing `Switch` component rather than introducing a new control.

## Idempotence, rollback, and recovery

The Change is additive and can be reverted by removing the UI control and test additions. No data migration is required. At a resource stop, preserve the workpad, diff, gate results, and current forecast before ending the run.

## Artifacts and evidence

- PR:
- Tests:
- Screenshots:
- Logs:
- Resource summary:

## Outcome and retrospective

Complete at the end of the Change with resolution status, class, disposition, landing and release state; estimate versus actual; material delivery or resolution variance; evidence; learning; and any implication for the parent initiative.
