---
name: structured-technical-competency-interview
description: Design and assess structured technical competency interviews for DevOps, SRE, platform and infrastructure roles at Middle, Senior, Principal and Head levels. Use for interview plans, question banks, simulations, competency rubrics, scorecards and evidence-based candidate assessments.
---

# Structured Technical Competency Interview (STCI)

STCI is the user's own interview framework, not an established certification or a universally standardized taxonomy. Optimize for useful job-related evidence per minute, not question count. Apply the same role-specific bar and core opportunities to candidates for the same vacancy while allowing responsive follow-ups. Preserve the distinction between question format (how evidence is collected) and competency (what is assessed).

## Workflow

1. Use the vacancy, level, role track, actual duties, stack, interview duration, recruiter briefing, existing guides and any candidate context supplied. Ask only for information essential to a defensible result; otherwise state assumptions and proceed. Tailor to job needs, not individual candidate performance. Keep Middle, Senior, Principal and Head terminology; Principal is a technical leadership track and Head an organizational/people leadership track, not necessarily a promotion sequence.
2. Choose competencies, level-specific observable indicators, coverage and weights before interviewing. Map each primary question or simulation stage to competencies and evidence. Plan coverage across the hiring process: a 60-minute interview cannot fully verify every domain. Mark unobserved areas N/A, including coding, hands-on implementation, or complex design if only discussed verbally.
3. Prepare a timeboxed plan, consistent core questions, neutral probes, and a reserve. Choose an applied exercise appropriate to the job. Supply the interviewer with separate scenario facts, disclosure rules, optional follow-ups and assessment anchors, while keeping the client-facing scorecard clean. Offer reasonable accommodations and equivalent opportunities; don't treat accent, communication style, unfamiliarity with a vendor, or interviewer rapport as technical evidence.
4. Record observed actions, reasoning, actual responsibilities, prompts and outcomes. Score against the advertised level after gathering evidence, not against a generic absolute standard. Distinguish lack of opportunity from demonstrated weakness. Present uncertainty and gaps; don't invent candidate responses, measurements or interview outcomes. An assessment informs a hiring decision rather than automatically making it.
5. Match output to the request: interview plan, question bank, simulation, scorecard, evidence report, or a spreadsheet if requested. Default to the user's minimalist scorecard columns **Question | Grade | Comment**, without answer hints. Keep rubric and interviewer notes separate when useful.

## Taxonomy

The names below are useful conventions, not universal standards. Times are indicative, and individual probes are not separate required questions.

| ID | Format | Typical time | Purpose / example |
|---|---|---:|---|
| EXP | Experience validation | 1–3 min | Scope and personal ownership: What production environment were you personally accountable for? |
| RFS | Rapid-fire screening | 15–45 sec | Selective breadth: What is an error budget or state locking? |
| TKQ | Technical knowledge question | 1–2 min | Mechanisms: How do Kubernetes requests and limits affect operation? |
| TDD | Technical deep dive | 2–5 min | Explore a mechanism, failure mode and verification. |
| BEH | Behavioral assessment | 2–5 min | Past action and outcome: Describe a decision that proved wrong. |
| SBA | Scenario-based assessment | 2–3 min | Hypothetical judgment: Prioritize reliability problems and an exhausted on-call team. |
| PTS | Practical troubleshooting simulation | 5–10+ min | Candidate interacts with incident facts and makes decisions. |
| SDA | System design assessment | 5–15+ min | Design under concrete constraints and explain trade-offs. |
| WSA | Work sample assessment | 5–15+ min | Actually review, create, or modify a relevant artifact. |

Progressive probing / laddering is a technique, not a separate question type; it can enrich any format. A role-play or interactive scenario is a simulation. A scenario asks what the candidate would do; a simulation lets them interact with evolving facts; a work sample requires work on an actual artifact. Verbal explanation does not prove implementation ability.

Example deepening sequence: DNS resolution → caching → overloaded CoreDNS → why more replicas might not help → evidence that would test the hypothesis. Allow the candidate to finish a meaningful thought, then use neutral follow-ups. Stop when enough evidence is obtained or a meaningful knowledge boundary is reached; avoid aggressive interruptions or hints that lead to an answer.

## 60-minute templates

These allocations are practical starting points, not empirically validated standards. Times total 60 minutes including candidate questions. Adjust to vacancy and scope; protect the extended exercise and closure. Question counts are flexible, not quotas. Prepare roughly 30% extra as reserves, and prioritize depth over finishing a checklist. A short design segment tests scoped reasoning, not a complete system design.

| Segment (minutes) | Middle | Senior | Principal | Head |
|---|---:|---:|---:|---:|
| Welcome and format | 3 | 3 | 3 | 3 |
| Experience / ownership | 5 | 6 | 7 | 8 |
| Rapid-fire fundamentals | 7 | 5 | 3 | 0 |
| Technical deep dive | 10 | 9 | 9 | 7 |
| Behavioral and situational | 10 | 10 | 10 | 13 |
| Extended simulation, work sample or scoped design | 20 | 22 | 23 | 24 |
| Candidate questions / close | 5 | 5 | 5 | 5 |

Split the extended block into an 8–12 minute core progressive scenario plus feedback-free follow-up and additional evidence, or use the whole block for a relevant work sample/design. Optional preparation ranges are Middle 20–24, Senior 17–19, Principal 13–16 and Head 11–12, but these may not fit a 60-minute interview with meaningful probing; omit questions when time is short. Use rapid-fire sparingly, especially for Principal and Head.

## Level calibration and coverage

- **Middle:** independently executes common work, demonstrates fundamentals, diagnoses familiar problems, knows when to escalate; assess practical implementation, safe operations and reasoning.
- **Senior:** independently owns systems, handles unfamiliar problems, designs reliable solutions, anticipates risks, mentors and takes responsibility for production outcomes.
- **Principal:** sets technical direction across teams, addresses systemic failure modes, makes long-term architectural trade-offs and influences without assuming people management.
- **Head:** leads an engineering function, with technical credibility plus strategy, people management, sustainable delivery, budget, governance and business alignment. Do not infer management capability from technical excellence.

Accept different profiles of systems, networking, infrastructure, software and security depth when they meet the role. Seek relevant breadth plus substantial depth; avoid requiring identical backgrounds or every tool listed. Adapt to actual role scope, not title alone.

Default competency weights (percent); agree changes for the vacancy before assessment. Zero means not weighted by default, not that the competency is unimportant.

| Competency | Middle | Senior | Principal | Head |
|---|---:|---:|---:|---:|
| Technical fundamentals | 25 | 15 | 10 | 5 |
| Engineering and automation | 25 | 20 | 15 | 10 |
| Troubleshooting and incident response | 25 | 25 | 15 | 10 |
| Architecture and system design | 10 | 15 | 25 | 15 |
| Reliability, security and risk | 10 | 15 | 15 | 15 |
| Ownership and technical leadership | 5 | 10 | 20 | 15 |
| People and organizational management | 0 | 0 | 0 | 20 |
| Business strategy and FinOps | 0 | 0 | 0 | 10 |
| Total | 100 | 100 | 100 | 100 |

Use indicators appropriate to the job: fundamentals (Linux, networking, distributed systems); engineering (automation, infrastructure as code, software and deployment); incidents (hypotheses, observability, mitigation, escalation); architecture (failure domains, capacity, recovery, trade-offs); risk (SLOs, security, change and operational risk); ownership (decisions and cross-team influence); people (hiring, coaching, on-call sustainability); business (prioritization, cost and outcomes). Select, don't mechanically test all items. Map questions to multiple relevant competencies, but do not let numerous rapid-fire questions automatically dominate scoring.

## Practical exercises

All examples below are illustrative and fictional; adapt them to the actual vacancy.

**Progressive incident (8–12-minute core).** Prepare a stable private fact sheet with system topology, symptoms, timeline, observations available on request and plausible trade-offs. Tell the candidate: “Production Kubernetes has intermittent HTTP 503s. You are on call; ask me for information and explain your decisions.” Progress in stages: initial response; disclosure that one availability zone is affected and CPU/memory are normal; request hypotheses and confirming/disconfirming evidence; disclose SLO breach and the option to remove the zone; discuss capacity/cost and mitigation versus investigation; ask prevention and ownership after resolution. Reveal consistent facts in response to questions, not arbitrary clues. Evaluate Middle on diagnostic steps, tools and escalation; Senior on hypothesis testing, mitigation and prevention; Principal on failure domains, systemic risks and architecture; Head on command, impact, accountability and resources. Do not assume a single hidden cause without explicitly preparing one.

**Concrete design.** Give real quantities and constraints, for example 20,000 requests/second at a 200 ms latency target; recovery objectives RPO 5 minutes and RTO 15 minutes; or reducing a $100k monthly infrastructure bill by 25% while preserving reliability. Ask for estimates, assumptions, risks, alternatives and verification. Assess a defensible model, not precision alone. A brief design segment assesses scoped trade-offs, not a complete design.

**Retrospective deep dive.** Ask about a real infrastructure project: problem, alternatives, personal contribution, decisions, measurable results, and what the candidate would change. Distinguish team outcomes from personal responsibility and avoid demanding confidential details.

**Work sample.** Supply a small representative deployment, IaC or code artifact and a clear task to inspect or change it. Give equivalent context, permitted tools and time to candidates. Evaluate the produced work and reasoning; distinguish this from a verbal walk-through.

## Fair probing and signal

Use consistent core prompts, facts, time and evaluation criteria across comparable candidates. Follow candidate answers adaptively with neutral requests such as “What evidence would change your mind?”, “What alternatives did you consider?” and “What was your contribution?” Record substantial assistance. Offer clarification consistently; don't punish reasonable assumptions when the prompt is ambiguous. Respond as a potential colleague, not an adversary. Avoid excessive CV recitation, memorized command syntax, obscure trivia, brainteasers, every-tool checklists, teaching answers during assessment and artificial pressure. Use behavioral evidence and measurable outcomes where available, and differentiate high confidence from limited observation.

## Grading and scorecard

| Grade | Definition |
|---|---|
| 0 | Fundamentally incorrect or no meaningful answer after a fair opportunity |
| 1 | Significant misunderstanding or major gaps |
| 2 | Partial understanding; substantial guidance required |
| 3 | Meets expectations for the advertised role; a successful result |
| 4 | Exceeds expectations with strong independent understanding and reasoning |
| 5 | Exceptional depth, judgment and awareness of consequences |
| N/A | Not assessed or insufficient opportunity to establish competency |

A 3 at Middle and a 3 at Principal represent different role-calibrated evidence. Before use, specify observable role-specific anchors for each assessed competency. Use concise evidence in comments: “Established hypotheses, requested relevant metrics and prioritized reversible mitigation” is more useful than “good troubleshooting.” Note when prompting was substantial. Never convert N/A to zero.

Default scorecard:

| Question | Grade | Comment |
|---|---|---|
| [Role-relevant question] | [0–5 / N/A] | [Observed evidence and material prompting] |

Aggregate evidence at competency level, not by counting question scores. If producing a weighted score, publish each competency score, weights and coverage; calculate only if required evidence and coverage are sufficient, using assessed weight as the denominator and explicitly reporting excluded weight. Never present a partial-coverage normalized score as a full assessment or use it as an automatic hiring decision. If coverage is inadequate, report N/A and missing evidence instead. Highlight strengths, limitations and follow-up opportunities separately from the final decision.

## Sources and provenance

STCI is a practical synthesis; its weights, ratings and templates are recommendations, not validated measurements. References for related methods include [OPM structured interview guide](https://www.opm.gov/policy-data-oversight/assessment-and-selection/structured-interviews/guide.pdf), [OPM work samples and simulations](https://www.opm.gov/policy-data-oversight/assessment-and-selection/other-assessment-methods/work-samples-and-simulations/), and [Google Research: Interviewing for Systems Design Skills](https://research.google/pubs/interviewing-for-systems-design-skills/). Further reading mentioned in the framework includes *Site Reliability Engineering, 2nd Edition* (2026), Chapter 5; *Machine Learning Interviews*, Chapter 6, pp. 213–214; and *Become an Effective Software Engineering Manager*. Verify editions and specific claims before attributing them to these books. Consult the user's own interview guides where provided and authorized; do not assume access or disclose private material.
