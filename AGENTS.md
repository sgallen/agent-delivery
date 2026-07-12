# Agent Instructions

This repository is a Markdown-first playbook for human-governed, agent-enabled product delivery.

The job is not to add more doctrine. It is to make the shift easier to understand, easier to challenge, and easier to try.

## Read before editing

Start with:

1. `README.md`
2. `VOICE.md`
3. `docs/00-the-case/00-why-this-exists.md`
4. `docs/01-operating-model/index.md`
5. the pages, references, and templates directly touched by the Change

For economics, initiative, or non-landed-work edits, also read:

- `docs/01-operating-model/resource-observability-and-delivery-economics.md`
- `docs/01-operating-model/initiatives-and-value.md`
- `docs/01-operating-model/not-all-work-is-merge-bound.md`

## Preserve the shape of the argument

The core position is:

- Current agents can perform meaningful product-development work.
- The old process was built around scarcer human implementation capacity.
- The goal is not maximum autonomy. It is greater leverage from human judgment.
- A Change, not a prompt or session, is the durable unit of delivery.
- `WORKFLOW.md`, workpads, environments, gates, and evidence make the work governable.
- A Change may deliver capability, support a useful decision not to land, close for an external reason, or become unresolved loss. Those outcomes must remain distinct.
- Resource use belongs with the outcome that consumed it. Start with attribution; add estimates, thresholds, routing, and capacity planning as the history earns them.
- An initiative is an investment hypothesis. Delivery actuals and later value both matter.
- Every effort should improve the next decision, the next Change, or the system itself.

Do not imply that quality matters less, that specialists are obsolete, or that agent spend and human cost are interchangeable forms of productive capacity.

## Write in the repo’s voice

Follow `VOICE.md`.

Lead with the consequence the reader can feel. Explain the idea before the taxonomy. Prefer short paragraphs, concrete verbs, and one main job per page. Use lists when they help someone scan or act—not when prose would carry the thought better.

Keep the edge in the clarity. Avoid vendor language, process theater, academic distance, and a machine explaining its own ontology.

The reader should leave with a sharper way to see the problem and a practical next move.

## Keep the package coherent

- Let the README invite and orient; do not make it carry the full reference model.
- Let The Case persuade in sequence.
- Let the operating model explain how the pieces fit.
- Let playbooks tell someone what to do.
- Let reference pages and templates stay terse, exact, and copyable.
- Keep taxonomy in its natural home. Link rather than re-teaching it on every page.
- Keep templates useful on Tuesday morning. Advanced fields should be optional unless the consequence makes them necessary.
- Preserve the distinction among Run, Change, Initiative, and Portfolio.
- Use ranges, confidence, assumptions, and data-quality notes. Do not manufacture precision from sparse history.
- Keep volatile model prices dated, sourced, and consistent with `data/model-pricing.csv`.
- Keep human time separate from any optional monetary conversion. Prefer team and capability patterns over individual surveillance.

## Before resolving an edit

Check that:

- the argument is clearer or the action is easier;
- repetition fell rather than moved;
- links and artifact paths resolve;
- terms and lifecycle states remain consistent;
- templates still match the doctrine;
- code fences, YAML, JSON, CSV, shell, and Python still validate where touched;
- the Change did not add structure that fails to improve intent, execution, proof, resource visibility, resolution, recovery, or learning.

The standing test is simple: a serious builder should be able to read the page, recognize the problem, and know what to try next.
