# Scaffolding Posture

Use the least rigid scaffolding that produces trustworthy work and useful learning.

The goal is not to replace human bureaucracy with agent bureaucracy. An issue, workpad, gate, plan, record, or workflow should earn its keep by making intent, execution, proof, recovery, judgment, or learning clearer.

If an artifact does none of those things, remove it.

## The apparent contradiction

Useful examples of agent-enabled delivery can look very different.

The [Gusto Cofounder team](https://youtu.be/5FKBkUCaLa8) moved with almost no Jira, Figma, or written specification. Five people worked in a high-bandwidth environment, made ideas concrete quickly, and used working software as the decision surface.

The [Harness Engineering team](https://openai.com/index/harness-engineering/) invested deeply in structured repository knowledge, executable architecture rules, isolated environments, browser access, observability, skills, and recurring cleanup.

Those approaches are not as contradictory as they first appear.

The right amount of structure depends on:

- team size and trust;
- synchronous versus asynchronous work;
- codebase size and age;
- risk and regulatory burden;
- how many agents run in parallel;
- how long work must survive without the original context;
- how observable and reversible the outcome is.

A five-person team in a shared room can carry more context in conversation. An always-on system working across many Changes cannot safely depend on the right person remembering what was said Tuesday afternoon.

The principle is not “write more process.” It is “make the context and quality bar legible where memory and proximity are no longer enough.”

## Start with readable structure

Capable agents can follow and update language-native artifacts:

- `WORKFLOW.md`;
- Change Intents;
- workpads;
- repository guides;
- skills;
- gate definitions;
- reviewer prompts;
- optional ExecPlans.

Use these when the agent can reliably follow the workflow, maintain state, use the required tools, respond to gate feedback, preserve evidence, and recognize when judgment is needed.

They are cheap to inspect and easy to change. That matters while the team is still learning what the system should be.

## Add code when language stops being enough

External orchestration earns its place when the workflow needs:

- deterministic control flow;
- durable state outside the repository;
- strict approvals or limits;
- scheduling across many workers;
- guaranteed retries and recovery;
- provider routing or usage reconciliation;
- compliance controls;
- coordination across independent systems.

Examples include queue workers, state machines, model gateways, schedulers, and environment managers.

Do not over-engineer for today’s limitations. Do not under-govern real risk.

## Let maturity add the next layer

A team may later need resource attribution, forecasts, thresholds, initiative records, or capacity views. Add them when a real decision requires them:

```text
basic run attribution
  → useful ranges and checkpoints
  → routing and estimation from comparable work
  → initiative and capacity planning
```

Do not require a team running its first bounded experiment to build a portfolio forecasting system. Do not let a mature multi-agent program claim that every resource decision is unknowable.

## The escalation rule

Start with readable documents, capable agents, simple runners, and strong evidence.

Add structure when repeated failure shows what is missing:

- agents forget a step → improve `WORKFLOW.md` or a skill;
- state becomes inconsistent → add a durable run record;
- parallel workers collide → add environment management;
- retries become hard to reason about → add orchestration;
- approvals must be guaranteed → encode the state machine;
- provider use escapes attribution → add a gateway or wrapper.

Remove structure when it stops earning its cost:

- a workpad section is never useful → delete it;
- a review step repeats a gate with no added judgment → remove it;
- a metric is collected but never changes a decision → stop collecting it;
- a meeting exists only to restate evidence already attached to the Change → cancel it with uncommon enthusiasm.

## Rule

The right amount of scaffolding is the smallest amount that keeps the outcome trustworthy, the work resumable, and the next decision better informed.
