# Reference: Change Intent Issue Template

The issue body holds stable intent. Live execution belongs in the workpad.

The copyable GitHub Issue Form is [`templates/.github/ISSUE_TEMPLATE/change_intent.yml`](../../templates/.github/ISSUE_TEMPLATE/change_intent.yml).

## Core fields

A useful Change Intent answers:

- What should become observably true?
- Why does it matter?
- What is true today?
- What would count as success?
- What is in and out of scope?
- What proof is required?
- What risk and gate profile apply?
- Where is builder judgment likely to matter?

That is enough for most routine Changes.

## When the work may not land

Add a decision path for experiments and investigations:

- What question or uncertainty are we trying to resolve?
- What evidence would distinguish the options?
- What should stop the work early?
- What would count as a useful conclusion without a merge?

Define that before execution. It prevents a failed feature from being relabeled as a successful experiment after the fact.

## Optional maturity fields

Add these when they improve a real decision:

- parent initiative;
- likely resource range and confidence;
- soft checkpoint and hard decision threshold;
- comparable Changes;
- expected specialist or release judgment;
- formal resolution intent for reporting.

Do not require advanced economics for every small bug. Do not omit it from material or uncertain work merely because the habit is new.

## Readiness is still a judgment

A form can require fields. It cannot determine whether the outcome is coherent, the scope is honest, or the evidence would prove anything useful.

`Ready` should remain an accountable decision.
