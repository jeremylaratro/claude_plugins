# PCEV Plugin

Plan-Critique-Execute-Verify development pipeline with cross-verification, parallel work streams, and remediation loops.

## Overview

This plugin implements a 7-stage pipeline for feature development, incorporating concepts from multi-agent orchestration patterns:

| Stage | Name | Output |
|-------|------|--------|
| 1 | Research & Assessment | `01_research.md` |
| 2 | Requirements & Specs | `02_requirements.md` |
| 3 | Planning | `03_technical_plan.md` |
| 4 | Critique & Cross-Verify | `04_critique_report.md` |
| 5 | Execute | `05_implementation_log.md` |
| 5.5 | **Verification** | `05.5_verification_report.md` |
| 6 | Review & Retrospective | `06_review.md` |

## Key Features (PCEV-Inspired)

### Cross-Verification
Agents verify work they didn't create. The `code-verifier` agent independently reviews implementations against plans, catching blind spots the implementer may have missed.

### Parallel Work Streams
For complex features, the planner decomposes work into 2-4 parallel streams that can execute concurrently, then converge at integration points.

### Multi-Critic Mode
Multiple specialized critics (architecture, completeness, feasibility, integration) can review plans independently, then cross-review each other's findings.

### Remediation Loops
If verification finds issues, targeted fix agents are spawned to address them, followed by re-verification (max 2 loops before escalation).

### Phase Transition Reporting
Structured status outputs at each stage completion provide clear visibility into pipeline progress:

```
═══════════════════════════════════════════════════════════════
 PHASE 5.5 COMPLETE: Verification
═══════════════════════════════════════════════════════════════
 Feature:        User Authentication
 Verdict:        VERIFIED
 Issues Found:   0 Critical, 1 Major, 3 Minor
 ...
═══════════════════════════════════════════════════════════════
```

## Usage

### Basic Usage (Autonomous Mode)

```
/pcev Add CISA KEV feed integration
```

Runs all 7 stages sequentially with minimal interruption.

### Interactive Mode

```
/pcev --interactive Add user authentication
```

Or say "ask questions" in your prompt - pauses after stages 1-4 for your review.

### Quick Research Mode

```
/pcev --quick Fix pagination bug
```

Faster Stage 1 research for smaller features.

### Parallel Mode

```
/pcev --parallel Add multi-tenant support
```

Enables parallel work stream decomposition for complex features.

## Output Location

All documentation is generated in:

```
docs/pcev/
├── metrics.json                    # Aggregate stats across cycles
└── DATE_FEATURE_NAME/
    ├── 01_research.md
    ├── 02_requirements.md
    ├── 03_technical_plan.md
    ├── 04_critique_report.md
    ├── 05_implementation_log.md
    ├── 05.5_verification_report.md
    └── 06_review.md
```

## Workflow Modes

| Mode | Trigger | Behavior |
|------|---------|----------|
| Autonomous | Default | Runs all stages, only stops on major blockers |
| Interactive | `--interactive`, `--ask`, or "ask questions" | Pauses after stages 1-4 for approval |
| Quick | `--quick` | Faster Stage 1 research |
| Parallel | `--parallel` | Multi-agent parallel execution |

## Error Handling

- **Major blockers**: Workflow stops, documents issue, awaits user input
- **Minor issues**: Documented and continued, included in final review
- **Verification failures**:
  - NEEDS FIXES (1-3 major): Remediation loop triggered
  - NEEDS FIXES (>3 major): Re-plan required
  - BLOCKED (critical): Escalate to user

## Agents

This plugin uses 7 specialized agents:

| Agent | Stage | Purpose |
|-------|-------|---------|
| `feature-researcher` | 1 | Codebase analysis and feasibility assessment |
| `requirements-engineer` | 2 | Specifications and acceptance criteria |
| `feature-planner` | 3 | Architecture and implementation planning |
| `plan-critic` | 4 | Cross-verification and plan improvement |
| `feature-implementer` | 5 | Code execution and progress tracking |
| `code-verifier` | 5.5 | Independent implementation verification |
| `cycle-reviewer` | 6 | Retrospective analysis and recommendations |

## Skills

- `feature-development` - Best practices for the development lifecycle
- `requirements-engineering` - Patterns for writing effective requirements

## Version History

- **v2.0.0** - PCEV enhancements: cross-verification, parallel work streams, multi-critic, remediation loops, phase transitions
- **v1.0.0** - Initial 6-stage feature development pipeline
