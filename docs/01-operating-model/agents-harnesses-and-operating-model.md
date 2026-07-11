# Agents, Harnesses, and the Operating Model

Agents are first-class participants in product delivery, but they are not the whole system.

An **agent harness** is the technical system that lets an agent do useful work. It may include prompts, tools, context, permissions, workspaces, execution environments, browser access, logs, retries, validation, and stop conditions.

The **operating model** is broader. It includes builders, Change Intents, `WORKFLOW.md`, workpads, gates, evidence, review, architecture rules, design standards, learning checkpoints, release policies, and the cultural norms for how work moves.

The harness lets agents act.

The operating model decides what should be acted on, how quality is proven, where builder attention belongs, and how the system improves after each Change.

## Why the distinction matters

A strong harness can produce a lot of activity.

Without a strong operating model, that activity becomes noise.

The goal is not to give agents every tool and hope confidence emerges. Hope is not a control plane.

The goal is to give agents the right tools, context, and feedback, then surround their work with gates, evidence, review surfaces, and learning mechanisms that make the output useful.

## Practical rule

When an agent struggles, ask which layer failed:

- Did the harness lack a tool, permission, context source, or runtime environment?
- Did the workflow fail to explain how work should move?
- Did the Change Intent fail to define the goal or constraints?
- Did the workpad fail to capture live state?
- Did a gate fail to make quality explicit?
- Did the system fail to preserve the learning?

Do not simply blame the model. Sometimes the model is the problem. Often the system is.
