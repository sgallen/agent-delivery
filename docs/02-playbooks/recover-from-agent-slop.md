# Playbook: Recover from Agent Slop

Agent slop is not merely unattractive output.

It is work that creates more review, uncertainty, cleanup, or risk than value. It is also evidence that something in the model, context, Change shape, workflow, environment, gates, or engagement design may be wrong.

## Common symptoms

- large unrelated diffs;
- unrequested product behavior;
- passing tests but the wrong outcome;
- visually inconsistent UI;
- architecture-boundary violations;
- tests written to satisfy a number rather than prove behavior;
- repeated reviewer corrections;
- a workpad that no longer matches reality;
- more human effort spent reviewing than the Change was worth;
- continued activity with no increase in confidence.

## Step 1: Stop the wandering

Pause the run when:

- forbidden scope was touched;
- the same failure repeats without progress;
- the diff is growing faster than confidence;
- the environment is unreliable;
- the agent is solving a different problem;
- a defined stop or hard threshold has been reached.

Wandering is not iteration.

## Step 2: Preserve what matters

Keep:

- the current diff or commit;
- gate failures;
- logs, screenshots, and traces;
- workpad state;
- reviewer findings;
- the relevant prompt and context sources;
- environment details needed to reproduce or resume.

When run or resource tracking is enabled, preserve those records too. A later successful attempt does not erase the failed path or the attention it consumed.

The goal is to diagnose the system, not merely delete the embarrassment.

## Step 3: Find the weak layer

Ask which layer failed:

- **Intent:** unclear outcome, non-goals, or constraints.
- **Context:** missing product, design, architecture, domain, or comparable-work knowledge.
- **Harness:** missing tool, permission, runtime access, or feedback.
- **Workflow:** unclear sequence, retry, stop, or handoff rule.
- **Skill:** the agent lacked the team’s preferred procedure.
- **Gate:** the problem was detected too late or described badly.
- **Engagement:** builder judgment was needed but never requested.
- **Model or routing:** the selected model or escalation path was a poor fit.
- **Environment:** setup friction or flakiness contaminated the work.
- **Change shape:** the work was too broad, coupled, or poorly decomposed.

Sometimes the answer is “several.” Software remains generous that way.

## Step 4: Choose a recovery path

Decide what trustworthy work can be kept and what the smallest credible next move is.

Options include:

- tighten the Change Intent;
- constrain allowed files or behavior;
- improve context or a skill;
- add or strengthen a gate;
- split or narrow the Change;
- create an ExecPlan;
- change the model or routing strategy;
- repair the environment;
- engage a builder;
- discard the branch and restart;
- stop because the remaining value no longer justifies the work.

When estimates or thresholds are in use, reforecast before choosing. Do not keep patching a contaminated run when a clean restart is cheaper and clearer. Do not restart reflexively when the preserved state makes recovery easier.

## Step 5: Protect the next reviewer

Before resubmitting:

- reduce the diff to the intended scope;
- rerun targeted gates;
- regenerate the evidence package;
- summarize what failed and what changed in the approach;
- update the workpad and any forecast the project uses;
- ask narrow reviewer agents to inspect the obvious risk areas.

The next reviewer should not have to rediscover the failure from the wreckage.

## Step 6: Promote the lesson

If the same failure could recur, improve the system now or create a follow-up Change.

The lesson may belong in:

- Change readiness or decomposition;
- repository context;
- a skill;
- an environment script;
- a gate or reviewer prompt;
- a model-routing rule;
- a stop condition;
- an estimate or capacity assumption.

Agent slop is expensive. Repeated agent slop with no system learning is a choice.

## Definition of done

Recovery is complete when the Change returns to a trustworthy path, reaches a well-supported decision, or is honestly closed without one; the current state and evidence are preserved; reviewers are not being asked to rediscover the failure; and the reusable lesson has a home.
