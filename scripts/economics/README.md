# Economics calculator

This small calculator keeps the economic examples inspectable rather than hiding assumptions inside prose.

```bash
python scripts/economics/calculate.py \
  --date 2026-07-11 \
  --scenario heavy-continuous
```

Try the cache scenario:

```bash
python scripts/economics/calculate.py \
  --date 2026-07-11 \
  --scenario heavy-continuous-60pct-cache
```

Edit `data/model-pricing.csv` when official prices change. Edit `data/economics-scenarios.csv` to match observed workloads or your own employer-cost benchmark.

The calculator compares modeled cost envelopes. It does not claim that model usage and an employer-cost benchmark are interchangeable units of productive capacity.

The calculator prints the committed `verified_on` date and warns when the newest price verification is more than 90 days older than the scenario date.
