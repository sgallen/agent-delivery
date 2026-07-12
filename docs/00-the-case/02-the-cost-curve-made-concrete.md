# The Cost Curve Made Concrete

“The economics changed” can sound like one of those statements that is both obviously important and conveniently difficult to pin down.

So put numbers around it.

As of **July 11, 2026**, representative API list prices for capable current models range from roughly **$1 to $10 per million input tokens** and **$4.40 to $50 per million output tokens**. The exact price depends on model, context length, caching, service tier, and provider. The broader point is less delicate: meaningful product-development capability is now available at a marginal cost that bears little resemblance to staffing a human-only implementation team.

## A deliberately heavy scenario

Assume one continuously available agent workload consumes:

```text
10 million uncached input tokens per day
2 million output tokens per day
30 days per month
```

That is **300 million input tokens** and **60 million output tokens** in a month. It is intentionally heavy. It excludes caching discounts, environment costs, tool calls, retries, and builder attention so the arithmetic remains visible.

At current standard list prices, the modeled monthly token cost is:

| Provider | Model | Monthly cost |
|---|---|---:|
| Anthropic | Claude Haiku 4.5 | $600 |
| OpenAI | GPT-5.6 Luna | $660 |
| Z.AI | GLM-5.2 | $684 |
| Anthropic | Claude Sonnet 5, introductory price | $1,200 |
| OpenAI | GPT-5.3-Codex | $1,365 |
| OpenAI | GPT-5.6 Terra | $1,650 |
| Anthropic | Claude Opus 4.8 | $3,000 |
| OpenAI | GPT-5.6 Sol | $3,300 |
| Anthropic | Claude Fable 5 | $6,000 |

Claude Sonnet 5 moves from its introductory $2/$10 input/output price to $3/$15 on September 1, 2026; under the same scenario that would be $1,800 per month.

For orientation, public U.S. data reports a median software-developer wage of $133,080. Applying the private-industry compensation mix as an approximate benefits uplift produces an employer-compensation benchmark of about **$190,000 per year, or $15,800 per month**. This is a benchmark, not a universal senior-engineer price tag. Geography, company stage, benefits, equity, equipment, recruiting, and management overhead can move the real number substantially.

This is not a claim that one agent equals one employee. It does not. Builders bring customer context, judgment, accountability, taste, relationships, initiative, and hard-earned pattern recognition. A token table is not going to take a customer call or feel uneasy about a technically correct but strategically foolish decision.

It does show that the cost envelopes are now meaningfully different. The lowest modeled monthly usage is a small fraction of the benchmark; even the highest is well below half. Whether that spend is economically useful depends on the trustworthy outcomes it produces and the builder attention it consumes.

## “Running 24/7” needs one clarification

An agent can be available around the clock, but API inference is not normally billed by calendar hour. It is billed by usage. Managed runtimes may add a smaller time-based charge while the environment is actually running.

For example, Anthropic currently lists Claude Managed Agents runtime at $0.08 per running session-hour. Seven hundred and twenty continuously running hours would add $57.60 in runtime charges before tokens. OpenAI lists a 1 GB hosted shell or Code Interpreter container at $0.03 per 20 minutes, which is $64.80 for the same continuous 720-hour month before tokens. Larger sandboxes, browsers, databases, CI fleets, and observability will cost more.

The useful comparison is not “agent hourly wage versus human hourly wage.” That is memorable, but a little too neat for the world we actually live in.

The useful comparison is:

```text
model usage
+ tools
+ execution environments
+ retries and failed runs
+ builder attention
= total recorded cost per trustworthy outcome
```

“Recorded” matters. Subscription usage, local compute, direct-provider calls, and unmeasured human work can make the record incomplete. A credible system shows its assumptions and missing data instead of turning an API bill into a complete theory of product development.

## The operating implication

A cheap model is not cheap if it needs three attempts and consumes two hours of staff-engineer review. A premium model may be the economical choice if it completes a difficult Change cleanly in one pass. A smaller model may be ideal for narrow, well-gated work.

That is why a mature team uses a small metric set rather than one denominator: **cost per trustworthy landed Change** for delivery work, **cost per evidence-backed decision** for exploratory work, builder attention by resolution class, resolution and landing yield, and the resulting defect, rework, or unresolved-loss rate.

At the initiative level, cost is only half the question. The organization must later compare the complete investment with the customer, business, operational, or strategic value that appeared. Cheap delivery of an unhelpful capability is still a poor investment.

The numbers will move. The operating implication is already here.

See [Model Economics](../03-reference/model-economics.md) for the dated pricing table, assumptions, caveats, and calculator, then use [Measure Delivery Economics](../02-playbooks/measure-delivery-economics.md) to replace estimates with your own run data.

## Sources for this snapshot

- [OpenAI API pricing](https://developers.openai.com/api/docs/pricing)
- [OpenAI GPT-5.3-Codex](https://developers.openai.com/api/docs/models/gpt-5.3-codex)
- [Anthropic model pricing](https://platform.claude.com/docs/en/about-claude/pricing)
- [Z.AI model pricing](https://docs.z.ai/guides/overview/pricing)
- [U.S. Bureau of Labor Statistics: Software Developers](https://www.bls.gov/ooh/computer-and-information-technology/software-developers.htm)
- [U.S. Bureau of Labor Statistics: Employer Costs for Employee Compensation](https://www.bls.gov/ecec/)

[← The Economics Changed](01-the-economics-changed.md) · Next: [Current Capability Is Enough](03-current-capability-is-enough.md) →
