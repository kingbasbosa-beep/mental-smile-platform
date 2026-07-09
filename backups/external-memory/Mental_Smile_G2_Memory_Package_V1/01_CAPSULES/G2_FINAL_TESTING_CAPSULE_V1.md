# Generation 2 Final Testing Capsule V1

Date: 2026-07-06

Capsule status: DOCUMENTATION_READY / VERIFICATION_NOT_RUN_USER_MANUAL

## What Generation 2 Contains

Generation 2 currently contains a mobile entry flow, G2 mobile account-selection flow, client/premium/specialist/center mobile room surfaces, shared Daleel Assistant guide/survey UI, and related commercial login/register routes for specialist and center providers.

## Active Screens

| Screen | Route / Entry | File | Status |
| --- | --- | --- | --- |
| G2 Splash | `/splash` | `lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart` | ACTIVE |
| Mobile Login Selection | `/g2/mobile/login-selection` | `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart` | ACTIVE |
| Client Account Selection | Parent-pushed | `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart` | ACTIVE |
| Supporters Account Selection | Parent-pushed | `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart` | PARTIAL / MISSING_ASSET |
| Client Friend Room | Parent-pushed | `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart` | ACTIVE |
| Premium Friend Room | `/g2/mobile/client-room` | `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart` | ACTIVE / NEEDS_OWNER_DECISION |
| Specialist Friend Room | `/g2/mobile/specialist-room` | `lib/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart` | ACTIVE |
| Center Friend Room | `/g2/mobile/center-room` | `lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart` | ACTIVE |
| Commercial Access | `/commercial/access` | `lib/features/commercial/presentation/pages/commercial_access_page.dart` | ACTIVE |
| Specialist Login/Register | `/commercial/specialist/login`, `/commercial/specialist/register` | `lib/features/commercial/presentation/pages/` | ACTIVE / NEEDS_AUTH_TEST |
| Center Login/Register | `/commercial/center/login`, `/commercial/center/register` | `lib/features/commercial/presentation/pages/` | ACTIVE / NEEDS_AUTH_TEST |

## Account Flows

| Flow | Steps | Notes |
| --- | --- | --- |
| Client Friend | `/splash` -> `/g2/mobile/login-selection` -> Friends -> `صديقي العميل` -> Client Friend Room | Client account selection is parent-pushed, not route-addressable. |
| Premium Friend | `/splash` -> `/g2/mobile/login-selection` -> Friends -> `صديقي المميز` -> `/g2/mobile/client-room` | Uses shared mobile room scaffold. |
| Specialist Supporter | `/splash` -> `/g2/mobile/login-selection` -> Supporters -> `أخصائيين داعمين` -> `/g2/mobile/specialist-room` | Route is included in clinician protected route set. |
| Center Supporter | `/splash` -> `/g2/mobile/login-selection` -> Supporters -> `مراكز داعمة` -> `/g2/mobile/center-room` | Route is included in center protected route set. |
| Desktop Specialist | `/commercial/access` -> `/commercial/specialist/login` -> `/commercial/room` | Uses `CommercialAuthService`. |
| Desktop Center | `/commercial/access` -> `/commercial/center/login` -> `/commercial/center/room` | Uses `CommercialAuthService`. |

## Guide Images

Connected guide images are recorded in `G2_GUIDE_ASSET_REGISTRY_V1.md`.

Known blocker: `assets/branding/guides/supporters_account_selection_mobile_guide.png` is referenced but missing at scan time.

## Surveys

All shared Daleel surveys are local only:

- Storage: temporary widget state.
- Backend: NONE.
- Firebase: NONE.
- Output: `debugPrint` only.

Survey registry: `G2_SURVEY_REGISTRY_V1.md`.

## Routes

Route map: `G2_ROUTE_MAP_V1.md`.

Key route risks:

- Client/supporter account selection screens are parent-pushed rather than named routes.
- `Routes.generation2MobileLiteClient` remains active but is no longer the current splash target.
- Provider G2 room routes are included in role-protected route sets.

## Auth Status

Specialist and center login/register pages use `CommercialAuthService`. This capsule did not modify authentication behavior and does not certify credentials or Firebase connectivity. Manual auth tests are required.

## Known Risks

| Risk | Status | Action |
| --- | --- | --- |
| Missing supporters guide image | BLOCKER_FOR_GUIDE_VISUAL | Add the requested PNG asset. |
| Premium Friend guide image name may be wrong | NEEDS_OWNER_DECISION | Confirm dedicated asset vs current specialist friend guide. |
| G2 signals not implemented | GOVERNANCE_ONLY | Implement later through approved signal runtime. |
| `dart format lib test` can mutate many dirty files | DO_NOT_RUN_MUTATING_INVENTORY | Owner will run verification manually. |
| Existing worktree is heavily dirty | NEEDS_OWNER_AWARENESS | Do not revert unrelated changes. |

## Manual Testing Plan

1. Open `/splash`.
2. Tap Mobile and confirm `/g2/mobile/login-selection`.
3. Open Daleel guide and survey on Mobile Login Selection.
4. Tap Friends, test Client Account Selection guide/survey.
5. Open Client Friend and Premium Friend rooms and test Daleel guide/survey.
6. Return to Mobile Login Selection, tap Supporters.
7. Test Supporters Account Selection guide/survey after missing guide asset is supplied.
8. Open Specialist and Center rooms with appropriate auth/route permissions.
9. Open `/commercial/access` on desktop landscape and test Commercial Access Daleel.
10. Test specialist and center login/register flows with real test accounts.

## Backup Plan

- Commit or otherwise checkpoint all current docs/runtime work.
- Suggested tag: `g2-final-testing-prep-v1`.
- Suggested backup folder: `backups/mental-smile-g2-final-testing-prep-v1/`.
- Include source, docs, `pubspec.yaml`, Firebase config/rules/indexes, and guide assets.
- Do not create large binary backup in this task unless owner approves.

## Rollback Plan

1. Keep current branch and commit hash before final testing.
2. If testing fails due docs-only changes, revert docs additions only.
3. If testing fails due previous runtime changes, use `git diff` to isolate runtime files and ask owner before reverting.
4. Never delete guide assets or route constants without owner approval.

## Handoff

Hand this capsule plus:

- `G2_TESTER_HANDOFF_V1.md`
- `G2_ROUTE_MAP_V1.md`
- `G2_SURVEY_REGISTRY_V1.md`
- `G2_GUIDE_ASSET_REGISTRY_V1.md`
- `G2_FINAL_CLEANUP_AUDIT_V1.md`
- `G2_FINAL_VERIFICATION_REPORT_V1.md`
