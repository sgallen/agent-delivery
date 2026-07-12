# Playbook: Add Browser Proof

Use this when a Change affects user-visible behavior.

“Tests passed” is necessary in many projects. It is not always enough to show that the product behaves or looks right.

## Goal

Make browser behavior observable to agents and reviewable by builders.

## Step 1: Name the journey

Identify the smallest route or user flow that proves the Change:

- `/settings/notifications`
- checkout happy path
- account creation
- empty state
- modal interaction
- responsive layout.

Avoid “test the whole app.” That is not a journey. It is a plea.

## Step 2: Translate acceptance criteria into observations

Examples:

- the expected heading is visible
- the primary action completes successfully
- validation appears at the right time
- no unrequested header action appears
- the empty-state copy is correct
- no unexpected console, page, or network errors occur.

Each observation should be specific enough to test or show.

## Step 3: Give the agent browser access

Provide an isolated browser profile and a tool such as Chrome DevTools MCP or Playwright. Attribute the browser session, preview environment, and retained artifacts to the Change when the workflow measures environment use.

Use the browser tool for exploration and debugging. Use deterministic browser automation for repeatable proof in CI.

Tools provide access. A browser skill should define the team’s preferred validation procedure.

## Step 4: Capture the right evidence

Depending on the Change, capture:

- before and after screenshots
- short video for interaction-heavy behavior
- DOM or accessibility snapshot
- console and page-error summary
- network-failure summary
- browser trace for failures
- preview or deployment URL.

Evidence should map back to acceptance criteria, not simply prove that a browser existed.

## Step 5: Add a deterministic gate

The gate should state:

- the route or journey
- setup data or account state
- observable assertions
- permitted errors, if any
- artifacts to retain
- retry and failure behavior
- resource or lease limits for expensive browser, device, or preview environments.

Make the test stable enough to trust. A flaky green check is a decorative light.

## Step 6: Link the evidence

Store large files in CI artifacts or the configured evidence store.

Link the concise result from the workpad and PR.

## Definition of done

Browser proof is useful when:

- another builder can understand the outcome without running the app locally
- the agent can use the same surface to debug a failure
- CI can repeat the critical journey
- unexpected console/runtime failures are visible
- repeated visual or behavioral regressions can be promoted into gates
- environment cost and flaky retries are visible enough to improve the proof strategy.
