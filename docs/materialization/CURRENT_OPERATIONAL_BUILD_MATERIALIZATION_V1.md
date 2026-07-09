# Current Operational Build Materialization V1

Operation: CURRENT_OPERATIONAL_BUILD_MATERIALIZATION_V1

Date: 2026-07-09

## Scope

Materialize the latest current operational runtime from the historical working repository into the clean Mental Smile Platform repository.

Historical working repo:

`C:\mental_smile_workspace\app\mental-smile-platform`

Clean repo:

`C:\mental_smile_workspace\repositories\mental-smile-platform-clean`

## Files / Folders Copied

Runtime folders copied from the historical repository:

- `lib/`
- `assets/`
- `web/`
- `android/`
- `test/`

Root files copied:

- `pubspec.yaml`
- `pubspec.lock`
- `analysis_options.yaml`
- `firebase.json`
- `firestore.rules`
- `storage.rules`
- `firestore.indexes.json`
- `l10n.yaml`

Workflow retained and updated in the clean repo:

- `.github/workflows/github-pages.yml`

## Files / Folders Intentionally Excluded

Not copied from the historical repository:

- `.git/`
- `build/`
- `.dart_tool/`
- `.firebase/`
- `backups/`
- `public-landing/`
- old generated analyzer text files such as `analyze*.txt` and `analyzer*.txt`
- `docs/archive/`
- `docs/capsules/builds/`
- `docs/emergency-recovery-vault/`
- `mental-smile-os-workspace/`
- historical full archive material
- old Firebase Hosting workflow stubs
- `functions/` because it is not required for Flutter web build/runtime verification in this materialization

Android local/generated files removed after copy:

- `android/.gradle/`
- `android/.kotlin/`
- `android/local.properties`

## Governance Preserved

The existing clean repository governance documentation was preserved:

- `docs/repository/`
- `docs/github/`
- `docs/firebase/`
- `docs/codex/`
- `docs/deployment/`
- `docs/operations/`
- `docs/materialization/`
- clean capsule policy documents already present in the clean repository

Historical `docs/archive/`, emergency recovery vault, capsule builds, and backup material were not imported.

## Placeholders Removed / Replaced

The previous landing-only Flutter shell was replaced by the current operational runtime.

The previous placeholder entry routes were replaced by the real runtime routes:

- Mobile entry uses the real `Routes.splash` behavior.
- Desktop entry uses the real `Routes.legacySplash` behavior.

No placeholder mobile/desktop pages remain as the active entry behavior.

## Build Results

Command executed:

```powershell
flutter build web --release --base-href /mental-smile-platform/
```

Result: PASSED

Output:

`build/web`

## Analyze Results

Command executed:

```powershell
flutter analyze
```

Result: PASSED

Analyzer output:

`No issues found!`

## Arabic Encoding Fix Result

Arabic mojibake scan found corrupted strings in:

- `lib/app/router/app_router.dart`

Fixed strings:

- `الوصول غير متاح`
- `هذه الصفحة غير متاحة لهذا الحساب.`
- `العودة للقائمة`

Final mojibake scan result: PASSED

No remaining `Ø`, `Ù`, `Ã`, or `Â` mojibake markers were found in `lib`, `assets`, `web`, or `pubspec.yaml`.

## GitHub Pages Readiness

GitHub Pages workflow remains configured to:

- run on `workflow_dispatch`
- run on push to `post-separation-pure-dna-v1`
- run `flutter pub get`
- run `flutter build web --release --base-href /mental-smile-platform/`
- add `build/web/.nojekyll`
- publish only `build/web`
- publish to `gh-pages`
- use clean/orphan publish
- avoid Firebase Hosting
- avoid `actions/deploy-pages`

Status: READY

## Android Readiness

Android project exists and is build-preparation ready:

- `android/app/`
- `android/build.gradle.kts`
- `android/settings.gradle.kts`
- `android/gradle/`
- `android/gradlew`
- `android/gradlew.bat`

Android release signing was not configured.

Android release build was not run.

Status: PREPARATION_READY

## Firebase Status

Firebase configuration files were imported because they are part of the current operational runtime configuration:

- `firebase.json`
- `firestore.rules`
- `storage.rules`
- `firestore.indexes.json`
- `lib/firebase_options.dart`

Firebase Hosting deploy was not run.

Firestore rules deploy was not run.

Storage rules deploy was not run.

Functions were not imported in this operation.

## Risks

- Android release signing is still pending before Google Play internal testing upload.
- GitHub Pages must complete the workflow run after push before the public site updates.
- Firebase deployment remains a separate future operation.
- `flutter_markdown` is marked discontinued by pub output, but current constraints still resolve and build successfully.

## Next Steps

1. Confirm GitHub Actions deploy completes successfully.
2. Open `https://kingbasbosa-beep.github.io/mental-smile-platform/` after workflow completion.
3. Prepare Android signing in a separate Play Console readiness operation.
4. Keep Firebase production deployment as a separate controlled operation.

## Final Status

Operational runtime imported: YES

Landing still works: YES

Mobile entry real: YES

Desktop entry real: YES

Web build passed: YES

Analyze passed: YES

Arabic encoding fixed: YES

Android project ready: YES

Firebase imported: YES

Result: CURRENT_OPERATIONAL_BUILD_MATERIALIZATION_V1_COMPLETED
