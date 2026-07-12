# Skills

Skills encode how builders want agents to perform important, repeatable steps.

Tools give agents capability. Skills give them technique.

A browser tool lets an agent inspect a page. A browser-validation skill tells the agent which route to exercise, what to capture, which errors to check, what evidence to produce, and when the result is good enough.

That is one place taste becomes durable.

## Use the right artifact

| Need | Put it in |
| --- | --- |
| Standing lifecycle and completion rules | `WORKFLOW.md` |
| Stable product, design, or architecture context | Repository docs |
| Live state for one Change | Workpad |
| A repeatable procedure | Skill |
| A pass/fail quality requirement | Gate |
| Independent judgment on an output | Reviewer agent |
| Deep plan for complex work | ExecPlan |

This distinction prevents every useful idea from being stuffed into the same file.

## When to create a skill

Create a skill when a procedure repeats and the way it is performed matters.

Examples:

- reproduce a UI bug;
- validate a visual Change;
- inspect logs after a failed run;
- update a workpad;
- prepare an evidence package;
- write a regression test;
- perform a scope review;
- promote a recurring lesson into the system.

Do not create skills for every small instruction. That becomes a binder on a shelf, except the shelf now has YAML.

## What makes a good skill

A good skill states:

- when to use it and when not to;
- the inputs and tools required;
- the procedure;
- the expected output;
- the evidence to capture;
- common failure modes;
- the conditions that require builder judgment.

It should be specific enough to improve behavior and small enough to remain understandable.

## Let observed history improve the skill

Once the team has comparable records, a skill may carry dated operating guidance: common failure modes, first-pass success, typical review burden, useful model classes, or known environment requirements.

Treat that guidance as evidence, not scripture. Models, prices, architecture, and the skill itself will change. Do not make a global routing rule from one repository or a tiny sample.

## Skills and taste

Some taste belongs in docs and examples. Some can become a lint or test. Some is procedural.

If a builder repeatedly says, “When we debug this kind of issue, always inspect X before changing Y,” that likely belongs in a skill.

The goal is not to script agents into stupidity.

The goal is to teach the system the team’s best habits.
