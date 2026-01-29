---
name: Requirements Engineering
description: This skill should be used when writing requirements, acceptance criteria, or success metrics for features. Triggers on questions about how to write good requirements, what makes acceptance criteria testable, or how to structure feature specifications.
version: 1.0.0
---

# Requirements Engineering

## Overview

Good requirements are the foundation of successful feature development. They bridge the gap between "what we want" and "how we'll know we got it." This skill covers patterns for writing effective, testable requirements.

## Requirement Types

### Functional Requirements (FR)
Define what the system must DO.

**Format:**
```
FR-001: [Descriptive Title]
The system shall [action] when [condition] so that [outcome].
```

**Examples:**
- FR-001: User Login - The system shall authenticate users with email and password when they submit the login form so that only authorized users access the application.
- FR-002: Data Export - The system shall generate CSV exports containing all visible columns when the user clicks the export button so that users can analyze data externally.

### Non-Functional Requirements (NFR)
Define how the system must PERFORM.

**Categories:**
- **Performance:** Response time, throughput, latency
- **Scalability:** Load handling, growth capacity
- **Security:** Authentication, authorization, data protection
- **Reliability:** Uptime, fault tolerance, recovery
- **Maintainability:** Code quality, documentation, testability
- **Usability:** Accessibility, learnability, efficiency

**Format:**
```
NFR-001: [Category] - [Title]
The system shall [measurable quality] under [conditions].
Target: [specific metric]
```

**Examples:**
- NFR-001: Performance - API Response Time - The system shall respond to API requests within 200ms under normal load. Target: p95 < 200ms
- NFR-002: Security - Password Storage - The system shall store passwords using bcrypt with cost factor 12. Target: 100% compliance

## Writing SMART Requirements

### Specific
Bad: "The system should be fast"
Good: "The system shall render the dashboard in under 2 seconds"

### Measurable
Bad: "Users should find it easy to use"
Good: "Users shall complete the checkout flow in under 3 clicks"

### Achievable
Bad: "The system shall have 100% uptime"
Good: "The system shall maintain 99.9% uptime excluding planned maintenance"

### Relevant
Bad: "The system shall support 1 million concurrent users" (for internal tool with 50 users)
Good: "The system shall support 100 concurrent users with sub-second response times"

### Time-bound
Bad: "The system shall eventually support exports"
Good: "The system shall support CSV exports by the end of Sprint 3"

## Acceptance Criteria

### Given/When/Then Format

The most effective format for testable acceptance criteria:

```
Given [precondition/context]
When [action/trigger]
Then [expected outcome]
```

**Examples:**

```
Given a logged-in user with admin role
When they access the user management page
Then they see a list of all users with edit buttons

Given an unauthenticated request
When it attempts to access a protected endpoint
Then a 401 Unauthorized response is returned

Given a form with invalid email format
When the user submits the form
Then an inline error message appears under the email field
```

### Comprehensive Criteria Sets

Good acceptance criteria cover:

1. **Happy Path:** Normal, expected usage
2. **Edge Cases:** Boundary conditions
3. **Error Cases:** What happens when things go wrong
4. **Security Cases:** Authorization, validation
5. **Performance Cases:** Under load conditions (for NFRs)

**Example Set:**

```
FR-003: Password Reset

Happy Path:
- Given a registered user email, when reset is requested, then a reset link is sent

Edge Cases:
- Given an email at the character limit (254 chars), when submitted, then it processes correctly
- Given a user who requested reset 5 minutes ago, when requesting again, then the previous link is invalidated

Error Cases:
- Given an unregistered email, when reset is requested, then the same success message shows (no email enumeration)
- Given an expired reset link, when clicked, then an "expired" message with new reset option appears

Security Cases:
- Given a reset link, when used once, then it cannot be reused
- Given a reset link, when 24 hours pass, then it expires
```

## Prioritization

### MoSCoW Method

**Must Have (M):** Core functionality. Feature fails without these.
- Critical path functionality
- Security requirements
- Legal/compliance requirements

**Should Have (S):** Important but not critical.
- Significant user value
- Expected functionality
- Can be worked around if missing

**Could Have (C):** Nice to have.
- Quality of life improvements
- Enhanced user experience
- Optimization features

**Won't Have (W):** Explicitly excluded.
- Future considerations
- Out of scope for this iteration
- Deferred features

**Example:**
```
Must Have:
- FR-001: User Login (core access)
- FR-002: Data Display (primary value)
- NFR-001: Security (compliance)

Should Have:
- FR-003: Data Export (high value)
- FR-004: Search (expected feature)

Could Have:
- FR-005: Dark Mode (nice to have)
- FR-006: Keyboard Shortcuts (power users)

Won't Have:
- FR-007: Mobile App (future phase)
- FR-008: Offline Mode (deferred)
```

## Success Metrics

### Types of Metrics

**Technical Metrics:**
- Response time (p50, p95, p99)
- Error rate
- Throughput
- Test coverage

**Business Metrics:**
- User adoption rate
- Task completion rate
- Time to complete task
- Support ticket reduction

**Quality Metrics:**
- Bug count post-release
- Code review feedback
- Technical debt created

### Metric Format

```
| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| API response time | p95 < 200ms | APM monitoring |
| Error rate | < 0.1% | Error tracking |
| Test coverage | > 80% | Coverage tool |
| User task completion | > 90% | Analytics |
```

## Common Anti-Patterns

### Vague Requirements
❌ "The system should handle errors gracefully"
✅ "The system shall display user-friendly error messages with error codes and retry options when API calls fail"

### Implementation Details
❌ "The system shall use Redis for caching"
✅ "The system shall cache frequently accessed data with TTL of 5 minutes"

### Untestable Criteria
❌ "Users should find the interface intuitive"
✅ "New users shall complete onboarding in under 5 minutes without help documentation"

### Gold Plating
❌ Adding nice-to-have features as must-haves
✅ Strict prioritization with clear justification

### Missing Edge Cases
❌ Only documenting happy path
✅ Systematic consideration of boundaries, errors, and edge cases

## Requirements Checklist

Before finalizing requirements, verify:

- [ ] Each requirement has a unique identifier
- [ ] Requirements are SMART
- [ ] Acceptance criteria use Given/When/Then
- [ ] Happy path, edge cases, and error cases covered
- [ ] Non-functional requirements included
- [ ] Prioritization applied (MoSCoW)
- [ ] Success metrics defined and measurable
- [ ] Dependencies identified
- [ ] Assumptions documented
- [ ] Out of scope items listed
