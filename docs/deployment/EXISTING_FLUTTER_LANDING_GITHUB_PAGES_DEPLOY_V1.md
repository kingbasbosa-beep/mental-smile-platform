# Existing Flutter Landing GitHub Pages Deploy V1

Operation: EXISTING_FLUTTER_LANDING_GITHUB_PAGES_DEPLOY_V1

Date: 2026-07-08

## Purpose

Publish the existing Mental Smile Flutter landing page to GitHub Pages for temporary testing access before official production.

This operation does not create a new landing page and does not change the landing UI.

## Landing Source File

`lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`

## Route Paths

- `/`
- `/landing-preview`

## Workflow Path

`.github/workflows/github-pages.yml`

## Workflow Trigger

- `workflow_dispatch`
- push to `post-separation-pure-dna-v1`

## Build Command

```bash
flutter build web --release --base-href /mental-smile-platform/
```

## Base Href

`/mental-smile-platform/`

## Publish Source

`build/web`

## Publish Branch

`gh-pages`

## Publish Folder

`/root`

## Clean Publish Behavior

The workflow uses `peaceiris/actions-gh-pages@v3` with:

- `publish_dir: ./build/web`
- `publish_branch: gh-pages`
- `destination_dir: .`
- `force_orphan: true`
- `keep_files: false`
- `enable_jekyll: false`

This means the generated Flutter web build replaces the `gh-pages` branch contents on each deploy.

## GitHub Pages Settings Required Manually

In GitHub repository settings:

- Source: Deploy from a branch
- Branch: `gh-pages`
- Folder: `/root`

## Verification URLs

- `https://kingbasbosa-beep.github.io/mental-smile-platform/`
- `https://kingbasbosa-beep.github.io/mental-smile-platform/?v=latest`
- `https://kingbasbosa-beep.github.io/mental-smile-platform/landing-preview`

Expected result: all URLs show the existing Flutter landing/showcase page.

## Files Modified

- `.github/workflows/github-pages.yml`
- `docs/deployment/EXISTING_FLUTTER_LANDING_GITHUB_PAGES_DEPLOY_V1.md`
- `docs/operations/OPERATIONS_REGISTRY_V1.md`
- `docs/operations/OPERATIONS_INDEX_V1.md`

## What Was Not Changed

- Flutter UI was not changed.
- Landing content was not changed.
- App logic was not changed.
- Firebase was not changed.
- Firestore was not changed.
- Assets were not changed.
- Legacy `public-landing` was not imported.
- Docs, presentation, and website folders are not published.
- Firebase Hosting was not used.
- `actions/deploy-pages` was not used.

## Final Status

Landing created: NO

Existing landing used: YES

UI changed: NO

Runtime logic changed: NO

Firebase changed: NO

Workflow created/updated: YES

Result: EXISTING_FLUTTER_LANDING_GITHUB_PAGES_DEPLOY_V1_COMPLETED
