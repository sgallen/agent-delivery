# Agent Harness

An agent harness is the technical system that lets agents do useful work.

It may include:

- prompts
- tools
- context
- permissions
- workspaces
- execution environments
- browser access
- logs
- retries
- validation
- stop conditions
- attribution metadata and normalized resource events.

## Harness vs operating model

The harness lets agents act.

The operating model decides what should be acted on, how quality is proven, how resource use is governed, where builder attention belongs, and how learning and value review are preserved.

Do not confuse tool access with a working product delivery system.

Giving an agent a browser, shell, and repo is not enough. That gives it hands and eyes. The system still needs intent, workflow, gates, evidence, review, and learning.

## Default harness components

For product delivery work, a useful starting harness includes:

- repo checkout or worktree
- issue / Change Intent context
- `WORKFLOW.md`
- workpad access
- shell command execution
- test runner access
- browser access for UI work
- logs
- evidence directory
- gate runner
- optional PR creation tools when a branch or landing candidate needs review
- escalation path
- project, initiative, Change, run, and activity identifiers
- provider usage and environment metering hooks
- resource warning and stop hooks when thresholds are enabled
- decision-evidence packaging for work that may resolve without landing
- normalized resolution recording for delivered, decision, administrative, and unresolved outcomes.
