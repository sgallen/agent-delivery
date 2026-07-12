# Playbook: Provision an Execution Environment

Use this when an agent needs to build, run, inspect, or prove a Change without interfering with other work.

## Goal

Give each Active Change an isolated enough runtime world to produce trustworthy evidence and attributable resource use.

## Step 1: Assign a run identity

Record:

- initiative ID, when present
- Change ID
- run ID
- branch and commit
- worktree path
- runner identity
- environment class
- start time
- resource-record path.

Use the identity to namespace ports, services, logs, browser profiles, artifacts, and metering events.

## Step 2: Choose the isolation level

### Milestone 1: Local isolation

```text
worktree
unique ports
per-run environment file
namespaced database/cache
isolated browser profile
Change-specific logs and evidence
estimated local resource use when material
```

### Milestone 2: Container isolation

```text
Docker Compose or devcontainer per Change
dedicated network and service names
isolated volumes or test data
central artifact collection
container runtime and storage metering
```

### Milestone 3: Cloud sandbox

```text
one sandbox per Change
preconfigured dependencies
browser/debug access
scoped identity and secrets
artifact upload
resource limits, metering, and teardown policy
```

Move up only when collisions, resource needs, security, attribution, or parallelism justify it.

The cheapest environment per minute is not automatically the cheapest environment per trustworthy resolution. Slow startup, flaky state, or missing observability can create much larger model and builder costs—and can prevent an experiment or investigation from reaching a useful decision at all.

## Step 3: Make startup deterministic

The environment should have one documented command that:

- installs or verifies dependencies
- starts required services
- creates test data
- launches the app
- reports the endpoints
- confirms health
- prints the run and resource identity.

The agent should not need local folklore to boot the product.

## Step 4: Connect observability and metering

Expose:

- application logs
- browser console and network activity
- traces or metrics when relevant
- health checks
- artifact paths
- environment start, stop, and retained-state events
- measured or estimated compute, storage, database, browser, CI, and preview cost when useful.

Keep raw units as well as cost. Pricing changes; compute hours and storage quantities remain useful for reconciliation.

The agent needs feedback from the running system, not only the compiler. The delivery record needs enough attribution to distinguish model spend from environment friction.

## Step 5: Set resource and teardown policy

Define:

- idle timeout
- maximum lifetime or spend
- warning and hard-stop behavior
- who can extend the lease
- which artifacts survive teardown
- how a stopped run can resume.

At a hard threshold, preserve workpad state, logs, artifacts, and the current forecast before ending the environment.

Provide one command that stops processes, removes or preserves temporary state according to policy, releases ports, closes the resource record, and records what was retained for investigation.

Unbounded containers and browser processes are not a scaling strategy.

## Environment checklist

- [ ] Correct initiative, Change, run, branch, and commit identity
- [ ] Unique service namespaces and ports
- [ ] Isolated mutable data
- [ ] Isolated browser profile
- [ ] Healthy required services
- [ ] Logs and artifacts stored by run ID
- [ ] Resource events attributable to the run
- [ ] Limits, idle timeout, and extension rule defined
- [ ] Secrets scoped appropriately
- [ ] Teardown and recovery tested

## Definition of done

The environment is ready when another agent can start it, exercise the Change, collect evidence, attribute its resource use, and tear it down without depending on hidden local state or interfering with another run.
