---
name: log-debug
description: Use when a Change requires app, server, worker, or browser logs to diagnose or prove behavior.
---

# Log Debug

## Purpose

Inspect logs in a way that produces concise, attributable evidence rather than a raw-output landfill.

## Procedure

1. Identify the initiative when present, Change ID, run ID, time window, and affected journey.
2. Read logs from the Change-specific run directory.
3. Filter for relevant errors, warnings, retries, failed requests, and correlation IDs.
4. Correlate log events with the browser/API journey, current commit, and run-resource events.
5. Summarize the likely cause and supporting evidence.
6. Save concise excerpts under `.agent/runs/<change-id>/<run-id>/artifacts/log-summary.md`.
7. Update the workpad with the result, evidence link, and any impact on the completion forecast or candidate disposition.
8. Update an ExecPlan only when the diagnosis changes the plan, resource range, or decision.

## Evidence

Include timestamps, source process, relevant excerpts, correlation identifiers, interpretation, related retries or environment failures, and known uncertainty.

## Escalation

Engage a builder when logs suggest data loss, security issues, production-only behavior, hidden shared state, repeated environment failure, or resource drift with no credible path to delivery or evidence-backed decision.
