# Execution Environments

A worktree isolates code.

An execution environment isolates the runtime world.

Agent-enabled delivery often needs both. An agent cannot prove behavior it cannot run, observe, or separate from somebody else’s work.

## Why a worktree is not enough

A Git worktree gives a Change its own checkout and branch. It does not isolate:

- ports;
- databases;
- queues and caches;
- browser sessions;
- environment variables;
- temporary files;
- object storage;
- logs;
- credentials;
- running processes.

If two runs share too much mutable state, they will eventually interfere with each other. Then the team gets to debug the product, the agent, and the environment at the same time. This is not a prize.

## The three layers

```text
Worktree
  Source code and branch state.

Execution environment
  Dependencies, services, data, ports, variables, and app processes.

Browser or debug environment
  Browser profile, debug connection, screenshots, traces, console, and network logs.
```

Every meaningful run should have a known identity and known locations for its branch, worktree, endpoints, mutable state, logs, evidence, and startup and teardown commands.

## Grow isolation with the work

Start simple and earn complexity.

### Stage 1: Local single run

One worktree, app instance, and browser profile.

### Stage 2: Local limited parallelism

Multiple worktrees with unique ports, per-run environment files, isolated browser profiles, and namespaced services.

### Stage 3: Containerized parallelism

A Docker Compose project, devcontainer, or equivalent per Change.

### Stage 4: Cloud task environments

A sandbox, VM, container, or hosted development environment per Change.

### Stage 5: Elastic orchestration

A scheduler dispatches Changes according to risk, priority, environment needs, and available capacity.

Do not jump to stage five because the diagram is attractive. Move when collisions, security, scale, recovery, or evidence quality justify it.

## Make the environment observable

The agent needs feedback from the running system, not only the compiler.

Expose the signals required to judge the Change:

- application and service logs;
- browser console and network activity;
- health checks;
- traces or metrics when relevant;
- deterministic test data;
- clear artifact locations;
- the commit and configuration that produced the evidence.

Before trusting the result, confirm that the expected commit ran, required services were healthy, mutable state was isolated, artifacts belong to this run, and teardown either completed or was deliberately postponed for investigation.

If the environment is contaminated, the evidence is not evidence. It is a rumor with a timestamp.

## Meter it when the decision needs it

At greater scale, the environment is also a delivery resource. Sandboxes, CI, browser sessions, databases, previews, storage, and observability can materially affect the cost and capacity of the system.

When that matters, associate measured or estimated use with the run and Change. Keep the raw units and the cost basis. Use the data to find environment friction and capacity constraints, not to turn the first experiment into cloud accounting.

## Rule

No shared mutable runtime state between parallel Changes unless it is deliberately namespaced and observable.

Choose the lightest environment that can still produce trustworthy evidence and a clean recovery path.
