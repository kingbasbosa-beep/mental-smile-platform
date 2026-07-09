# GitHub Pages Temp Hosting Guide V1

Status: GUIDE_ONLY
Date: 2026-07-08
Scope: Temporary GitHub Pages hosting guide for Flutter Web

## Purpose

This guide documents how to publish the existing Flutter Web output to GitHub Pages as a temporary hosting path.

Repository name assumed:

- `mental-smile-platform`

GitHub Pages base href:

- `/mental-smile-platform/`

## Boundaries

- No UI changes.
- No Firebase changes.
- No route changes.
- No deploy performed.
- No commands were run by Codex.

## Build Command

Run this manually from the project root:

```powershell
flutter build web --release --base-href /mental-smile-platform/
```

Expected output:

- `build/web`

## GitHub Pages Deployment Options

### Option 1: Deploy From `gh-pages` Branch

1. Build Flutter Web using the command above.
2. Create or update a `gh-pages` branch.
3. Copy the contents of `build/web` into the root of the `gh-pages` branch.
4. Push the `gh-pages` branch.
5. In GitHub:
   - Open repository settings.
   - Go to Pages.
   - Select deploy from branch.
   - Choose `gh-pages`.
   - Choose `/root`.

Expected temporary URL:

- `https://<github-username>.github.io/mental-smile-platform/`

### Option 2: Deploy From `/docs` Folder

Only use this if the repository policy allows generated web output under `/docs`.

1. Build Flutter Web using the command above.
2. Copy the contents of `build/web` into a root-level `docs/` publishing folder.
3. In GitHub Pages settings:
   - Select deploy from branch.
   - Choose the working branch.
   - Choose `/docs`.

This option can conflict with the existing governance documentation folder, so `gh-pages` is safer for this repository.

## SPA Routing Note

Flutter Web with hash routing can work on GitHub Pages when the app URLs use `/#/route`.

Root expected temporary URL:

- `https://<github-username>.github.io/mental-smile-platform/`

Landing route after the recent home migration:

- `https://<github-username>.github.io/mental-smile-platform/`

Temporary landing preview route:

- `https://<github-username>.github.io/mental-smile-platform/#/landing-preview`

## Manual Verification Checklist

- Open the GitHub Pages root URL.
- Confirm the current landing page loads directly.
- Confirm `/mental-smile-platform/#/landing-preview` still loads the landing preview.
- Confirm landing controls still navigate as expected:
  - Mobile version.
  - Desktop version.
  - Presentation gallery.
  - Official links page.

## Files Changed

- `docs/constitutional-baseline/operations/GITHUB_PAGES_TEMP_HOSTING_GUIDE_V1.md`

## Final Verdict

GITHUB_PAGES_TEMP_HOSTING_GUIDE_READY
