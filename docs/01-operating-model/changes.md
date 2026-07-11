# Changes

The practical unit of product work is a **Change**.

A ticket is a useful starting surface because teams already understand tickets and tools like GitHub Issues provide shared visibility. But the Change is larger than the ticket. It carries the work from intent through execution, proof, review, release, and learning.

## Lifecycle

```text
Proposed → Shaped → Ready → Running → Proving → Review → Released
                    ↘ Blocked / Cancelled when needed
```

- **Proposed** — a problem, opportunity, or desired outcome has been identified.
- **Shaped** — the intent, constraints, risk, and likely proof are clear enough to evaluate.
- **Ready** — the Change has a gate profile and enough context for the system to begin.
- **Running** — an agent or builder-agent pair is implementing or investigating.
- **Proving** — the required gates and evidence are being completed.
- **Review** — the outcome and evidence are ready for the required builder judgment.
- **Released** — the Change is merged or deployed according to policy.

A Change can also be deliberately discarded. Exploration that produces clarity but no merge is still useful work.

## Artifacts

```text
Change Intent
  + WORKFLOW.md
  → Workpad
  → Active Change
  → Gates / evidence / review
  → Change Record
  → Learning Checkpoint
```

### Change Intent

The Change Intent is the stable request. In the default GitHub implementation, it lives in the issue body.

It should capture:

- the desired outcome
- why it matters
- customer, business, or technical context
- acceptance criteria
- non-goals and forbidden changes
- risk level
- gate profile
- validation and evidence expectations.

The issue body should not be rewritten continuously as the work unfolds. It is the original intent, not the scratchpad.

### Workpad

The workpad is the live execution surface. In the default GitHub implementation, it is one persistent issue comment headed:

```md
## Agent Workpad
```

It holds the current plan, checklist, validation state, blockers, discoveries, and evidence links.

### Active Change

The Active Change is the work in motion. It normally has:

- a branch and worktree
- an isolated execution environment
- an agent run
- logs and artifacts
- browser/debug access when relevant
- gate results
- a PR once the work is ready for review.

### Change Record

At completion, the issue, workpad, PR, and linked artifacts should form a durable record of:

- the original intent
- the final outcome
- the implementation summary
- the gates that passed
- the evidence produced
- the review decisions
- release or deployment notes
- the learning checkpoint
- run economics when the project is measuring model, environment, and builder-attention cost.

## Source of truth by concern

| Concern | Default source of truth |
| --- | --- |
| Desired outcome and constraints | Issue body / Change Intent |
| Standing repo process | `WORKFLOW.md` |
| Live plan and status | Persistent workpad comment |
| Code and implementation | Branch / worktree / PR |
| Gate results and large evidence | CI and artifact store |
| Run economics | Per-run economics record linked to the Change |
| Review decision | PR and required reviews |
| Durable history | Linked Change Record across the issue, workpad, PR, and artifacts |

The Change is not done merely because code merged.

It is done when the outcome is delivered or deliberately rejected, the evidence is available, and reusable learning has been considered.
