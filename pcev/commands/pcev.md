---
description: PCEV Pipeline - Plan, Critique, Execute, Verify with cross-verification and parallel execution
argument-hint: [--interactive|--ask|--quick|--parallel] <feature description>
allowed-tools: Read, Write, Edit, Glob, Grep, Bash, Task, TodoWrite, WebSearch, WebFetch, AskUserQuestion
---

# PCEV Pipeline Orchestrator

You are orchestrating a 7-stage PCEV (Plan-Critique-Execute-Verify) development pipeline. Parse the arguments and execute the workflow.

## Argument Parsing

**Input received:** $ARGUMENTS

Parse the input to determine:
1. **Mode flags:**
   - `--interactive` or `--ask` or phrase "ask questions" → Interactive mode (pause after stages 1-4)
   - `--quick` → Quick research mode (faster Stage 1)
   - `--parallel` → Enable parallel work streams (for complex features)
   - Default → Autonomous mode (run all stages, only stop on major blockers)

2. **Feature description:** Everything after flags (required)

If no feature description provided, use AskUserQuestion to prompt:
"What feature would you like to develop? Please describe the feature, problem it solves, or functionality needed."

## Setup

1. **Create output directory:**
   - Format: `docs/pcev/DATE_FEATURE_NAME/`
   - DATE format: DDMMMYYYY (e.g., 28JAN2026)
   - FEATURE_NAME: Sanitized from description (uppercase, underscores, max 30 chars)
   - Example: `docs/pcev/28JAN2026_CISA_KEV_INTEGRATION/`

2. **Initialize metrics tracking:**
   - Check if `docs/pcev/metrics.json` exists
   - If not, create it with initial structure
   - Record cycle start

3. **Create todo list** with all 7 stages for visibility

## Stage Execution

Execute stages using the Task tool to launch specialized agents. Watch for PHASE TRANSITION outputs.

### Stage 1: Research & Assessment
Launch `pcev:feature-researcher` agent with:
- Feature description
- Mode (quick vs thorough)
- Output path for `01_research.md`

**If Interactive mode:** After completion, present research findings and ask user to confirm before proceeding.

### Stage 2: Requirements & Specs
Launch `pcev:requirements-engineer` agent with:
- Feature description
- Research output (`01_research.md`)
- Output path for `02_requirements.md`

**If Interactive mode:** Present requirements and ask user to approve or modify.

### Stage 3: Planning
Launch `pcev:feature-planner` agent with:
- Feature description
- Research and requirements docs
- Output path for `03_technical_plan.md`
- Parallel mode flag (if --parallel)

**If Interactive mode:** Present plan and ask user to approve or request changes.

**If Parallel mode:** The planner will identify work streams and recommend parallel agents.

### Stage 4: Critique & Cross-Verify
Launch `pcev:plan-critic` agent with:
- All previous stage outputs
- Mode flag (autonomous = iterative improvement, interactive = report only)
- Output path for `04_critique_report.md`

**For complex features:** May spawn multiple specialized critics (architecture, completeness, feasibility, integration) for cross-critique.

**If Interactive mode:** Present critique and ask user to proceed to implementation or revise.

### Stage 5: Execute
Launch `pcev:feature-implementer` agent(s) with:
- Finalized technical plan
- Critique report (for any incorporated improvements)
- Output path for `05_implementation_log.md`

**If Parallel mode:** Spawn multiple implementer agents per work stream decomposition from Stage 3.

### Stage 5.5: Verification (NEW - Cross-Verification)
Launch `pcev:code-verifier` agent with:
- Technical plan (`03_technical_plan.md`)
- Implementation log (`05_implementation_log.md`)
- Output path for `05.5_verification_report.md`

**Key:** The verifier did NOT write the code - this independence catches blind spots.

### Stage 6: Review & Retrospective
Launch `pcev:cycle-reviewer` agent with:
- All stage outputs including verification
- Implementation results
- Output path for `06_review.md`
- Metrics file path for updating stats

**Remediation Loop:** If verification found issues, reviewer may trigger targeted fix agents and re-verification (max 2 loops).

## Phase Transition Monitoring

Watch for structured phase transition outputs from each agent:
```
═══════════════════════════════════════════════════════════════
 PHASE [N] COMPLETE: [Phase Name]
═══════════════════════════════════════════════════════════════
```

These provide visibility into pipeline progress and key metrics.

## Error Handling

- **Major blockers** (architecture issues, missing critical dependencies, security concerns):
  - Stop workflow immediately
  - Document blocker in current stage output
  - Report to user with recommendations
  - Await user input before continuing

- **Minor issues** (style concerns, optional improvements, non-critical gaps):
  - Document in current stage output
  - Continue to next stage
  - Include in final review (Stage 6)

- **Verification failures:**
  - NEEDS FIXES (1-3 major): Trigger remediation loop
  - NEEDS FIXES (>3 major): Re-plan required
  - BLOCKED (critical): Escalate to user

## Completion

After Stage 6 completes:
1. Update `docs/pcev/metrics.json` with cycle stats
2. Present summary to user:
   - Feature developed
   - Stages completed (including remediation loops)
   - Key decisions made
   - Files created/modified
   - Follow-up TODOs from review
3. Mark all todos as completed

## Mode Reference

| Mode | Trigger | Behavior | Pauses |
|------|---------|----------|--------|
| Autonomous | Default | Full pipeline, iterative improvement | Only major blockers |
| Interactive | `--interactive`, `--ask`, "ask questions" | Report only at critique | After stages 1-4 |
| Quick | `--quick` | Faster Stage 1 research | Depends on other flags |
| Parallel | `--parallel` | Multi-agent execution | Depends on other flags |

## PCEV Enhancements

This pipeline incorporates PCEV concepts:
- **Cross-Verification**: Agents verify code they didn't write
- **Parallel Work Streams**: Complex features decompose into concurrent work
- **Multi-Critic**: Multiple specialized critics for thorough review
- **Remediation Loops**: Targeted fixes with re-verification
- **Phase Transitions**: Structured progress reporting
