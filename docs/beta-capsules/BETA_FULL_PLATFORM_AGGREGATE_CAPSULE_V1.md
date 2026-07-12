# Beta Full Platform Aggregate Capsule V1

Capsule ID: MS-BETA-FULL-PLATFORM-AGGREGATE-CAPSULE-V1

Status: MATERIALIZED_PENDING_OWNER_VALIDATION

## Included Capsules

- MS-BETA-PLATFORM-RUNTIME-CAPSULE-V1
- MS-BETA-FIREBASE-CAPSULE-V1
- Landing/GitHub Pages runtime via `.github/workflows/github-pages.yml`

## Public Runtime

Included:

- Residential
- Commercial
- Library
- Landing
- Central Platform Core

Excluded as runtime sections:

- Owner
- Administrative
- Archive
- Marketing
- Monitoring

## Landing and GitHub Pages

GitHub Pages workflow:

- `.github/workflows/github-pages.yml`

Branch corrected to:

- `residential-assets-purification-v1`

Build command:

```powershell
flutter build web --release --base-href /mental-smile-platform/
```

Deployment path:

- GitHub Actions workflow to `gh-pages`

Firebase Hosting:

- DISABLED for this beta path

## Final Verification Checklist

Manual validation required:

- Client login/logout
- Specialist login
- Center login
- Survey/check-in storage
- Feedback/suggestion storage
- Specialist application
- Center application
- Production signals in all five core collections
- Client local session clear
- Mobile normal card set
- Mobile distinguished/accessibility card set
- Landing route
- GitHub Pages URL

## Debug/Test Runtime Residue

Public runtime must not import probe tools.

Retained outside public runtime:

- `tool/platform_core_phase_2c_probe.dart`
- `tool/platform_core_production_probe.dart`
- architecture/unit tests under `test/`

Known owner-decision retained legacy signal paths:

- `signal_events`
- `archive_signal_events`

Reason:

Active callers still exist. Removing them without a dedicated replacement pass may break current runtime paths.

## Final Manual Commands

```powershell
cd C:\mental_smile_workspace\app\mental-smile-platform
dart format lib test tool
flutter gen-l10n
flutter analyze
flutter test
flutter build web --release --base-href /mental-smile-platform/
firebase use
firebase deploy --only firestore:rules
flutter run -d chrome -t tool/platform_core_production_probe.dart
git status --short
git diff --stat
git add .github/workflows/github-pages.yml lib/features/generation2_mobile_client_room docs/beta-capsules
git commit -m "Finalize beta runtime, Firebase, landing, and platform capsules"
git push origin residential-assets-purification-v1
```

## Verdict

MENTAL SMILE BETA RUNTIME: PENDING_OWNER_VALIDATION

PUBLIC RUNTIME: RESIDENTIAL + COMMERCIAL + LIBRARY

CENTRAL PLATFORM CORE: PRODUCTION ACTIVE

FIREBASE: MATERIALIZED_PENDING_RULES_DEPLOYMENT

LANDING: WORKFLOW_BRANCH_CORRECTED

CLIENT TEMPORARY DATA: LOCAL ONLY

SPECIALIST/CENTER DATA: FIREBASE PERSISTENT

PASSWORDS: FIREBASE AUTH ONLY

FINAL CAPSULES: MATERIALIZED
