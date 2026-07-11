# References and Influences

This playbook grew out of direct use: working with AI coding tools and agents, experimenting with orchestration, and watching my team adopt the tooling in real work.

The references below did not create the thesis on their own. They gave sharper language, concrete examples, and useful counterpoints to what experience was already making difficult to ignore.

The playbook is not trying to summarize these resources or copy one team's process. It draws out the operating ideas that appear durable enough to test.

## Gusto: building a product line with Claude Code

- [How Gusto’s CTO uses Claude Code to ship like a startup](https://youtu.be/5FKBkUCaLa8)
- [Companion episode notes](https://www.lennysnewsletter.com/p/no-figma-no-jira-no-docs-how-gusto)

What this sharpened:

- a small, empowered team can remove a remarkable amount of inherited ceremony
- working software can become a product-decision artifact
- cheap implementation changes the cost of discarding an approach
- builders can work beyond traditional PM, design, and engineering boundaries
- bug fixing can start with a failing eval or reproduction, then prove the fix
- permission and team design matter as much as access to the tool.

The lesson is not “never use Jira, Figma, or docs.” The lesson is to stop treating artifacts and handoffs as inherently valuable. Keep what improves intent, execution, proof, or learning.

## OpenAI: Harness Engineering

<https://openai.com/index/harness-engineering/>

What this sharpened:

- humans move toward designing environments, specifying intent, and building feedback loops
- human time and attention become the scarce resources
- repository knowledge should be structured and discoverable
- `AGENTS.md` should be a map, not an encyclopedia
- agents need direct access to browser behavior, logs, metrics, and traces
- architecture and taste can be enforced through custom lints and structural tests
- human feedback should be promoted into docs or tooling
- recurring cleanup agents can help maintain quality
- the repository and delivery system become more capable as lessons are encoded.

This is the strongest example in the set of treating the environment around the model as an engineering product in its own right.

## OpenAI: Symphony

<https://openai.com/index/open-source-codex-orchestration-symphony/>

What this sharpened:

- manage work and outcomes, not interactive agent sessions
- the issue tracker can become the control plane
- each active task can run in an isolated workspace
- repo-owned `WORKFLOW.md` can define how agents process work
- orchestration can manage concurrency, retries, reconciliation, and state transitions
- humans should not need to supervise a row of agent terminals.

### Symphony reference `WORKFLOW.md`

<https://github.com/openai/symphony/blob/main/elixir/WORKFLOW.md>

What this sharpened:

- `WORKFLOW.md` carries the standing process
- the ticket carries specific intent and required validation
- one persistent workpad comment carries the live plan, checklist, validation status, notes, and handoff state
- the system should not move work to review until the completion bar is satisfied
- skills can encode specific procedures such as syncing, committing, pushing, and landing.

## OpenAI Cookbook: Codex ExecPlans

<https://developers.openai.com/cookbook/articles/codex_exec_plans>

What this sharpened:

- long-running, complex work can be guided by self-contained, living plans
- the plan should capture progress, discoveries, decisions, validation, recovery, and outcomes
- a durable plan is useful when a prompt and workpad are not enough
- the plan itself becomes an artifact builders and future agents can inspect.

In this playbook, ExecPlans are optional. Every orchestrated Change needs a workflow and workpad; only some Changes need a deeper, versioned plan.

## Geoffrey Huntley: the economic consequence of model-first companies

<https://ghuntley.com/real/>

What this sharpened:

- falling software-production costs are an organizational and economic shift, not merely a developer-productivity improvement
- model-first entrants may operate with lower cost structures and compress the time incumbents have to respond
- lower headcount across customers can put pressure on per-seat software economics
- transformation affects roles, identity, incentives, and company design—not just tool selection
- future model improvement would amplify an advantage that is already available with current capability.

This is the most deliberately provocative source in the set. I treat it as a strategic provocation and directional thesis, not a literal cost benchmark or a reliable timetable. Its value is forcing the downstream implications into view.

## What these examples have in common

These sources work at different layers. Huntley makes the economic consequences difficult to ignore. Gusto shows how a small team can work differently. Harness Engineering shows what sustained agent execution demands from the repository and runtime. Symphony shows how to orchestrate Changes rather than supervise sessions. ExecPlans show how to sustain complex work when the plan itself needs to become durable.

On the surface, the Gusto example and Harness Engineering can appear to recommend opposite things. One team removed nearly every formal artifact. Another invested heavily in repository knowledge, architecture rules, and feedback systems.

The shared principle is more useful than either surface recipe:

> Use the smallest operating system that lets builders and agents turn intent into trustworthy evidence, then improve it from real work.

For a small, synchronous, high-trust team, much of the context can live in direct collaboration and working software.

For asynchronous agents, parallel Changes, larger codebases, or higher-risk work, more of that context and judgment must become durable, inspectable, and enforceable.

Structure should earn its keep. So should its absence.

## Supporting implementation references

### Chrome DevTools for agents

<https://developer.chrome.com/docs/devtools/agents/get-started>

Agents can be connected to a live browser so they can inspect UI behavior, console output, network activity, screenshots, performance, and other browser evidence.

### Chrome DevTools MCP

<https://github.com/ChromeDevTools/chrome-devtools-mcp>

Chrome DevTools capabilities can be exposed through MCP-compatible tooling to agents that support MCP.

### Playwright

<https://playwright.dev/>

Browser automation can provide repeatable proof in CI through tests, screenshots, traces, videos, and browser reports.

### GitHub Actions

<https://docs.github.com/actions>

CI should become part of the evidence system, not merely a final build check.

### Git worktree

<https://git-scm.com/docs/git-worktree>

Worktrees provide isolated checkouts for parallel Changes, while runtime isolation still requires execution environments.

### Current model pricing

- [OpenAI API pricing](https://developers.openai.com/api/docs/pricing)
- [Anthropic pricing](https://platform.claude.com/docs/en/about-claude/pricing)
- [Z.AI pricing](https://docs.z.ai/guides/overview/pricing)

Prices are volatile supporting evidence, not doctrine. The dated comparison, caveats, and update process live in [Model Economics](03-reference/model-economics.md).
