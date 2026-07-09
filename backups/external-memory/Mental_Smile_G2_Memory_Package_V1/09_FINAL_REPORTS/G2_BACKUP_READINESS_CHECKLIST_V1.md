# Generation 2 Backup Readiness Checklist V1

Date: 2026-07-06

Suggested tag: `g2-final-testing-prep-v1`

Suggested backup folder: `backups/mental-smile-g2-final-testing-prep-v1/`

Do not create a huge binary backup during this documentation task unless the owner explicitly approves.

## Checklist

| Item | Status | Notes / Command |
| --- | --- | --- |
| Git status clean | NOT_READY | Run `git status --short`; worktree was known dirty before this task. |
| All intended changes committed | NOT_READY | Commit only after owner review. |
| Branch name recorded | NEEDS_OWNER_DECISION | Record current branch before tag. |
| Tag name selected | READY_AS_SUGGESTION | `g2-final-testing-prep-v1`. |
| Asset folder backed up | PENDING | Include `assets/branding/guides/`, `assets/images/mobile/`. |
| Docs backed up | PENDING | Include `docs/generation-2/` and operations ledgers. |
| Firebase config backed up | PENDING | Include `firebase.json`, `firestore.rules`, `firestore.indexes.json`, `storage.rules` if applicable. |
| Firestore rules exported | PENDING | No deploy/export done by this task. |
| Environment variables documented | PENDING | Owner/team should record local/env secrets outside repo. |
| Build output generated | NOT_RUN_USER_MANUAL | Owner will run `flutter build web` manually; see `G2_FINAL_VERIFICATION_REPORT_V1.md`. |
| Zip backup created | NOT_DONE | Only create with owner approval. |
| External drive/cloud copy created | NOT_DONE | Manual owner action. |
| Rollback point created | NOT_READY | Requires commit/tag. |
| Missing supporters guide asset resolved | NOT_READY | Add `supporters_account_selection_mobile_guide.png`. |

## Suggested Manual Backup Steps

1. Confirm app builds and final testing docs are accepted.
2. Run `git status --short`.
3. Stage intentional files only.
4. Commit with a message such as `docs: prepare g2 final testing inventory`.
5. Tag the commit: `git tag g2-final-testing-prep-v1`.
6. Copy the repository or selected folders to `backups/mental-smile-g2-final-testing-prep-v1/`.
7. Include generated build output only if final build succeeds.
8. Store external/cloud copy outside the working repo.
