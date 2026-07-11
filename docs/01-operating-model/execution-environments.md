# Execution Environments

A worktree isolates code.

An execution environment isolates the runtime world.

Agent-enabled delivery needs both.

## Why a worktree is not enough

A Git worktree gives an Active Change its own checkout and branch. It does not isolate:

- ports
- databases
- queues and caches
- browser sessions
- environment variables
- temporary files
- object storage
- logs
- credentials
- running processes.

If two agents share too much mutable state, they will eventually interfere with each other. Then the team gets to debug the product, the agent, and the environment at the same time. This is not a prize.

## The three layers

```text
Worktree
  Source code and branch state.

Execution environment
  Dependencies, services, database, ports, environment variables, and app process.

Browser/debug environment
  Browser profile, DevTools connection, screenshots, traces, console, and network logs.
```

Every run should have an identity and known locations for:

- Change ID and run ID
- branch and worktree
- app and API endpoints
- database/cache namespace
- browser profile and debug endpoint
- log directory
- evidence directory
- startup and teardown commands.

## Maturity path

Start simple and earn complexity.

### Stage 1: Local single-run

One worktree, app instance, and browser profile.

### Stage 2: Local limited parallelism

Multiple worktrees with unique ports, per-run environment files, isolated browser profiles, and namespaced services.

### Stage 3: Containerized parallelism

A Docker Compose project or devcontainer per Change.

### Stage 4: Cloud task environments

A sandbox, VM, container, or hosted development environment per Change.

### Stage 5: Elastic orchestration

A scheduler dispatches Changes to local or cloud runners based on risk, priority, cost, and resource needs.

## Environment gate

Before trusting evidence, confirm:

- the Change ran from the expected commit
- required services were healthy
- mutable state was isolated
- the browser profile belonged to the run
- logs and artifacts were written to the Change-specific location
- teardown completed or was deliberately preserved for investigation.

## Rule

No shared mutable runtime state between parallel Changes unless it is explicitly designed, namespaced, and observable.

If the environment is contaminated, the evidence is not evidence. It is a rumor with a timestamp.
