# Glossary

A small vocabulary for the playbook.

Use these terms consistently. The reader has enough to keep in working memory already.

## Agent

A model operating inside a harness that can use tools, inspect context, take actions, observe results, and iterate toward a goal.

## Agent harness

The technical system that makes agent work possible: prompts, tools, context, permissions, workspaces, execution environments, browser access, logs, retries, validation, and stop conditions.

## Builder

A human who helps turn customer understanding into shipped product value.

Builders may specialize in product, engineering, design, UX, research, support, security, operations, data, sales, or customer success.

## Builder attention

The scarce human resource in agent-enabled delivery: context, taste, judgment, product intuition, architecture sense, risk awareness, creativity, curation, and accountability.

## Builder engagement

The deliberate decision about where human attention enters a Change: shaping intent, reviewing evidence, resolving a specialist decision, collaborating during execution, leading the work, or not being interrupted unless a gate fails.

## Change

The unit of product work.

A Change begins as intent, moves through workflow, execution, gates, evidence, and review, and ends as a record of the outcome and learning.

## Change Intent

The stable request for a Change: outcome, context, acceptance criteria, non-goals, forbidden changes, risk, gate profile, and validation expectations.

In the default GitHub implementation, it lives in the issue body.

## Workpad

The live per-Change execution surface.

In the default GitHub implementation, it is one persistent issue comment headed `## Agent Workpad`.

## Change Record

The durable completed history across the issue, workpad, PR, gate results, evidence, release notes, and learning checkpoint.

## Gate

A reusable quality, risk, behavior, architecture, or taste check with a clear result, evidence, and failure action.

Gates may be mechanical, behavioral, or judgment-oriented.

## Evidence

The material that makes work reviewable: tests, screenshots, logs, traces, video, reports, reviewer findings, deployment links, and acceptance-criteria mapping.

## Skill

A reusable procedure that teaches agents how the team expects an important step to be performed.

Tools provide capability. Skills provide technique.

## `WORKFLOW.md`

The repo-level operating contract for lifecycle, readiness, workpads, gates, evidence, stop conditions, review, and learning.

## ExecPlan

An optional, self-contained living plan for complex, ambiguous, risky, or long-running work.

Every orchestrated Change needs a workflow and workpad. Only some Changes need an ExecPlan.

## Execution environment

The isolated runtime world for a Change: services, data, ports, browser profile, logs, and artifacts. A worktree isolates code; an execution environment isolates behavior.

## Reviewer agent

An independent, narrowly scoped agent that evaluates one concern such as scope, code quality, design, architecture, security, or test sufficiency.

## Learning checkpoint

A lightweight end-of-Change question:

> Did this reveal anything that should make the next Change easier, safer, faster, or better?

## Operating model

The broader system that makes agent-enabled product delivery useful: builders, Changes, workflow, workpads, harnesses, gates, evidence, review, architecture, skills, and learning.
