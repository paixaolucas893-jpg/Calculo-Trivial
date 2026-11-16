# AGENTS.md — Cálculo Trivial

## Purpose

This file defines repository-level instructions for AI coding agents.

It complements the existing project documentation. It does not replace
technical requirements, product decisions, security rules, or code contracts.

Read this file before changing the project.

## Project identity

- Public product: Cálculo Trivial.
- Internal Dart package: `calcquest`.
- Android application ID: `com.lucaszion01.calculotrivial`.
- Primary platform: Android.
- Client: Flutter, Dart, Material 3.
- Backend: Firebase Authentication, Cloud Firestore, Cloud Functions.
- Security: Firebase App Check and Firestore Security Rules.
- Monetization: RevenueCat.
- Localization: Flutter localization, PT/EN.

Do not introduce a new framework, backend, database, or paid service
without an explicit technical justification and approval.

## Authoritative documentation

Consult the relevant document before proposing changes:

- `docs/PRD.md` — product goals, audience, pedagogy, scope.
- `docs/TRD.md` — technical requirements and trust boundaries.
- `docs/PRODUCT_FLOWS.md` — user journeys and feature behavior.
- `docs/DESIGN_SYSTEM.md` — UI, accessibility and visual rules.
- `docs/BACKEND_ARCHITECTURE.md` — Firebase and backend architecture.
- `docs/ROADMAP.md` — milestones, gates and release decisions.
- `docs/PROJECT_DOCUMENTATION.md` — documentation index.
- `SECURITY.md` — security reporting policy.
- `README.md` — public introduction and setup.

Do not create duplicate master documents when an existing document
already owns the subject.

When documentation conflicts with current code, inspect the actual
implementation and explain the discrepancy before proposing changes.

Historical documentation may describe a previous development state.
Do not assume it is an accurate description of the current branch.

## Release-state terminology

Always distinguish the following states:

1. Planned: design or requirement only.
2. Implemented: code exists.
3. Tested: relevant automated checks pass.
4. Integrated: code has been merged into a branch.
5. Enabled: feature is actually connected and callable.
6. Deployed: backend or other infrastructure is published.
7. Released: Android artifact is distributed through Google Play.

Passing CI or merging a pull request does not prove deployment or
user-visible availability.

The last recorded Android baseline is `1.2.0+24`.
Verify the actual release state before making publication claims.

## Phase 9 — Learning History

The Phase 9.3 integration was merged through PR #117.

Reference integration commit:
`6f39b4a`

The repository contains:

- Durable learning-history pending-event queue.
- Stable event identifiers and confirmation behavior.
- Generation-aware synchronization components.
- Authentication and session guards.
- Firestore security constraints.
- Backend reset and purge service components.
- Automated security, backend and Flutter tests.

Important: integration into the release branch does not mean that
automatic synchronization or remote reset has been activated.

### Offline outbox restrictions

Relevant source files:

- `lib/shared/data/pending_learning_history_queue.dart`
- `lib/shared/data/learning_history_outbox_sync_service.dart`
- `lib/shared/data/learning_history_firestore_sync_factory.dart`
- `lib/shared/data/learning_history_authenticated_sync_guard.dart`
- `lib/shared/data/learning_history_generation_session.dart`
- `lib/shared/data/learning_history_queue_sync_policy.dart`
- `lib/shared/state/app_progress.dart`

The Firestore synchronization factory must remain detached from:

- app startup;
- automatic background tasks;
- timers or periodic uploads;
- reset flows;

until the necessary end-to-end security checks and explicit
activation approval are complete.

Do not enable network synchronization merely because the factory
and service classes exist.

Preserve:

- user identity isolation;
- server-verified generation;
- rejection of stale or unversioned events when ineligible;
- durable retention of unconfirmed events;
- acknowledgment only after server confirmation;
- protection against concurrent synchronization;
- protection against stale asynchronous responses;
- session invalidation after user changes and reset.

Do not silently discard pending learning-history data.

### Remote reset restrictions

Relevant backend source:

`functions/src/progress/learningHistoryResetCallableHandler.ts`

The reset handler is currently an internal component.
Do not export it as a publicly callable Firebase Function
without explicit approval and end-to-end validation.

Before any activation, validate:

- authenticated identity;
- recent authentication;
- reset generation barriers;
- in-flight operations;
- offline and stale devices;
- legacy data cleanup;
- concurrency and retry behavior;
- Firestore permissions;
- account deletion interactions.

Do not test destructive reset operations against production
student data.

## Security invariants

- The client is not a trusted authority.
- Firebase Authentication owns user identity.
- Backend-owned state must be protected server-side.
- Cloud Functions using Admin SDK must validate authorization
  explicitly because Admin SDK bypasses Firestore Security Rules.
- Firestore rules must deny access by default unless authorized.
- Premium entitlement must follow trusted provider state.
- Canonical rewards and final-test decisions cannot depend solely
  on client-supplied values.
- AI output must not become an unchecked canonical decision.
- No secrets, service-account credentials, signing files,
  private keys or passwords may be committed.
- Do not bypass App Check in production.
- Preserve account deletion and privacy requirements.

Any change to Firestore rules must include appropriate emulator tests.

## Git and development workflow

Work incrementally and preserve unrelated user changes.

Before changing files:

1. Check current repository, branch and commit.
2. Inspect `git status`.
3. Read the relevant source files and documentation.
4. Explain the proposed scope and risks.
5. Prefer an isolated branch or worktree for risky changes.
6. Make the smallest change consistent with the requirements.
7. Run the relevant checks.
8. Review the final diff and status.

Do not execute destructive Git operations by default.

Specifically, do not use `git reset --hard`, `git clean`,
`git restore`, force push or broad file overwrites to discard
unknown work.

Do not automatically commit, push, merge, deploy or publish.
These actions require explicit approval.

Do not modify the Google Play release as a side effect of
ordinary development.

A previously observed local `pubspec.lock` status was modified,
despite no content differences in Git comparison.
Do not discard or overwrite this file without a new diagnosis.

## Quality checks

Flutter checks:

- `flutter analyze --no-pub`
- `flutter test --no-pub`

When dependencies or generated localization outputs change,
use the project's documented dependency and localization
workflow before rerunning validations.

Backend checks, from the repository root:

- `npm --prefix functions run lint`
- `npm --prefix functions run build`

Security and backend integration tests use the Firebase
Firestore Emulator.

Consult `.github/workflows/flutter_ci.yml` for the actual
CI commands and supported Node version.

Do not assume the local Node version equals the Cloud Functions
deployment runtime.

The Phase 9.3 integration previously passed:

- 34 Firestore security tests;
- 257 backend tests;
- 295 Flutter tests.

These are historical validation results, not a guarantee that
subsequent changes pass.

Always validate changes against the current code.

## Product and pedagogy

The product prioritizes learning quality over engagement metrics.

Follow `docs/PRD.md` and `docs/PRODUCT_FLOWS.md`.

Do not:

- equate a single correct answer with mastery;
- treat a mistake as proof of inability;
- let AI independently assign canonical progress;
- alter reward and progression rules casually;
- add exercises merely to increase content volume.

Keep practice, review, final assessment and canonical progress
conceptually distinct.

## UI and localization

Follow `docs/DESIGN_SYSTEM.md`.

Use the existing Flutter localization infrastructure.

Do not hardcode new user-facing strings when localization
resources should be used.

Preserve accessibility and responsiveness.

Do not introduce Next.js, shadcn/ui or other web UI frameworks
into the Flutter application without a separate approved scope.

## Toolkit adoption

The Vibe Coding Toolkit is a source of optional development
practices, not a replacement architecture.

Adopt tools selectively after:

1. brainstorming;
2. checking existing capabilities;
3. compatibility review;
4. security and cost evaluation;
5. explicit approval;
6. isolated validation.

Do not automatically run downloaded setup scripts.
Do not install tools globally without approval.
Do not enable external telemetry or send project data to
new services without review.

## Communication and execution

For interactive development with the project owner:

- Work one step at a time.
- Supply complete PowerShell commands and full replacement
  files when code changes are needed.
- Prefer read-only diagnostics before modifications.
- State expected outcomes and failure conditions.
- Inspect the output before proceeding.
- Do not claim completion without evidence.
- Clearly identify completed, pending and blocked work.

For sensitive operations, stop and request approval
instead of inferring permission from a general development goal.

## Maintenance

Update this file only when repository-level agent rules change.

Keep product requirements in PRD, technical decisions in TRD,
backend architecture in BACKEND_ARCHITECTURE, and planned
milestones in ROADMAP.

Avoid copying large sections of those documents into this file.

This file is a navigation and safety contract, not a second
source of truth.
