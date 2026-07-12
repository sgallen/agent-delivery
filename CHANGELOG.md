# Changelog

## v0.13 — Resolved outcomes and productive non-landing

This release strengthens the operating model for planned work that does not land. A Change now completes through an explicit resolution decision rather than through merge or release alone, and the economics and learning of non-landed work remain visible.

Key changes:

- Reframed the default Change lifecycle as `Proposed → Shaped → Ready → Running → Proving → Decision → Resolved`, with `Blocked` as a resumable state and abandonment as an explicit unresolved exception.
- Separated **resolution status**, **resolution class**, **specific disposition**, **landed state**, and **released state** so a run, branch, merge, release, and Change outcome are no longer conflated.
- Added four analytical resolution classes: `delivered`, `decision`, `administrative`, and `unresolved_loss`.
- Defined a high bar for productive non-landing: work-derived evidence must support a useful decision, reduce material uncertainty, change a forecast or next action, and preserve reusable findings where applicable.
- Distinguished evidence-backed non-landing from accountable administrative closure and from work abandoned without sufficient resolution.
- Added cost per evidence-backed decision, resolution yield, landing yield, decision yield, administrative-closure rate, unresolved-loss rate, and spend by resolution class alongside cost per trustworthy landed Change.
- Updated estimation and capacity planning to forecast a distribution of delivered, decision-resolved, administratively closed, and unresolved Changes rather than assuming every planned Change will land.
- Strengthened initiative records to compare forecast and actual Change funnels, support initiatives concluded without release, and review later decision value as well as released-product value.
- Added `Resolve a Change That Does Not Land` and integrated the doctrine through Changes, economics, learning checkpoints, `WORKFLOW.md`, GitHub labels, workpads, issue and PR templates, initiative templates, reviewer prompts, resource records, and starter scripts.
- Removed the self-declared `productive_non_landing` flag from canonical records. Productive non-landing is derived from a decision-class resolution with adequate evidence and accountable review.
- Preserved historical failed, discarded, superseded, and unresolved attempts in Change and initiative economics instead of hiding them behind the path that eventually landed.
- Reworked the first-experiment and GitHub playbooks so implementation, investigation, experiment, optional PR review, decision, resolution, and abandonment are explicit branches rather than an assumed merge path.

## v0.12 — Delivery economics and the value loop

This release makes resource observability a first-class part of Agent Delivery and extends the model from Change-level execution to initiative-level investment and realized value.

Key changes:

- Added **Resource Observability and Delivery Economics** as a core operating-model concept covering human attention, agent and tool usage, infrastructure, elapsed time, retries, outcomes, estimation, resource gates, routing, and capacity constraints.
- Added **Initiatives and the Value Loop**, distinguishing the Change as the unit of execution from the initiative as the unit of product investment and value learning.
- Added staged forecasts—opportunity, post-discovery, post-shaping, in-flight, and final actual—so teams can learn both estimation accuracy and which activities reduce uncertainty.
- Added soft and hard resource-gate behavior that warns, checkpoints, replans, preserves state, and requires an explicit decision rather than blindly burning budget or destroying context.
- Expanded economics from model spend to the complete resource mix and reinforced **cost per trustworthy accepted outcome** as the Change-level metric.
- Added initiative value hypotheses, investment forecasts, actual delivery rollups, post-release value reviews, continuing-cost analysis, and explicit delivery-versus-value variance.
- Added capacity planning around customer discovery, shaping, review, recovery, infrastructure, release, and agent budget so teams can identify the binding constraint and direct the next dollar accordingly.
- Added playbooks for forecasting and reviewing an initiative and for planning delivery capacity.
- Added copyable initiative, run-resource, and Change-resource templates plus a normalized delivery-economics record reference.
- Updated the README, The Case, Changes, workpads, gates, evidence, environments, skills, learning checkpoints, adoption playbooks, repo structure, glossary, `WORKFLOW.md`, and starter scripts so the idea is integrated throughout rather than isolated in a cost chapter.
- Added guardrails against false precision, incomplete attribution, historical price rewriting, and using human-resource telemetry as simplistic individual performance surveillance.

## v0.11 — A coherent employer-cost benchmark

This release removes the repeated $250,000 “senior engineer” assumption and replaces it with one dated, editable employer-cost benchmark.

Key changes:

- Replaced universal senior-engineer language with an approximate U.S. employer-compensation benchmark of $190,000 per year, derived from public wage and benefits data.
- Centralized the benchmark and its derivation in `docs/03-reference/model-economics.md` and `data/economics-scenarios.csv`.
- Updated the README and The Case to use the same language, number, caveats, and link back to the canonical reference.
- Renamed the calculator field from `fully_loaded_employee_annual_usd` to `employer_cost_benchmark_annual_usd`.
- Added editing rules so future versions do not scatter independent salary estimates or imply agent/employee equivalence.
- Kept total cost per accepted Change as the actual operating metric.

## v0.10 — The cost curve, made inspectable

This release adds a dated economic snapshot without making volatile model pricing part of the evergreen doctrine.

Key changes:

- Added `The Cost Curve Made Concrete` to The Case with a transparent heavy-workload scenario and an explicit warning that agents and employees are not interchangeable units.
- Added `Model Economics` with current representative OpenAI, Anthropic, and Z.AI list prices, runtime caveats, model-routing guidance, and a maintenance policy.
- Added `Measure Agent Economics`, focused on cost per accepted Change, builder minutes, retries, gate outcomes, and rework rather than raw token price.
- Added editable CSV data and a dependency-free calculator under `data/` and `scripts/economics/`.
- Added an optional per-run economics record template and connected economics telemetry to Changes, workpads, evidence, the first-30-days playbook, and repo structure.
- Kept the README comparison short and linked the reader to dated details rather than turning the landing page into a price sheet.

## v0.9 — Economic context, held lightly

This release adds Geoffrey Huntley’s essay on the falling cost of software development as a relevant influence without making it the center of the playbook.

Key changes:

- Added the resource to the README influences and the detailed references page.
- Connected it to the lived-origin page as a sharper statement of the downstream company, margin, capital, and incumbent-pressure implications.
- Explicitly framed the essay as a strategic provocation and directional thesis, not a literal cost benchmark or timetable.
- Left the core operating model, lifecycle, gates, and playbooks unchanged.

## v0.8 — Lived origin and a stronger “so what”

This release grounds the playbook more explicitly in direct use and team adoption, then strengthens the path from thesis to action.

Key changes:

- Reworked `README.md` to explain that the thesis grew from hands-on use, orchestration experiments, and observed team adoption—not from an abstract framework.
- Added `docs/00-the-case/00-why-this-exists.md` to connect lived experience, external influences, current conviction, and the promise of an actionable playbook.
- Added an explicit “So what do I do?” section with entry paths for personal experiments, greenfield projects, and existing-team transformation.
- Added `docs/02-playbooks/first-30-days.md` as a bounded founder/CTO adoption plan with measures, weekly outcomes, and an expand/hold/redesign decision.
- Added `docs/02-playbooks/fix-a-bug-with-proof.md` as a concrete report → reproduce → fix → prove → learn workflow.
- Strengthened the existing-team playbook around explicit permission to work differently, protected pilots, and avoiding review burden as the hidden cleanup layer.
- Added the Gusto Cofounder example and its lessons on working software as a decision artifact, discardable implementation, role permeability, and eval-first bug fixing.
- Reframed scaffolding around artifact minimalism: preserve intent, execution, proof, recovery, and learning; remove structure that does not earn its cost.
- Added the Symphony-derived principle to manage Changes and outcomes rather than interactive agent sessions.
- Added risk-weighted gate guidance and failing-before/passing-after behavior proof for bug fixes.
- Reworked `docs/references.md` to show what each influence contributed and how apparently different examples fit the same underlying operating thesis.
- Updated `VOICE.md`, `AGENTS.md`, and `WORKFLOW.md` so future edits preserve the lived voice and answer the reader’s “so what?” question.

## v0.7 — Reader value and actionability pass

This release reviews the package as a first-time founder, CTO, or senior/staff engineer would experience it.

Key changes:

- Tightened `README.md` around the hook, literal TL;DR, core shift, and a clear path to action.
- Added `docs/02-playbooks/first-experiment.md` so a reader can test the model on one low-risk Change without adopting the whole system.
- Reworked The Case as a clearer sequence with less repetition and stronger practical consequences.
- Added explicit lifecycle states and a source-of-truth map for Changes.
- Made gates more operational with gate contracts, loop behavior, stop conditions, and evidence requirements.
- Added minimum evidence guidance by Change type.
- Reframed builder engagement around ambiguity, consequence, reversibility, observability, and system history.
- Expanded the greenfield, existing-team, GitHub Change, browser-proof, environment, gate, learning, and slop-recovery playbooks with definitions of done.
- Standardized the lifecycle as `Proposed → Shaped → Ready → Running → Proving → Review → Released`.
- Standardized durable ExecPlans under `docs/exec-plans/active/` and `completed/`; `.agent/` now holds runtime state and artifacts.
- Harmonized reference files, templates, starter scripts, `AGENTS.md`, `WORKFLOW.md`, and `VOICE.md` with the doctrine.
- Removed artificial semicolon-heavy bullet styling and tightened prose across the repo.

## v0.6 — Voice and coherence pass

This release harmonizes the package around the intended voice: thoughtful, incisive, grounded, practical, and human.

Key changes:

- Reworked `README.md` to be more forward-facing, succinct, and curiosity-driving.
- Added `VOICE.md` so future human and agent edits preserve the intended tone.
- Updated `AGENTS.md` and `WORKFLOW.md` with voice, doctrine, and editing expectations.
- Tightened The Case around the economic shift, current capability, builder attention, and the “invert the default” principle.
- Clarified the distinction between repo-level workflow, per-Change workpads, and optional ExecPlans.
- Refined operating-model pages to feel less generic and more like the author’s actual thesis.
- Kept reference material practical and copyable rather than overly market-facing.

## v0.5 — Forward-facing README

- Reworked the README to open with the shift rather than the version mechanics.
- Added a literal TL;DR.
- Made the README more suitable to share with a founder/CTO peer or senior/staff engineer.


## v0.4

Clarified where workpads live and how they should be maintained.

### Changed

- Defined the default workpad location as one persistent ticket comment attached to the Change Intent.
- Clarified that GitHub implementations should use a single issue comment headed `## Agent Workpad`.
- Reframed local `.agent/workpads/...` files as optional mirrors, caches, or no-tracker fallbacks rather than the default source of truth.
- Clarified the separation between ticket body, workpad comment, PR body, and large evidence artifacts.
- Updated the GitHub Change playbook, workpad reference, `WORKFLOW.md`, templates, and workpad-maintainer skill around persistent comment behavior.
- Added guidance that the workpad should link to screenshots, traces, logs, CI artifacts, and PRs rather than storing large raw evidence.

### Principle added

> The ticket body holds stable intent. The workpad comment holds live execution state. The PR carries the review package. Artifact stores hold large evidence.

## v0.3

Updated the execution model based on the distinction between the Harness/ExecPlan pattern and the Symphony/`WORKFLOW.md` pattern.

### Changed

- Reframed `WORKFLOW.md` as the repo-level operating contract.
- Added workpads as the default live per-Change execution surface.
- Repositioned ExecPlans as optional heavier artifacts for complex, ambiguous, risky, or long-running work.
- Revised the core workflow from `Change Intent → ExecPlan → Active Change` to `Change Intent + WORKFLOW.md → Workpad → Active Change`, with ExecPlans optional.
- Updated the GitHub Change playbook around workpads, required validation, and gate/evidence handoff.
- Updated scaffolding posture to prefer `WORKFLOW.md`, workpads, skills, gates, and optional ExecPlans before code-native orchestration.

### Added

- `docs/01-operating-model/workflow-and-workpads.md`
- `docs/03-reference/workpad-template.md`
- `templates/.agent/workpad-template.md`

## v0.2

Added ExecPlans, skills, browser feedback, execution environments, and scaffolding posture.

## v0.1

Initial Markdown playbook structure and doctrine.
