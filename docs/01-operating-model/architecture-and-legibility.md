# Architecture and Legibility

Agent-enabled systems need codebases that are easy to reason about.

This does not mean every company should start with microservices, Kubernetes, platform teams, and hyperscaler architecture. Many companies copied those patterns because large technology companies used them, not because their own product, scale, or team structure required them.

An agent-enabled product team should have an architectural bias toward simplicity, modularity, and legibility.

A modular monolith is a strong default instinct, not a law.

## Why modularity matters

Clear module boundaries help both humans and agents understand:

- where a Change belongs
- what it may affect
- which rules apply
- what can be tested
- what should not be touched.

A ball of mud is hard on humans. It is not magically easier for agents. It just lets them make mistakes faster.

## Stage-appropriate architecture

The enemy is not services.

The enemy is unnecessary complexity.

The goal is stage-appropriate architecture: simple enough to move fast, structured enough not to decay, and modular enough to split later if the business earns that complexity.

If a module eventually needs to scale independently or move to a dedicated team, clean boundaries make that path possible.

Do not buy distributed-systems problems before the business has earned them. They are available later. Usually with interest.

## Make boundaries executable

Architecture guidance should not live only in prose.

Important boundaries should become:

- forbidden import rules
- dependency direction checks
- package boundary lints
- architecture tests
- code generation constraints
- reviewer-agent checks.

The more repeatable the rule, the less it should depend on a human noticing it in review.
