# Entry/Auth Content Cards Config Alignment Report V1

Operation ID: OP-ENTRY-AUTH-CONTENT-CARDS-CONFIG-ALIGNMENT-V1
Date: 2026-06-23
Mode: Content cards and config alignment only
Section: Entry/Auth

## Files Created

- `docs/sections/entry-auth/ENTRY_AUTH_CONTENT_CARD_GUIDE_V1.md`
- `docs/sections/entry-auth/cards/ENTRY_AUTH_SCREEN_CARDS_V1.md`
- `docs/sections/entry-auth/cards/ENTRY_AUTH_BUTTON_CARDS_V1.md`
- `docs/sections/entry-auth/cards/ENTRY_AUTH_ROUTE_CARDS_V1.md`
- `docs/sections/entry-auth/cards/ENTRY_AUTH_YAML_ASSET_CARDS_V1.md`
- `docs/sections/entry-auth/cards/ENTRY_AUTH_FIREBASE_RULE_CARDS_V1.md`
- `docs/sections/entry-auth/ENTRY_AUTH_ALIGNMENT_FINDINGS_V1.md`
- `docs/sections/entry-auth/ENTRY_AUTH_CONTENT_CARDS_CONFIG_ALIGNMENT_REPORT_V1.md`

## Files Inspected

- `lib/features/splash/presentation/pages/splash_page.dart`
- `lib/features/auth/presentation/pages/login_page.dart`
- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`
- `lib/core/auth/account_access_service.dart`
- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`
- `lib/app/app.dart`
- `pubspec.yaml`
- `firebase.json`
- `.firebaserc`
- `firestore.rules`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md`

## Cards Created

- Screen cards count: 4
- Button/control cards count: 10
- Route cards count: 16
- YAML asset cards count: 4
- Firebase rule/dependency cards count: 6
- Total cards created: 40

## Findings

- Wrong destinations found: 0
- Dead routes found: 0
- ARCHIVE_ONLY items found: 2
- Extra YAML entries found: 0
- Rules mismatches found: 0 confirmed
- Owner decision items found: 3

## Official Website Destination Status

Status: UNVERIFIED_OWNER_REQUIRED

Evidence:

- Splash Official Website button opens `Routes.portalHome`.
- `Routes.portalHome` is `/`.
- Router maps `/` to `PortalHomePage`.
- `firebase.json` sets hosting public folder to `public-landing`.
- `.firebaserc` sets default Firebase project to `mental-smile-platform`.
- No local config proves the final deployed public URL or custom domain.

Conclusion:

The route is not proven wrong because it opens a public portal route, not Owner or Commercial dashboard. The hosted web URL still needs Owner verification.

## Runtime / Config Change Statement

- Runtime changed: NO
- Runtime before/after: not applicable
- Routes changed: NO
- Firebase rules changed: NO
- YAML changed: NO
- Firebase deploy: NO
- Commit/push/tag: NO

## Operations Update

- Operations Registry updated: YES
- Operations Index updated: YES

## Final Verdict Format

Card Foundation Status: PASS

Cards Created: 40

Screen Cards: 4

Button Cards: 10

Route Cards: 16

YAML Asset Cards: 4

Firebase Rule Cards: 6

Wrong Destinations Found: 0

Official Website Link Status: UNVERIFIED_OWNER_REQUIRED

Runtime Changed: NO

Routes Changed: NO

Firebase Rules Changed: NO

YAML Changed: NO

Operations Registry Updated: YES

Operations Index Updated: YES

Final Verdict: ENTRY_AUTH_CONTENT_CARDS_AND_CONFIG_ALIGNMENT_COMPLETED
