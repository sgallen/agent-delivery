# Reference: Repo Structure

A good agent-enabled repository is legible to humans and agents.

The root should be a map, not a junk drawer.

```text
.
├── README.md
├── AGENTS.md
├── WORKFLOW.md
├── ARCHITECTURE.md
├── docs/
│   ├── PRODUCT.md
│   ├── DESIGN.md
│   ├── REGRESSION_LEDGER.md
│   ├── PLANS.md
│   ├── INITIATIVE.md
│   ├── initiatives/
│   ├── decisions/
│   └── exec-plans/
│       ├── active/
│       └── completed/
├── .agent/
│   ├── run-resource-use.json
│   ├── change-resource-summary.yml
│   ├── gates/
│   ├── runs/
│   ├── changes/
│   └── workpads/
├── .agents/
│   └── skills/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/
├── data/
│   ├── model-pricing.csv
│   └── economics-scenarios.csv
├── scripts/
│   ├── agent/
│   └── economics/
├── apps/
├── packages/
└── tests/
```

## Root files

### `README.md`

The human entry point: what the product is, how to run it, and where deeper context lives.

### `AGENTS.md`

A short map for agents. Point to the right docs and repository rules. Do not turn it into the entire company handbook.

### `WORKFLOW.md`

The repo-level operating contract: lifecycle, readiness, workpads, gates, evidence, resource policy, retry/stop behavior, review, and learning.

### `ARCHITECTURE.md`

The architectural map: modules, boundaries, dependency rules, and important design choices.

## `docs/`

Repository docs are part of the context system, not decoration.

Use them for stable product, design, architecture, regression, decision, initiative, and optional ExecPlan context.

Keep initiative records under `docs/initiatives/`. Preserve value hypotheses, staged forecasts, actual Change funnels and resolution classes, final initiative disposition, and later value or decision-value reviews in version control when they are appropriate for the repository. Sensitive financial or personnel detail may belong in a linked access-controlled system instead.

Keep active ExecPlans under `docs/exec-plans/active/` and move completed plans to `docs/exec-plans/completed/`.

## `.agent/`

Runtime and orchestration material:

- gate manifests
- run records and artifacts
- normalized resource-use records
- Change resource and resolution summaries
- local workpad mirrors when useful
- logs and evidence directories.

Do not place durable ExecPlans or initiative theses here if they need to survive as versioned project knowledge.

Ignore run state such as `.agent/runs/`, `.agent/changes/`, `.agent/workpads/`, and `.agent/run.env` unless the project has a deliberate reason to version it. Persist or upload the resource summaries and evidence needed for the Change Record before teardown. Keep gate manifests versioned. The starter templates include a `.gitignore.agent-delivery` snippet.

## `data/` and `scripts/economics/`

Dated model pricing, editable workload assumptions, and a dependency-free calculator. Keep the doctrine evergreen; keep volatile prices here.

A production implementation may store delivery events in a database rather than committed files. The repository should still define the schema, IDs, retention, and links needed to connect the data back to Changes and initiatives.

## `.agents/skills/`

Reusable procedures that teach agents how the team expects important steps to be performed.

## Rule

If agents keep making the same mistake, the repository is probably missing context, a boundary, a gate, a useful procedure, or a decision rule.

If comparable Changes keep costing more than expected, the repository may also be exposing architectural friction, weak observability, poor shaping, or a missing skill.

Add the smallest durable structure that prevents the mistake or uncertainty from recurring.
