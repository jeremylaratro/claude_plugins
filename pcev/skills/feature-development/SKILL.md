---
name: Feature Development Lifecycle
description: This skill should be used when discussing feature development best practices, understanding the feature-dev workflow stages, or when guidance is needed on when to use each stage of the development lifecycle. Triggers on questions about feature development process, planning methodology, or development workflows.
version: 1.0.0
---

# Feature Development Lifecycle

## Overview

The feature development lifecycle is a structured 6-stage process that transforms a feature idea into production code with built-in quality gates. Each stage produces documented artifacts that inform the next stage.

## The 6 Stages

### Stage 1: Research & Assessment
**Purpose:** Understand the codebase and assess feasibility before committing to requirements.

**Key Activities:**
- Analyze existing architecture and patterns
- Identify relevant files and dependencies
- Assess technical feasibility
- Surface potential blockers early

**Output:** `01_research.md` - Context, patterns, feasibility assessment

**When to spend more time here:**
- Feature touches unfamiliar parts of codebase
- Integration with external systems
- Architectural impact is unclear

### Stage 2: Requirements & Specs
**Purpose:** Define what success looks like with testable criteria.

**Key Activities:**
- Transform research into structured requirements
- Write SMART requirements (Specific, Measurable, Achievable, Relevant, Time-bound)
- Define acceptance criteria (Given/When/Then)
- Establish success metrics
- Prioritize with MoSCoW method

**Output:** `02_requirements.md` - Requirements, acceptance criteria, metrics

**Common Pitfalls:**
- Writing HOW instead of WHAT
- Vague acceptance criteria
- Missing non-functional requirements
- Scope creep

### Stage 3: Planning
**Purpose:** Design how to build what was specified.

**Key Activities:**
- High-level architecture design
- Detailed implementation plan
- File manifest (create/modify)
- Build sequence with dependencies
- Validation checkpoints

**Output:** `03_technical_plan.md` - Architecture, step-by-step plan

**Good Plans Have:**
- Steps small enough to be independently executable
- Clear dependency ordering
- Validation points throughout
- Realistic complexity estimates

### Stage 4: Critique & Cross-Verify
**Purpose:** Catch issues before code is written.

**Key Activities:**
- Review requirements for completeness
- Validate plan feasibility
- Check cross-document consistency
- Identify gaps and risks

**Output:** `04_critique_report.md` - Issues found, improvements made

**Review Dimensions:**
1. Requirements quality (SMART, testable)
2. Architecture soundness
3. Plan feasibility
4. Document consistency
5. Completeness (error handling, rollback, tests)

### Stage 5: Execute
**Purpose:** Build the feature according to plan.

**Key Activities:**
- Execute plan step by step
- Write code following codebase patterns
- Write tests with code
- Log progress continuously
- Handle blockers appropriately

**Output:** `05_implementation_log.md` - Progress, changes, blockers

**Principles:**
- Follow the validated plan
- One step at a time
- Validate continuously
- Document deviations

### Stage 6: Review & Retrospective
**Purpose:** Learn from the process and set up next steps.

**Key Activities:**
- Analyze full cycle
- Identify gaps and technical debt
- Create follow-up TODO list
- Update metrics
- Extract learnings

**Output:** `06_review.md` - Observations, TODOs, recommendations

## Workflow Modes

### Autonomous Mode (Default)
- Runs all stages sequentially
- Only stops for major blockers
- Stage 4 automatically improves plans
- Best for: Experienced developers, well-defined features

### Interactive Mode
- Pauses after stages 1-4 for approval
- Stage 4 reports issues without modifying
- More control, more input required
- Best for: Complex features, learning the workflow

### Quick Mode
- Faster Stage 1 research
- Same rigor in other stages
- Best for: Small features, familiar codebase areas

## When to Use This Workflow

**Good Candidates:**
- New features requiring design decisions
- Features touching multiple system parts
- Work that needs documentation
- Features where quality is critical

**May Be Overkill For:**
- Single-line bug fixes
- Configuration changes
- Copy-paste additions
- Time-critical hotfixes

## Best Practices

### General
- Trust the process - each stage informs the next
- Don't skip stages, even if they seem quick
- Keep artifacts updated if understanding changes
- Use interactive mode when learning

### Research
- Look for patterns, not just files
- Check recent git history for context
- Note what's inconsistent or unclear

### Requirements
- One requirement = one testable thing
- Write acceptance criteria immediately
- Explicitly note what's out of scope

### Planning
- Small steps > big steps
- Include test steps in the plan
- Plan for what can go wrong

### Critique
- Be thorough but not pedantic
- Focus on substance over style
- Flag concerns early

### Implementation
- Log as you go, not after
- Test before marking complete
- Note deviations from plan

### Review
- Be honest about what didn't work
- Make TODOs actionable
- Celebrate successes
