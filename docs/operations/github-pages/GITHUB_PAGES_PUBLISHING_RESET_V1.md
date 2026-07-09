# GitHub Pages Publishing Reset V1

Status: COMPLETED
Date: 2026-07-08
Scope: Temporary web publishing reset

## Final Publishing Decision

- Temporary Web Publishing = GitHub Pages only from `gh-pages`.
- Official Production Publishing = Firebase later.
- No `/docs` publishing source.
- No `public-landing` publishing source.
- No Firebase workflow for temporary publishing.

## Cause Of The Problem

GitHub Pages was serving an old website because the active Pages source was not guaranteed to be a clean replacement of the latest Flutter Web build.

The stale page was a legacy web portal / Phase 1 skeleton, not the current landing UI.

The issue was a publishing source problem, not a Flutter UI problem.

## Correct Publishing Source

The only accepted temporary publishing source is:

- Source branch: `post-separation-pure-dna-v1`
- Build output: `build/web`
- Publish branch: `gh-pages`
- Publish folder: `/root`

The required build command remains:

```bash
flutter build web --release --base-href /mental-smile-os/
```

## Root Route Verification

The Flutter root route `/` was reviewed and is mapped to:

- `CommercialV2WebShowcasePage`

Evidence:

- `lib/app/router/app_router.dart`
- Root check: `settings.name == '/'`
- Builder: `CommercialV2WebShowcasePage`

No route changes were made in this phase.

## Workflow Used

The temporary publishing workflow is:

- `.github/workflows/github-pages.yml`

It now:

- Checks out `post-separation-pure-dna-v1`.
- Uses Flutter stable.
- Runs `flutter pub get`.
- Builds with `flutter build web --release --base-href /mental-smile-os/`.
- Adds `build/web/.nojekyll`.
- Verifies `build/web/index.html`.
- Publishes only `build/web` to `gh-pages`.
- Publishes to the root of `gh-pages`.
- Uses orphan deployment behavior.
- Does not preserve old `gh-pages` files.
- Does not use `actions/deploy-pages`.
- Does not use GitHub Pages Environment deployment.

## Other Workflows

The Firebase Hosting workflows were disabled for automatic/active temporary publishing:

- `.github/workflows/firebase-hosting-merge.yml`
- `.github/workflows/firebase-hosting-pull-request.yml`

They are left as manual stubs with disabled jobs so they cannot publish stale or competing temporary web output.

## Required Manual GitHub Pages Settings

Inside GitHub:

1. Open `kingbasbosa-beep/mental-smile-os`.
2. Go to `Settings > Pages`.
3. Set `Build and deployment > Source` to `Deploy from a branch`.
4. Set `Branch` to `gh-pages`.
5. Set `Folder` to `/root`.

## Files Modified

- `.github/workflows/github-pages.yml`
- `.github/workflows/firebase-hosting-merge.yml`
- `.github/workflows/firebase-hosting-pull-request.yml`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`

## Files Created

- `docs/operations/github-pages/GITHUB_PAGES_PUBLISHING_RESET_V1.md`

## Files Not Touched

- Flutter UI files were not changed.
- Flutter runtime files were not changed.
- Firebase config was not changed.
- Firestore Rules were not changed.
- Routes were not changed.
- Assets were not changed.
- Localization was not changed.
- `pubspec.yaml` was not changed.
- Application logic was not changed.

## Post-Deploy Verification

After the workflow deploys, verify with:

- `https://kingbasbosa-beep.github.io/mental-smile-os/?v=latest`

Also verify in an incognito/private browser window to avoid browser cache.

Expected result:

- The current Mental Smile landing page appears.
- The old Phase 1 Skeleton / Owner portal page does not appear.

## Final Verdict

GITHUB_PAGES_PUBLISHING_RESET_V1_COMPLETED
