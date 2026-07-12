# Agents, Harnesses, and the Operating Model

Agents can participate directly in product delivery. They are not the delivery system.

An **agent harness** gives an agent the practical ability to work: context, tools, permissions, a workspace, an execution environment, browser access, logs, retries, validation, and stop conditions.

The **operating model** is the larger human and technical system around that harness. It decides which work matters, how intent is shaped, what agents may do, how quality is proven, where judgment belongs, how failures recover, and what the team learns afterward.

The harness lets an agent act.

The operating model makes that action useful.

## Why the distinction matters

A capable harness can produce a great deal of activity. Activity is not the same thing as product progress.

Without a clear operating model, agents amplify whatever already exists: good context and good judgment when the team has them; ambiguity, hidden coupling, weak proof, and review queues when it does not.

The answer is not to keep adding tools until confidence appears. Hope is not a control plane.

The answer is to give agents enough capability to attempt the work, then make the surrounding expectations explicit:

- a clear Change Intent;
- repository context and boundaries;
- one live workpad;
- an environment that can expose real behavior;
- gates tied to the claim;
- evidence a builder can judge;
- stop and recovery rules;
- an accountable outcome;
- a learning checkpoint.

## Diagnose the system, not only the model

When a run struggles, ask which layer failed:

- Was the goal or boundary unclear?
- Was the repository missing context?
- Did the harness lack a tool, permission, or runtime signal?
- Did the environment make trustworthy proof impossible?
- Did the workflow fail to explain retries, handoffs, or stopping?
- Did a gate detect the problem too late?
- Was builder judgment needed but never requested?
- Was the selected model simply a poor fit?

Sometimes the model is the problem. Often the system is giving it a bad job in a bad room with no useful way to know it is wrong.

## What can come later

Once the core path works, the operating model can grow to include model routing, resource attribution, spend thresholds, initiative forecasts, capacity planning, and value reviews.

Those are meaningful extensions. They do not replace the basic obligation to turn intent into trustworthy evidence and an accountable decision.

## Rule

Build the smallest harness that can do the work and the smallest operating model that can make the result trustworthy.

Then improve the layer that reality shows is weak.
