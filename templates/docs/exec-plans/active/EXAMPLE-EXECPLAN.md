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

The user can update the preference, receive visible confirmation, and reload the page with the saved state intact. No unrelated header action appears.

## Plan of work

1. Inspect the existing preference API and nearby settings patterns.
2. Add the control using the approved design-system component.
3. Connect save, loading, and error behavior.
4. Add targeted unit and browser tests.
5. Capture browser and runtime evidence.

## Concrete steps

```bash
# inspect the relevant packages
rg "notification" apps/web/settings packages/notifications

# run the targeted checks
npm test -- settings-notifications
npm run test:browser -- settings-notifications
```

## Validation and evidence

- Targeted tests pass.
- The browser journey toggles, saves, and reloads the preference.
- No unexpected console or server errors occur.
- The header regression check passes.
- Before-and-after screenshots are attached.

Stop and request a builder decision if the Change requires a data migration, a new notification model, or a product behavior not covered by the issue.

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

The Change is additive and can be reverted by removing the UI control and test additions. No data migration is expected. Preserve the workpad, current diff, and gate results before stopping or restarting.

## Artifacts and evidence

- PR:
- Tests:
- Screenshots:
- Logs:

## Optional initiative or resource context

Add a parent initiative, estimate range, or threshold here only when it affects the decision.

## Outcome and retrospective

Complete this section with what happened, whether anything landed or released, the evidence behind the decision, remaining uncertainty, and one durable learning for the next similar Change.
