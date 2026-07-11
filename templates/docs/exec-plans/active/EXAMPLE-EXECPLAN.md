# Example: Add a Notification Preference

This ExecPlan is a living example maintained according to `docs/PLANS.md`.

## Purpose and desired outcome

Allow a user to enable or disable email notifications from Settings while preserving the existing page header and design-system behavior.

## Context and orientation

- Change Intent: GitHub Issue #123
- Workpad: linked issue comment
- Relevant modules: `apps/web/settings`, `packages/ui`, `packages/notifications`
- Gate profile: `low-risk-ui`

## Current state

The settings page displays notification status but does not provide an editable control.

## Desired state

The user can update the preference, receive visible confirmation, and reload the page with the saved state intact. No Copy Link, Share, or Export action appears in the header.

## Plan of work

1. Inspect the existing preference API and nearby settings patterns.
2. Add the control using the approved design-system component.
3. Connect save and error behavior.
4. Add targeted unit and browser tests.
5. Capture browser and runtime evidence.

## Validation and acceptance

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

The Change is additive and can be reverted by removing the UI control and test additions. No data migration is required.

## Artifacts and evidence

- PR:
- Tests:
- Screenshots:
- Logs:

## Outcome and retrospective

Complete at the end of the Change.
