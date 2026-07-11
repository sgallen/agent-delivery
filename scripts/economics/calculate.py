#!/usr/bin/env python3
"""Calculate transparent model-cost scenarios from repository CSV data.

This intentionally models only the inputs supplied. It does not claim that
model usage and an employer-cost benchmark are equivalent units of productive
capacity.
"""

from __future__ import annotations

import argparse
import csv
import json
from dataclasses import dataclass
from datetime import date
from decimal import Decimal
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_PRICING = ROOT / "data" / "model-pricing.csv"
DEFAULT_SCENARIOS = ROOT / "data" / "economics-scenarios.csv"


@dataclass(frozen=True)
class Price:
    verified_on: date
    provider: str
    model_id: str
    display_name: str
    role: str
    input_per_mtok: Decimal
    cached_input_per_mtok: Decimal
    output_per_mtok: Decimal
    valid_from: date | None
    valid_through: date | None
    pricing_basis: str
    source_url: str
    notes: str


@dataclass(frozen=True)
class Scenario:
    name: str
    days: int
    uncached_input_tokens_per_day: Decimal
    cached_input_tokens_per_day: Decimal
    output_tokens_per_day: Decimal
    runtime_hours_per_month: Decimal
    runtime_rate_per_hour: Decimal
    tool_cost_per_month: Decimal
    environment_cost_per_month: Decimal
    employer_cost_benchmark_annual_usd: Decimal
    description: str


def parse_optional_date(value: str) -> date | None:
    return date.fromisoformat(value) if value.strip() else None


def load_prices(path: Path) -> list[Price]:
    with path.open(newline="", encoding="utf-8") as handle:
        return [
            Price(
                verified_on=date.fromisoformat(row["verified_on"]),
                provider=row["provider"],
                model_id=row["model_id"],
                display_name=row["display_name"],
                role=row["role"],
                input_per_mtok=Decimal(row["input_per_mtok"]),
                cached_input_per_mtok=Decimal(row["cached_input_per_mtok"]),
                output_per_mtok=Decimal(row["output_per_mtok"]),
                valid_from=parse_optional_date(row["valid_from"]),
                valid_through=parse_optional_date(row["valid_through"]),
                pricing_basis=row["pricing_basis"],
                source_url=row["source_url"],
                notes=row["notes"],
            )
            for row in csv.DictReader(handle)
        ]


def load_scenarios(path: Path) -> dict[str, Scenario]:
    with path.open(newline="", encoding="utf-8") as handle:
        scenarios = {}
        for row in csv.DictReader(handle):
            scenario = Scenario(
                name=row["name"],
                days=int(row["days"]),
                uncached_input_tokens_per_day=Decimal(row["uncached_input_tokens_per_day"]),
                cached_input_tokens_per_day=Decimal(row["cached_input_tokens_per_day"]),
                output_tokens_per_day=Decimal(row["output_tokens_per_day"]),
                runtime_hours_per_month=Decimal(row["runtime_hours_per_month"]),
                runtime_rate_per_hour=Decimal(row["runtime_rate_per_hour"]),
                tool_cost_per_month=Decimal(row["tool_cost_per_month"]),
                environment_cost_per_month=Decimal(row["environment_cost_per_month"]),
                employer_cost_benchmark_annual_usd=Decimal(row["employer_cost_benchmark_annual_usd"]),
                description=row["description"],
            )
            scenarios[scenario.name] = scenario
        return scenarios


def active_on(price: Price, as_of: date) -> bool:
    return (price.valid_from is None or price.valid_from <= as_of) and (
        price.valid_through is None or as_of <= price.valid_through
    )


def calculate(price: Price, scenario: Scenario) -> dict[str, Decimal]:
    million = Decimal(1_000_000)
    uncached_mtok = scenario.uncached_input_tokens_per_day * scenario.days / million
    cached_mtok = scenario.cached_input_tokens_per_day * scenario.days / million
    output_mtok = scenario.output_tokens_per_day * scenario.days / million
    token_cost = (
        uncached_mtok * price.input_per_mtok
        + cached_mtok * price.cached_input_per_mtok
        + output_mtok * price.output_per_mtok
    )
    runtime_cost = scenario.runtime_hours_per_month * scenario.runtime_rate_per_hour
    total = (
        token_cost
        + runtime_cost
        + scenario.tool_cost_per_month
        + scenario.environment_cost_per_month
    )
    return {
        "uncached_input_mtok": uncached_mtok,
        "cached_input_mtok": cached_mtok,
        "output_mtok": output_mtok,
        "token_cost": token_cost,
        "runtime_cost": runtime_cost,
        "total": total,
    }


def money(value: Decimal) -> str:
    return f"${value.quantize(Decimal('0.01')):,.2f}"


def rate(value: Decimal) -> str:
    rendered = f"{value:.3f}".rstrip("0").rstrip(".")
    return f"${rendered}"


def rows_for(prices: Iterable[Price], scenario: Scenario):
    rows = []
    for price in prices:
        result = calculate(price, scenario)
        rows.append((price, result))
    return sorted(rows, key=lambda item: item[1]["total"])


def render_markdown(rows, scenario: Scenario, as_of: date) -> str:
    benchmark_monthly = scenario.employer_cost_benchmark_annual_usd / Decimal(12)
    verification_dates = sorted({price.verified_on for price, _ in rows})
    latest_verification = max(verification_dates)
    lines = [
        f"# Model cost scenario: {scenario.name}",
        "",
        f"Scenario date: `{as_of.isoformat()}`",
        f"Price data verified: `{', '.join(d.isoformat() for d in verification_dates)}`",
        "",
        scenario.description,
        "",
    ]
    if (as_of - latest_verification).days > 90:
        lines += [
            "> **Stale-price warning:** the newest committed price verification is more than 90 days older than the scenario date. Recheck official provider pricing before relying on this output.",
            "",
        ]
    lines += [
        "## Assumptions",
        "",
        f"- uncached input: {scenario.uncached_input_tokens_per_day * scenario.days:,.0f} tokens/month",
        f"- cached input: {scenario.cached_input_tokens_per_day * scenario.days:,.0f} tokens/month",
        f"- output: {scenario.output_tokens_per_day * scenario.days:,.0f} tokens/month",
        f"- runtime: {scenario.runtime_hours_per_month:,.2f} hours at {money(scenario.runtime_rate_per_hour)}/hour",
        f"- fixed tool cost: {money(scenario.tool_cost_per_month)}",
        f"- fixed environment cost: {money(scenario.environment_cost_per_month)}",
        f"- illustrative employer-cost benchmark: {money(scenario.employer_cost_benchmark_annual_usd)}/year ({money(benchmark_monthly)}/month)",
        "",
        "## Results",
        "",
        "| Provider | Model | Input / MTok | Cached / MTok | Output / MTok | Monthly modeled cost |",
        "|---|---|---:|---:|---:|---:|",
    ]
    for price, result in rows:
        lines.append(
            f"| {price.provider} | {price.display_name} | {rate(price.input_per_mtok)} | "
            f"{rate(price.cached_input_per_mtok)} | {rate(price.output_per_mtok)} | "
            f"{money(result['total'])} |"
        )
    lines += [
        "",
        "> This compares cost envelopes, not equivalent productive capacity. It excludes cache-write charges, provider-specific long-context pricing, most tool calls, failed runs, and builder attention unless explicitly added to the scenario.",
    ]
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pricing", type=Path, default=DEFAULT_PRICING)
    parser.add_argument("--scenarios", type=Path, default=DEFAULT_SCENARIOS)
    parser.add_argument("--scenario", default="heavy-continuous")
    parser.add_argument("--date", type=date.fromisoformat, default=date.today())
    parser.add_argument("--provider")
    parser.add_argument("--model")
    parser.add_argument("--format", choices=("markdown", "json"), default="markdown")
    args = parser.parse_args()

    scenarios = load_scenarios(args.scenarios)
    if args.scenario not in scenarios:
        parser.error(f"unknown scenario {args.scenario!r}; choose from {', '.join(sorted(scenarios))}")
    scenario = scenarios[args.scenario]

    prices = [price for price in load_prices(args.pricing) if active_on(price, args.date)]
    if args.provider:
        prices = [price for price in prices if price.provider.lower() == args.provider.lower()]
    if args.model:
        needle = args.model.lower()
        prices = [
            price
            for price in prices
            if needle in price.model_id.lower() or needle in price.display_name.lower()
        ]
    if not prices:
        parser.error("no active model prices matched the filters")

    rows = rows_for(prices, scenario)
    if args.format == "markdown":
        print(render_markdown(rows, scenario, args.date))
    else:
        payload = {
            "as_of": args.date.isoformat(),
            "pricing_verified_on": sorted({price.verified_on.isoformat() for price in prices}),
            "scenario": scenario.__dict__,
            "employer_cost_benchmark_monthly_usd": str(scenario.employer_cost_benchmark_annual_usd / Decimal(12)),
            "models": [
                {
                    "provider": price.provider,
                    "model_id": price.model_id,
                    "display_name": price.display_name,
                    "pricing_basis": price.pricing_basis,
                    **{key: str(value) for key, value in result.items()},
                }
                for price, result in rows
            ],
        }
        print(json.dumps(payload, indent=2, default=str))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
