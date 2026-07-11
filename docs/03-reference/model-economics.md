# Model Economics

> **Pricing snapshot:** July 11, 2026
>
> **Currency:** USD
>
> **Purpose:** make the economic claim inspectable, not immortalize a price sheet.

Model prices change. Model behavior changes faster. Treat this page as a dated reference and update the source data before making a consequential budget decision.

## Representative current models

These are standard direct-API list prices per million tokens. OpenAI figures use the short-context standard tier. Anthropic cached input represents cache hits; cache writes are priced separately. Partner clouds, priority processing, long context, regional processing, subscriptions, and negotiated discounts can differ.

This comparison uses API pricing rather than individual coding subscriptions. Subscriptions can be excellent value, but quotas, rate limits, promotions, and fair-use rules make them a poor basis for modeling a production system that may run many Changes in parallel.

| Provider | Model | Official positioning | Input | Cached input | Output |
|---|---|---|---:|---:|---:|
| OpenAI | GPT-5.6 Luna | cost-sensitive, high-volume work | $1.00 | $0.10 | $6.00 |
| OpenAI | GPT-5.6 Terra | balance intelligence and cost | $2.50 | $0.25 | $15.00 |
| OpenAI | GPT-5.6 Sol | complex reasoning and coding | $5.00 | $0.50 | $30.00 |
| OpenAI | GPT-5.3-Codex | agentic coding | $1.75 | $0.175 | $14.00 |
| Anthropic | Claude Haiku 4.5 | fastest, cost-efficient model | $1.00 | $0.10 | $5.00 |
| Anthropic | Claude Sonnet 5 | speed and intelligence | $2.00 | $0.20 | $10.00 |
| Anthropic | Claude Opus 4.8 | complex agentic coding | $5.00 | $0.50 | $25.00 |
| Anthropic | Claude Fable 5 | highest-capability, long-running agents | $10.00 | $1.00 | $50.00 |
| Z.AI | GLM-5.2 | long-horizon, project-scale engineering | $1.40 | $0.26 | $4.40 |

Claude Sonnet 5’s $2/$10 pricing is introductory through August 31, 2026. Its published standard price beginning September 1, 2026 is $3/$15, with cache hits at $0.30 per million tokens.

## A reproducible scenario

The committed example uses:

```text
300 million uncached input tokens per month
60 million output tokens per month
no cache discount
no tool, runtime, or environment charge
```

Run it yourself:

```bash
python scripts/economics/calculate.py \
  --date 2026-07-11 \
  --scenario heavy-continuous
```

The prices and their `verified_on` date live in `data/model-pricing.csv`. Scenario assumptions live in `data/economics-scenarios.csv`. Both are intentionally plain files so a builder can inspect and change them without reverse-engineering a dashboard.

## What “24/7” actually costs

Around-the-clock availability is operationally important. It is not, by itself, a token bill.

- API model usage is generally billed for tokens and tools consumed.
- Anthropic Managed Agents currently adds $0.08 per running session-hour and does not charge idle time.
- OpenAI currently lists hosted shell and Code Interpreter containers by size, beginning at $0.03 per 20 minutes for 1 GB, with minute billing and a five-minute minimum for eligible sessions.
- Your own cloud VM, browser, database, storage, CI, observability, and egress costs need to be added separately.

A continuously running lightweight sandbox can cost tens of dollars per month. A fleet of large browser-enabled environments can cost substantially more. Measure rather than assume.

## Why raw token comparison is incomplete

The providers do not tokenize identical text identically. Anthropic notes that several newer models produce roughly 30% more tokens for the same text than its earlier tokenizer. Context tiers, cache writes, reasoning tokens, image inputs, tool schemas, search results, and long-running transcripts can all change the bill.

More importantly, cost per token is not cost per useful outcome.

The economic unit worth managing is:

```text
model cost
+ tool cost
+ environment cost
+ failed-attempt cost
+ builder-attention cost
= total Change cost
```

Then pair it with:

```text
accepted outcome
cycle time
first-pass gate success
rework and rollback rate
builder minutes
```

## Model routing

Do not pick one model and turn it into company religion.

Route by the work:

- narrow, objective, strongly gated tasks can use lower-cost models;
- ambiguous, long-horizon, or high-consequence work may justify a more capable model;
- failed gates, repeated retries, or low confidence can trigger escalation;
- a model that costs more per token may cost less per accepted Change.

The router should improve from observed outcomes, not benchmark fandom.

## Employer-cost benchmark

The calculator includes an editable `employer_cost_benchmark_annual_usd` assumption. The committed example uses **$190,000 per year**, or about **$15,833 per month**, in U.S. dollars.

The benchmark is intentionally ordinary rather than heroic. The U.S. Bureau of Labor Statistics reports a median software-developer wage of $133,080 for May 2024. In March 2026, wages represented 69.9% of average private-industry employer compensation and benefits represented 30.1%. Applying that aggregate compensation mix to the software-developer median produces an approximate employer-compensation cost of about $190,000 per year.

This is not a universal senior-engineer cost and should not be presented as one. The benefits ratio is an economy-wide approximation, not a software-specific load factor. Geography, currency, company stage, equity, recruiting, equipment, office costs, management overhead, and local employment rules can move the actual number substantially.

Use the committed value only as a familiar orientation point. Replace it with your own employer-cost benchmark when evaluating a real team, and do not mix U.S.-dollar API prices with payroll figures in another currency without converting them.

Do not interpret the comparison as replacement equivalence. Interpret it as evidence that implementation capacity now has a radically different marginal cost and can be provisioned differently. The actual operating metric remains total cost per accepted Change.

## Maintenance policy

Review this snapshot:

- quarterly;
- when a major model generation launches;
- before publishing a cost claim externally;
- when measured Change economics diverge materially from the assumptions.

Record the date and use official provider sources. Do not quietly preserve an old number because it makes a better slide.

## Official sources

- [OpenAI models](https://developers.openai.com/api/docs/models)
- [OpenAI API pricing](https://developers.openai.com/api/docs/pricing)
- [OpenAI GPT-5.3-Codex](https://developers.openai.com/api/docs/models/gpt-5.3-codex)
- [Anthropic models overview](https://platform.claude.com/docs/en/about-claude/models/overview)
- [Anthropic pricing](https://platform.claude.com/docs/en/about-claude/pricing)
- [Z.AI GLM-5.2](https://docs.z.ai/guides/llm/glm-5.2)
- [Z.AI pricing](https://docs.z.ai/guides/overview/pricing)
- [U.S. Bureau of Labor Statistics: Software Developers](https://www.bls.gov/ooh/computer-and-information-technology/software-developers.htm)
- [U.S. Bureau of Labor Statistics: Employer Costs for Employee Compensation](https://www.bls.gov/ecec/)
