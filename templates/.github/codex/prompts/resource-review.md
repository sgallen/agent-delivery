# Resource and Resolution Record Review

Review the Change resource summary and linked run records independently from the execution agent.

Use this prompt only for Changes with material forecasts, thresholds, non-landed decisions, or initiative consequences.

## Inputs

- Change Intent and parent initiative, if any
- `WORKFLOW.md` resource and resolution policy
- workpad and ExecPlan, if used
- Change resource summary
- linked run resource records
- gate results, evidence, and proposed disposition

## Review

Check:

- every run is attributed to the correct Change and initiative;
- each run records both status and contribution;
- forecast stage, likely range, confidence, resolution expectation, and assumptions are preserved;
- measured, estimated, allocated, and unattributed use are distinguishable;
- failed, discarded, superseded, and recovery attempts remain included;
- threshold warnings, checkpoints, stops, and approvals followed policy;
- current forecast and final actual are not confused;
- material variance has a concrete explanation;
- resolution status, class, disposition, landing, release, quality, and learning value agree with the evidence;
- decision-class non-landing has work-derived evidence and a changed decision or reduced uncertainty;
- administrative closure names the accountable owner and external basis without claiming unearned learning;
- unresolved loss remains visible;
- the result can roll up without double counting;
- human data is classified by capability and not used for covert individual ranking.

Do not decide whether spend was justified from the number alone. Do not invent precision, causal attribution, avoided-cost value, or productive learning.

## Output

```yaml
decision: pass | fail | needs-human
missing_or_inconsistent_records: []
resolution_classification_findings: []
threshold_findings: []
variance_questions: []
data_quality_gaps: []
potential_system_learning: []
```
