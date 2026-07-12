# Scaffolding Posture

Use the least rigid scaffolding that produces reliable outcomes and useful learning.

The goal is not to replace human bureaucracy with agent bureaucracy. A ticket, initiative record, workpad, resource record, gate, plan, or workflow should earn its keep by making intent, execution, proof, resource use, recovery, value, or learning clearer.

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
- how observable and reversible the outcome is
- whether resource thresholds or investment decisions need durable evidence
- whether the work belongs to a material initiative whose value will be reviewed later.

A five-person team in a shared room can carry more context in conversation. An always-on agent system working across many Changes cannot safely depend on the right person remembering what was said Tuesday afternoon.

The principle is not “write more process.” It is “make the necessary context, resource decisions, and quality bar legible to the people and agents doing the work.”

## Stage economic structure with maturity

Resource observability can be foundational without making maximum financial control mandatory.

A team can progress through:

```text
attribution
  → ranges and confidence
  → thresholds and forecasts
  → learned routing and estimation
  → initiative and capacity planning
```

Do not require a team running its first bounded experiment to build a portfolio forecasting system. Do not let a mature multi-agent program hide behind the claim that every resource decision is unknowable.

Add structure when a real decision needs it:

- a run needs attribution to a Change
- a Change needs a forecast or threshold
- an initiative needs an investment and value record
- a portfolio needs a capacity view
- a team needs to know which constraint the next dollar should relieve.

## Language-native scaffolding

As models become more capable, more workflow structure can live in readable language: `WORKFLOW.md`, workpads, skills, checklists, reviewer prompts, initiative records, and optional ExecPlans that agents can follow and update.

Use language-native structure when the agent can reliably:

- follow the workflow
- maintain live state
- respond to gate and resource feedback
- use the required tools
- produce evidence
- preserve estimates and actuals without rewriting history
- recognize when builder judgment is needed.

Examples:

- `WORKFLOW.md`
- workpad and initiative templates
- resource-record schemas
- skills
- reviewer prompts
- ExecPlans for complex work.

## Code-native orchestration

External orchestration is still useful when the workflow needs:

- deterministic control flow
- durable external state
- strict branching, limits, or approvals
- scheduling across many workers
- provider routing and usage reconciliation
- compliance guarantees
- coordination across independent systems
- retries and recovery that cannot safely be delegated to the model.

Examples:

- queue workers
- state machines
- model gateways and metering layers
- custom orchestrators
- workflow graphs
- cloud execution schedulers.

## The escalation rule

Start with readable documents, capable agents, simple runners, and honest attribution.

Add code when repeated failures show that language-native structure is not reliable enough.

Examples:

- agents forget a step → improve `WORKFLOW.md` or a skill
- state becomes inconsistent → add a durable run record
- direct-provider use escapes attribution → add a gateway or wrapper
- retries become hard to reason about → add orchestration logic
- resource limits are not enforced → add deterministic policy checks
- multiple workers collide → add a scheduler and environment manager
- approvals must be guaranteed → encode the state machine
- estimates remain uncalibrated → add comparable-work retrieval and evaluation.

Also remove structure when it no longer earns its cost:

- a workpad section is never useful → delete it
- a review step repeats a gate with no added judgment → remove it
- a planning document is written after the decision is already obvious → stop writing it
- a metric is collected but never changes a decision → stop collecting or redesign it
- a meeting exists only to restate evidence already attached to the Change → cancel the meeting with uncommon enthusiasm.

Do not over-engineer for today’s limitations.

Do not under-govern real risk, resource exposure, or product investment.

The right amount of scaffolding is the smallest amount that keeps the outcome trustworthy, the work resumable, and the next decision better informed.
