# Playbook: Recover from Agent Slop

Agent slop is not merely unattractive output.

It is work that creates more review, uncertainty, cleanup, or risk than value. It is also a signal that the model, context, workflow, environment, gates, or task design may be wrong.

## Common symptoms

- large unrelated diffs
- unrequested product behavior
- passing tests but the wrong outcome
- visually inconsistent UI
- architecture-boundary violations
- tests written only to inflate coverage
- repeated reviewer corrections
- a workpad that no longer matches reality
- more human effort spent reviewing than the Change was worth.

## Step 1: Stop the run

Block the PR or pause the agent when:

- forbidden scope was touched
- the same failure repeats without progress
- the diff is growing faster than confidence
- the environment is unreliable
- the agent is solving a different problem.

Wandering is not iteration.

## Step 2: Preserve evidence

Keep:

- the current diff
- gate failures
- logs and screenshots
- workpad state
- reviewer findings
- the prompt and relevant context sources.

The goal is to diagnose the system, not merely delete the embarrassment.

## Step 3: Classify the failure

Ask which layer failed:

- **Intent:** unclear outcome, non-goals, or constraints.
- **Context:** missing product, design, architecture, or domain knowledge.
- **Harness:** missing tool, permission, runtime access, or feedback.
- **Workflow:** unclear sequence, retry, stop, or handoff rule.
- **Skill:** the agent lacked the team’s preferred procedure.
- **Gate:** the failure was not detected early enough.
- **Engagement:** builder judgment was needed but not requested.
- **Model:** the selected model was not capable enough for the task.

Sometimes the answer is “several.” Software remains generous that way.

## Step 4: Choose the recovery

Options include:

- tighten the Change Intent
- constrain allowed files or behaviors
- improve context or a skill
- add or strengthen a gate
- split the Change
- create an ExecPlan
- use a stronger model
- engage a builder
- discard the branch and restart.

Do not keep patching a contaminated run when a clean restart is cheaper and clearer.

## Step 5: Protect reviewers

Before resubmitting:

- reduce the diff to the intended scope
- rerun targeted gates
- regenerate the evidence package
- summarize what failed and what changed in the approach
- have reviewer agents inspect scope and obvious regressions.

## Step 6: Promote the lesson

If the same class of slop could recur, update the system now or create a follow-up Change.

Agent slop is expensive. Repeated agent slop with no system learning is a choice.

## Definition of done

Recovery is complete when the Change is either trustworthy again or deliberately abandoned, the reviewers are not being asked to rediscover the failure, and the reusable lesson has a home.
