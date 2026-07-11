# Playbook: Provision an Execution Environment

Use this when an agent needs to build, run, inspect, or prove a Change without interfering with other work.

## Goal

Give each Active Change an isolated enough runtime world to produce trustworthy evidence.

## Step 1: Assign a run identity

Record:

- Change ID
- run ID
- branch and commit
- worktree path
- runner identity
- start time.

Use the identity to namespace ports, services, logs, browser profiles, and artifacts.

## Step 2: Choose the isolation level

### Milestone 1: Local isolation

```text
worktree
unique ports
per-run environment file
namespaced database/cache
isolated browser profile
Change-specific logs and evidence
```

### Milestone 2: Container isolation

```text
Docker Compose or devcontainer per Change
dedicated network and service names
isolated volumes or test data
central artifact collection
```

### Milestone 3: Cloud sandbox

```text
one sandbox per Change
preconfigured dependencies
browser/debug access
scoped identity and secrets
artifact upload
resource limits and teardown policy
```

Move up only when collisions, resource needs, security, or parallelism justify it.

## Step 3: Make startup deterministic

The environment should have one documented command that:

- installs or verifies dependencies
- starts required services
- creates test data
- launches the app
- reports the endpoints
- confirms health.

The agent should not need local folklore to boot the product.

## Step 4: Connect observability

Expose:

- application logs
- browser console and network activity
- traces or metrics when relevant
- health checks
- artifact paths.

The agent needs feedback from the running system, not only the compiler.

## Step 5: Define teardown

Provide one command that stops processes, removes or preserves temporary state according to policy, releases ports, and records what was retained for investigation.

Unbounded containers and browser processes are not a scaling strategy.

## Environment checklist

- [ ] Correct branch and commit
- [ ] Unique service namespaces and ports
- [ ] Isolated mutable data
- [ ] Isolated browser profile
- [ ] Healthy required services
- [ ] Logs and artifacts stored by run ID
- [ ] Secrets scoped appropriately
- [ ] Teardown tested

## Definition of done

The environment is ready when another agent can start it, exercise the Change, collect evidence, and tear it down without depending on hidden local state or interfering with another run.
