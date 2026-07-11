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
│   ├── decisions/
│   └── exec-plans/
│       ├── active/
│       └── completed/
├── .agent/
│   ├── gates/
│   ├── runs/
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

The repo-level operating contract: lifecycle, readiness, workpads, gates, evidence, retry/stop behavior, review, and learning.

### `ARCHITECTURE.md`

The architectural map: modules, boundaries, dependency rules, and important design choices.

## `docs/`

Repository docs are part of the context system, not decoration.

Use them for stable product, design, architecture, regression, decision, and optional ExecPlan context.

Keep active ExecPlans under `docs/exec-plans/active/` and move completed plans to `docs/exec-plans/completed/`.

## `.agent/`

Runtime and orchestration material:

- gate manifests
- run records and artifacts
- local workpad mirrors when useful
- logs and evidence directories.

Do not place durable ExecPlans here if they need to survive as versioned project knowledge.

Ignore run state such as `.agent/runs/`, `.agent/workpads/`, and `.agent/run.env` unless the project has a deliberate reason to version it. Keep gate manifests versioned. The starter templates include a `.gitignore.agent-delivery` snippet.

## `data/` and `scripts/economics/`

Dated model pricing, editable workload assumptions, and a dependency-free calculator. Keep the doctrine evergreen; keep volatile prices here.

## `.agents/skills/`

Reusable procedures that teach agents how the team expects important steps to be performed.

## Rule

If agents keep making the same mistake, the repository is probably missing context, a boundary, a gate, or a useful procedure.

Add the smallest durable structure that prevents the mistake from recurring.
