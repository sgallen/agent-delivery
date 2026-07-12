# Playbook: Provision an Execution Environment

Use this when an agent needs to build, run, inspect, or prove a Change without interfering with other work.

## Goal

Give the Change a runtime world that another agent can start, observe, trust, and tear down.

## Step 1: Assign an identity

Record:

- Change ID;
- run ID;
- branch and commit;
- worktree path;
- environment class;
- start time.

Use the identity to namespace ports, services, logs, browser profiles, mutable data, and artifacts.

## Step 2: Choose the isolation level

### Milestone 1: Local isolation

```text
worktree
unique ports
per-run environment file
namespaced database or cache
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
browser and debug access
scoped identity and secrets
artifact upload
limits and teardown policy
```

Move up only when collisions, security, parallelism, recovery, or evidence quality justify it.

The cheapest environment per minute is not always the cheapest way to reach a trustworthy result. Slow startup, flaky state, and missing observability create their own bill, usually paid in human attention.

## Step 3: Make startup deterministic

The environment should have one documented command that:

- installs or verifies dependencies;
- starts required services;
- creates or loads test data;
- launches the product;
- reports endpoints;
- confirms health;
- prints the run identity and artifact paths.

The agent should not need local folklore to boot the product.

## Step 4: Expose the right signals

Provide:

- application and service logs;
- browser console and network activity;
- traces or metrics when relevant;
- health checks;
- artifact paths;
- the exact commit and configuration under test.

The agent needs feedback from the running system, not only the compiler.

## Step 5: Define teardown and recovery

State:

- idle timeout;
- maximum lifetime when one is needed;
- who can extend it;
- what survives teardown;
- how a stopped run resumes.

Provide one command that stops processes, releases ports, closes browser sessions, and removes or preserves temporary state according to policy.

Unbounded containers and browser processes are not a scaling strategy.

## Step 6: Add metering when it matters

When environment cost or capacity affects decisions, capture the material compute, storage, database, browser, CI, preview, and observability use. Keep raw units as well as cost, and associate them with the run and Change.

Do not make this mandatory for a local first experiment. Do not ignore it once environments become a meaningful constraint.

## Environment checklist

- [ ] Correct Change, run, branch, and commit identity
- [ ] Unique service namespaces and ports
- [ ] Isolated mutable data
- [ ] Isolated browser profile when needed
- [ ] Healthy required services
- [ ] Logs and artifacts stored by run ID
- [ ] Secrets scoped appropriately
- [ ] Teardown and recovery tested
- [ ] Resource events attributable when metering is enabled

## Definition of done

The environment is ready when another agent can start it, exercise the Change, collect trustworthy evidence, and tear it down without hidden local state or interference from another run.
