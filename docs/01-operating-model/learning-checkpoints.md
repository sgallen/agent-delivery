# Learning Checkpoints

A Change should leave behind more than code, screenshots, or a closed ticket.

The learning checkpoint asks:

> What did this work reveal that should make the next Change easier to shape, safer to run, easier to judge, or more likely to create value?

The point is not to hold a retrospective for every diff. It is to stop paying for the same lesson.

## Look where the friction appeared

### Intent and product judgment

Was the outcome clear? Did the work answer the right question? Did customer evidence change the direction? Were the boundaries and stop conditions useful?

### Context and architecture

Did the agent struggle to find the right code or understand the system? Did a modest Change become difficult because the architecture is hard to reason about or modify?

### Execution

Did the agent have the right tools, environment, and feedback? Did it recover well? Was builder intervention necessary because of real judgment or because the system was missing something basic?

### Proof and review

Which evidence made the decision easy? Which gate was missing, noisy, or late? Did review keep rediscovering the same rule?

### Outcome

Did the Change land, support a useful decision, close for an external reason, or fail to resolve well? When nothing landed, did the evidence actually change what happened next?

### Resources and value, when measured

Did the work fall inside the forecast range? What caused the variance? Which human or technical capability became the constraint? For an initiative, did the expected value appear later?

Those questions matter. They should not crowd out the simpler one: what should the system do differently next time?

## Turn the lesson into the right kind of change

A checkpoint may produce:

- no durable action;
- clearer product or architecture context;
- a better issue or workpad;
- a new test, gate, or skill;
- a routing or escalation rule;
- a narrower Change boundary;
- a changed estimate or capacity assumption;
- a follow-up Change;
- an initiative decision to expand, adapt, hold, stop, or retire.

Do not create permanent machinery from one strange event. Do not let the same expensive correction happen six times because everyone remembers it informally.

## Preserve the surprise

Keep the original intent and material assumptions. When forecasts or decisions change, preserve the earlier view rather than rewriting history to make the result look obvious.

The distance between what the team believed and what happened is often the useful part.

Agents can assemble the record, find comparable Changes, and propose patterns. Builders decide which learning is real and which response is proportionate.

The system is the unit being improved. Telemetry is not an automatic blame machine.

## Keep it light

A routine Change may need one concise workpad section. An experiment needs the question, evidence, decision, and next action. An unresolved failure needs the reason it failed to resolve and what should prevent a repeat. A major initiative may need scheduled value reviews.

The checkpoint is done when future behavior changes—or when the team has consciously decided that no durable change is warranted.

A retrospective that produces no corrected assumption, no decision, and no improvement is a meeting-shaped artifact.
