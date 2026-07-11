# Scaffolding Posture

Use the least rigid scaffolding that produces reliable outcomes.

The goal is not to replace human bureaucracy with agent bureaucracy. A ticket, workpad, gate, plan, or workflow should earn its keep by making intent, execution, proof, recovery, or learning clearer.

If an artifact does none of those things, remove it.

## The apparent contradiction

Useful examples of agent-enabled delivery can look very different.

The [Gusto Cofounder team](https://youtu.be/5FKBkUCaLa8) moved with almost no Jira, Figma, or written specification. Five people worked in a high-bandwidth environment, made ideas concrete quickly, and used working software as the decision surface.

The [Harness Engineering team](https://openai.com/index/harness-engineering/) invested deeply in structured repository knowledge, executable architecture rules, isolated environments, browser access, observability, skills, and recurring cleanup.

Those approaches are not as contradictory as they first appear.

The right amount of structure depends on:

- team size and trust
- synchronous versus asynchronous work
- codebase size and age
- risk and regulatory burden
- how many agents run in parallel
- how long work must survive without the original context
- how observable and reversible the outcome is.

A five-person team in a shared room can carry more context in conversation. An always-on agent system working across many Changes cannot safely depend on the right person remembering what was said Tuesday afternoon.

The principle is not “write more process.” It is “make the necessary context and quality bar legible to the people and agents doing the work.”

## Language-native scaffolding

As models become more capable, more workflow structure can live in readable language: `WORKFLOW.md`, workpads, skills, checklists, reviewer prompts, and optional ExecPlans that agents can follow and update.

Use language-native structure when the agent can reliably:

- follow the workflow
- maintain live state
- respond to gate feedback
- use the required tools
- produce evidence
- recognize when builder judgment is needed.

Examples:

- `WORKFLOW.md`
- workpad templates
- skills
- reviewer prompts
- ExecPlans for complex work.

## Code-native orchestration

External orchestration is still useful when the workflow needs:

- deterministic control flow
- durable external state
- strict branching or approvals
- scheduling across many workers
- compliance guarantees
- coordination across independent systems
- retries and recovery that cannot safely be delegated to the model.

Examples:

- queue workers
- state machines
- custom orchestrators
- workflow graphs
- cloud execution schedulers.

## The escalation rule

Start with readable documents, capable agents, and simple runners.

Add code when repeated failures show that language-native structure is not reliable enough.

Examples:

- agents forget a step → improve `WORKFLOW.md` or a skill
- state becomes inconsistent → add a durable run record
- retries become hard to reason about → add orchestration logic
- multiple workers collide → add a scheduler and environment manager
- approvals must be guaranteed → encode the state machine.

Also remove structure when it no longer earns its cost:

- a workpad section is never useful → delete it
- a review step repeats a gate with no added judgment → remove it
- a planning document is written after the decision is already obvious → stop writing it
- a meeting exists only to restate evidence already attached to the Change → cancel the meeting with uncommon enthusiasm.

Do not over-engineer for today’s limitations.

Do not under-govern real risk.

The right amount of scaffolding is the smallest amount that keeps the outcome trustworthy and the work resumable.
