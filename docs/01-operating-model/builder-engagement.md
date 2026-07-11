# Builder Engagement

The goal is not maximum agent autonomy.

The goal is maximum leverage from builder attention.

That means human engagement should be designed, not inherited from the old workflow. Builders should enter the Change where their context, taste, judgment, or accountability changes the outcome—not because every step historically required a person.

## The attention test

Before deciding how a Change should run, ask:

1. **Ambiguity:** Is the desired outcome clear, or does it require product discovery or interpretation?
2. **Consequence:** What happens if the system is wrong?
3. **Reversibility:** Can the Change be rolled back cheaply and safely?
4. **Observability:** Can the outcome be proven through tests, browser behavior, logs, or other evidence?
5. **System history:** Has the system handled this class of Change successfully before?
6. **Specialist judgment:** Does the work require product, design, engineering, security, legal, or domain expertise that is not yet encoded?

The answers determine where builder attention belongs.

## Engagement patterns

### Shape the intent

Use when the problem or outcome is not yet clear.

A builder clarifies the customer need, tradeoffs, constraints, non-goals, and evidence expectations before the system acts.

### Review the evidence

Use when the Change is observable, reversible, and well-gated.

The system performs the work. A builder reviews the outcome and evidence rather than every implementation detail.

### Make a judgment call

Use when the system reaches a real product, design, architecture, security, or business decision.

The agent should present the options, evidence, and tradeoffs clearly. The builder decides.

### Collaborate during execution

Use when the work is novel, high leverage, or difficult to specify upfront.

A builder and agents iterate together. The goal is not supervision for its own sake; it is to bring scarce context into the work at the moments it matters.

### Lead the work

Use when risk is high, evidence is weak, or the system has not earned trust for the Change class.

A builder leads and agents assist.

### Let the system handle it

Use when the intent is clear, the risk is bounded, the outcome is observable, the gates are strong, and the system has a good track record.

The system completes the Change and records the evidence without interrupting a builder unless a gate fails or judgment is required.

## The better question

Do not ask:

> How autonomous is the agent?

Ask:

> Where does builder attention materially improve this Change?

That keeps the product, the customer, and the risk at the center of the operating decision.
