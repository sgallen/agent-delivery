# Agent Harness

An agent harness is the technical system that lets agents do useful work.

It may include prompts, tools, context, permissions, workspaces, execution environments, browser access, logs, retries, validation, and stop conditions.

## Harness vs operating model

The harness lets agents act.

The operating model decides what should be acted on, how quality is proven, where builder attention belongs, how the work ends, and what the system should learn.

Do not confuse tool access with a working product-delivery system.

Giving an agent a browser, shell, and repository gives it hands and eyes. The system still needs intent, workflow, boundaries, gates, evidence, recovery, and judgment.

## A useful starting harness

For product-delivery work, begin with:

- a repository checkout or worktree;
- the issue or Change Intent;
- `WORKFLOW.md`;
- workpad access;
- shell and test-runner access;
- browser access for UI work;
- logs and an evidence directory;
- a gate runner;
- optional PR creation tools;
- a clear escalation and stop path;
- Change and run identifiers.

## Advanced capabilities

Add these when the operating model needs them:

- initiative and activity identifiers;
- provider usage and environment metering;
- normalized resource events;
- warning and stop hooks for thresholds;
- model routing and fallback policy;
- decision-evidence packaging for work that may not land;
- normalized resolution recording for analysis.

A richer harness is useful only when it improves execution, proof, recovery, or a decision. Tooling complexity is not evidence of maturity.
