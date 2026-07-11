# Playbook: Start a Greenfield Project

Use this when starting a new product, side project, internal tool, or company from scratch.

## Goal

Create a product codebase and operating model that agents can work in from the beginning without burying the project under premature infrastructure.

Greenfield gives you an unusual advantage: no legacy process, no accidental architecture, and fewer mysterious files everyone is afraid to touch. Use it carefully. The absence of history is not permission to create a lot of future archaeology.

## Phase 1: Establish the spine

Create the minimum repo structure:

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
│   ├── decisions/
│   └── exec-plans/
│       ├── active/
│       └── completed/
├── .agent/
│   ├── gates/
│   └── runs/
├── .agents/
│   └── skills/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   └── workflows/
└── tests/
```

Keep `AGENTS.md` short. It is a map to the context, not the context itself.

## Phase 2: Choose simple defaults

Start with:

- GitHub Issues as the Change surface
- GitHub labels for lifecycle and risk
- Git worktrees for source isolation
- unique ports and browser profiles for runtime isolation
- `WORKFLOW.md` for the standing process
- one persistent workpad issue comment per orchestrated Change
- GitHub Actions for remote gates
- browser proof for user-visible work.

Use an architectural bias toward a modular monolith: simple deployment, explicit module boundaries, and room to split later when the business earns the complexity.

## Phase 3: Define the first lifecycle

Use one lifecycle consistently:

```text
Proposed → Shaped → Ready → Running → Proving → Review → Released
```

Define:

- who or what can move a Change between states
- what makes a Change ready
- which gates are required by Change class
- what evidence is expected
- which conditions engage a builder
- what blocks or stops a run.

## Phase 4: Create one gate profile

Do not begin with a cathedral of quality gates.

For a low-risk UI Change, start with:

- scope
- format/lint
- typecheck/build
- targeted tests
- browser behavior
- console/runtime errors
- evidence package.

Add architecture, design, security, performance, and other gates when the project or failure mode makes them real.

## Phase 5: Run the first experiment

Choose a small, observable, reversible Change and use the [First Experiment](first-experiment.md) playbook.

The point is to exercise the whole path:

```text
intent → workpad → environment → agent → gates → evidence → review → learning
```

Do not optimize for an impressive first Change. Optimize for a complete, inspectable one.

## Phase 6: Improve after three Changes

After three runs, review the system rather than only the output:

- Which intent fields were repeatedly missing?
- Which repo context did agents struggle to find?
- Which gates were useful or noisy?
- Which evidence helped a builder decide quickly?
- Where did the environment collide or drift?
- Which builder engagement was unnecessary?
- Which repeated procedure belongs in a skill?

Then make the smallest durable improvements.

## Definition of done

The greenfield foundation is ready when:

- a new builder or agent can find the product and architecture context
- a Change can move from issue to evidence-backed PR
- the runtime is isolated enough to trust the result
- the required gates are explicit
- the workpad tells the live story
- the first learning has been promoted into the system.

That is enough to begin. The operating model should grow with the product, not arrive fully armored before the first customer.
