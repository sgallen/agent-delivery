---
name: browser-debug
description: Use when reproducing, validating, or debugging user-visible behavior in a live browser. Do not use personal browser profiles or sensitive authenticated sessions.
---

# Browser Debug

## Purpose

Use browser tooling to make UI behavior observable and produce evidence for a Change.

## Inputs

- Change Intent and acceptance criteria
- Run ID and isolated browser profile
- App URL and test data
- Change-specific artifact directory

## Procedure

1. Confirm the browser profile and app environment belong to the current run.
2. Start or verify the app and required services.
3. Navigate to the smallest route or journey that proves the Change.
4. Capture the initial state when comparison is useful.
5. Perform the required interaction.
6. Inspect console, page, and relevant network errors.
7. Capture the final state, trace, and concise observations.
8. Store artifacts under `.agent/runs/<change-id>/<run-id>/artifacts/browser/`.
9. Update the workpad with the result and evidence links.
10. Update an ExecPlan only when the findings change the plan or decision.

## Evidence

Produce:

- route or journey;
- actions performed;
- observed acceptance behavior;
- screenshots or video;
- console/page-error summary;
- network-failure summary;
- trace link when captured;
- known gaps.

## Escalation

Engage a builder when login or test data is missing, the environment cannot start, browser tooling exposes sensitive data, the expected behavior is ambiguous, or the observed result requires product/design judgment.
