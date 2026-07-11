# Playbook: Promote Learning into the System

Use this when a Change reveals repeated friction, missing context, weak proof, design drift, architecture problems, or an unnecessary human bottleneck.

## Principle

The system improves when human judgment becomes reusable structure.

If a builder notices something once, a comment may be enough.

If the team keeps paying for the same issue, the system should learn.

## Step 1: State the learning plainly

Examples:

- “The issue did not specify the forbidden header behavior.”
- “The agent could not find the approved component pattern.”
- “Tests passed, but the browser console failed.”
- “Every reviewer asks for the same architecture boundary.”
- “A senior engineer had to summarize a predictable diff again.”

Avoid vague lessons such as “be more careful.” They are emotionally satisfying and operationally useless.

## Step 2: Find the right layer

Use this promotion ladder:

1. **Review comment** — one-off correction.
2. **Documentation** — missing explanation or context.
3. **Example** — agents need to see what good looks like.
4. **Skill** — a repeated procedure should be performed a particular way.
5. **Reviewer prompt** — judgment can be checked consistently.
6. **Gate** — the concern needs to become part of done.
7. **Mechanical check** — the rule can be tested or linted.
8. **Scheduled cleanup** — drift matters but should not block every PR.

Choose the smallest layer that will change future behavior.

## Step 3: Make the improvement

Update the doc, template, skill, gate, test, workflow, or reviewer prompt in the same Change when it is small and clearly related.

Create a follow-up Change when the improvement is substantial or would distract from the original outcome.

## Step 4: Prove the system improvement

Show how the new structure would help:

- the template now requests the missing information
- the gate now catches the regression
- the skill now captures the evidence
- the architecture check now blocks the import
- the reviewer agent now returns a focused finding.

System improvements deserve evidence too.

## Step 5: Watch for unintended cost

A new rule can create noise or block useful work.

After a few Changes, ask whether the improvement:

- prevents the failure
- reduces human effort
- creates false positives
- remains understandable
- belongs at a different layer.

## Definition of done

The learning has been promoted when future builders and agents can benefit from it without needing the original conversation or the person who noticed it.
