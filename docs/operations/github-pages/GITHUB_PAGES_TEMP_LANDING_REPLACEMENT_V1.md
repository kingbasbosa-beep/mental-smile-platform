# GitHub Pages Temp Landing Replacement V1

Status: CERTIFIED_NO_WORKFLOW_CHANGE_REQUIRED
Date: 2026-07-08
Scope: GitHub Pages temporary landing publishing certification

## Current Workflow State

Inspected workflow:

- `.github/workflows/github-pages.yml`

The workflow is already configured to publish the current Flutter landing/showcase.

Current behavior:

- Source branch: `post-separation-pure-dna-v1`
- Build output: `build/web`
- Publish branch: `gh-pages`
- Publish folder: `/root`
- Base href: `/mental-smile-os/`

## Workflow Changed

No.

The workflow already:

- checks out `post-separation-pure-dna-v1`,
- sets up Flutter stable,
- runs `flutter pub get`,
- runs `flutter build web --release --base-href /mental-smile-os/`,
- adds `build/web/.nojekyll`,
- verifies `build/web/index.html`,
- publishes only `build/web` to `gh-pages`,
- uses `force_orphan: true`,
- uses `keep_files: false`,
- does not use `actions/deploy-pages`,
- does not publish from `/docs`,
- does not publish from `public-landing`.

## Publishing Source

- Runtime source: `post-separation-pure-dna-v1`
- Generated source: `build/web`

## Publishing Target

- Branch: `gh-pages`
- Folder: `/root`
- Content type: generated Flutter Web output only

## Root Route Verification

The Flutter root route `/` maps to:

- `CommercialV2WebShowcasePage`

Evidence:

- `lib/app/router/app_router.dart`
- `settings.name == '/'`
- `builder: (_) => const CommercialV2WebShowcasePage()`

## `public-landing` Status

`public-landing/` exists in the repository as legacy/static historical material.

It is not used by the GitHub Pages workflow.
It was not deleted.
It was not revived.

## `docs` Status

`docs/` remains governance/documentation/history material.

It is not used as the GitHub Pages publishing source.

## Manual GitHub Settings Reminder

Inside GitHub:

1. Open `kingbasbosa-beep/mental-smile-os`.
2. Go to `Settings > Pages`.
3. Set `Build and deployment > Source` to `Deploy from a branch`.
4. Set `Branch` to `gh-pages`.
5. Set `Folder` to `/root`.

## Verification URL

Use:

- `https://kingbasbosa-beep.github.io/mental-smile-os/?v=latest`

Also test in incognito/private mode to avoid browser cache.

## Final Verification

- Runtime changed: NO
- UI changed: NO
- Routes changed: NO
- Firebase changed: NO
- Workflow changed: NO
- GitHub Pages source: `gh-pages` / `/root`
- Published content type: Flutter `build/web` only
- `public-landing` status: legacy, not publishing source
- `docs` status: governance only, not publishing source

## Final Verdict

GITHUB_PAGES_TEMP_LANDING_REPLACEMENT_V1_COMPLETED
