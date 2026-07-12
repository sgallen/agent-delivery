# Playbook: Recover from Agent Slop

Agent slop is not merely unattractive output.

It is work that creates more review, uncertainty, cleanup, or risk than value. It is also a signal that the model, context, workflow, environment, gates, resource policy, or task design may be wrong.

## Common symptoms

- large unrelated diffs
- unrequested product behavior
- passing tests but the wrong outcome
- visually inconsistent UI
- architecture-boundary violations
- tests written only to inflate coverage
- repeated reviewer corrections
- a workpad or forecast that no longer matches reality
- resource use rising without evidence of progress
- more human effort spent reviewing than the Change was worth.

## Step 1: Stop the run

Block the PR or pause the agent when:

- forbidden scope was touched
- a hard resource threshold was reached
- the same failure repeats without progress
- the diff or spend is growing faster than confidence
- the environment is unreliable
- the agent is solving a different problem.

Wandering is not iteration.

## Step 2: Preserve evidence and resources

Keep:

- the current diff
- gate failures
- logs and screenshots
- workpad state
- reviewer findings
- the prompt and relevant context sources
- run resource record and provider usage
- environment state needed to resume
- the most recent completion forecast.

Mark the run’s status and contribution honestly. Do not remove failed-attempt cost from the Change if another run later succeeds or if the work concludes without landing.

The goal is to diagnose the system, not merely delete the embarrassment.

## Step 3: Classify the failure

Ask which layer failed:

- **Intent:** unclear outcome, non-goals, value link, or constraints.
- **Context:** missing product, design, architecture, domain, or comparable-work knowledge.
- **Harness:** missing tool, permission, runtime access, attribution, or feedback.
- **Workflow:** unclear sequence, retry, threshold, stop, or handoff rule.
- **Skill:** the agent lacked the team’s preferred procedure.
- **Gate:** the failure or resource drift was not detected early enough.
- **Engagement:** builder judgment was needed but not requested.
- **Model or routing:** the selected model, agent, or escalation path was inappropriate.
- **Environment:** setup friction or flakiness consumed the run.
- **Change shape:** the work was too broad, coupled, or poorly decomposed.

Sometimes the answer is “several.” Software remains generous that way.

## Step 4: Reforecast before choosing recovery

Record:

- resources already consumed
- trustworthy work that can be retained
- expected cost and builder attention for each recovery option
- likely range and confidence
- effect on the parent initiative, if any.

Options include:

- tighten the Change Intent
- constrain allowed files or behaviors
- improve context or a skill
- add or strengthen a gate
- split or narrow the Change
- create an ExecPlan
- change model or routing strategy
- repair the environment
- engage a builder
- discard the branch and restart
- abandon the Change because the remaining value no longer justifies the investment.

Do not keep patching a contaminated run when a clean restart is cheaper and clearer. Do not restart reflexively when the preserved state makes recovery cheaper.

## Step 5: Protect reviewers

Before resubmitting:

- reduce the diff to the intended scope
- rerun targeted gates
- regenerate the evidence package
- update the resource forecast and variance explanation
- summarize what failed and what changed in the approach
- have reviewer agents inspect scope and obvious regressions.

## Step 6: Promote the lesson

If the same class of slop could recur, update the system now or create a follow-up Change.

Ask whether the evidence should change:

- readiness or Change decomposition
- model routing or escalation
- skill or repository context
- environment design
- gate or threshold
- estimator features
- initiative forecast or capacity plan.

Agent slop is expensive. Repeated agent slop with no system learning is a choice.

## Definition of done

Recovery is complete when the Change returns to a trustworthy path, reaches an evidence-backed decision or administrative resolution, or is honestly recorded as unresolved loss; the resource record and forecast reflect what happened; reviewers are not being asked to rediscover the failure; and the reusable lesson has a home.
