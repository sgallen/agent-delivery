# Reference: Repo Structure

A good agent-enabled repository is legible to humans and agents.

The root should be a map, not a junk drawer.

## A credible starting point

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
│   └── exec-plans/
│       ├── active/
│       └── completed/
├── .agent/
│   ├── gates/
│   └── workpads/
├── .agents/
│   └── skills/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/
├── apps/
├── packages/
└── tests/
```

Not every project needs every directory. The point is to give stable context, live work, reusable procedures, and proof an obvious home.

## Root files

### `README.md`

The human entry point: what the product is, how to run it, and where deeper context lives.

### `AGENTS.md`

A short map for agents. Point to the right docs and repository rules. Do not turn it into the entire company handbook.

### `WORKFLOW.md`

The repo-level operating contract: readiness, workpads, environments, gates, evidence, stop behavior, review, resolution, and learning.

### `ARCHITECTURE.md`

The architectural map: modules, boundaries, dependency rules, and important design choices.

## `docs/`

Repository docs are part of the context system, not decoration.

Use them for stable product, design, architecture, regression, and optional ExecPlan context. Add `docs/initiatives/` and decision records when the project has product bets or durable decisions worth preserving.

Keep active ExecPlans under `docs/exec-plans/active/` and move completed plans to `docs/exec-plans/completed/`.

## `.agent/`

Runtime and orchestration material may include:

- gate manifests;
- local workpad mirrors;
- run logs and artifacts;
- resource-use records and Change summaries when measurement is enabled.

Do not place durable product theses or architecture decisions here if they need to survive as versioned project knowledge.

Ignore disposable run state unless the project has a reason to version it. Preserve the evidence needed for the Change Record before teardown.

## Advanced economics support

Projects using delivery economics may add:

```text
.agent/
├── run-resource-use.json
├── change-resource-summary.yml
├── runs/
└── changes/

data/
├── model-pricing.csv
└── economics-scenarios.csv

scripts/economics/
```

A production implementation may store events in a database rather than committed files. The repository should still define the IDs and links that connect those records back to Changes and initiatives.

## Rule

If agents keep making the same mistake, the repository is probably missing context, a boundary, a gate, a useful procedure, or a decision rule.

Add the smallest durable structure that prevents the mistake or uncertainty from recurring.
