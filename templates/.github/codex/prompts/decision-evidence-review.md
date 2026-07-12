# Decision-Evidence Review

Review a proposed non-landed Change resolution independently from the execution agent.

Use this prompt when `resolution_class: decision` is proposed, or when failed implementation evidence is being used to support a stop, rejection, supersession, or alternative path.

## Inputs

- Change Intent, including original decision question and non-landed criteria
- `WORKFLOW.md`
- workpad and ExecPlan, if any
- experiment, research, prototype, log, benchmark, gate, and review evidence
- Change resource summary and proposed disposition
- parent initiative, when any

## Review

Check:

- the decision question existed before the conclusion, or any late revision is explicit and justified;
- the evidence is relevant and strong enough for the consequence;
- contradictory results and material alternatives are represented;
- the proposed disposition follows from evidence rather than fatigue, sunk cost, or preference;
- the record identifies uncertainty reduced and the decision, forecast, or next action changed;
- reusable artifacts and follow-up are preserved when appropriate;
- counterfactual value or avoided-cost claims name assumptions and confidence;
- administrative closure is not disguised as work-derived learning;
- unresolved work is not promoted to a decision resolution merely because resources were spent.

## Output

```yaml
decision: pass | fail | needs-human
evidence_gaps: []
classification_findings: []
contradictory_evidence: []
uncertainty_reduced: []
decisions_supported: []
follow_up_required: []
```

Do not recommend landing merely to make the work look productive. Do not recommend non-landing merely to make a failed branch look insightful.
