# GitHub Pages Temp Landing Doctrine V1

Status: ACTIVE_GOVERNANCE_DOCTRINE
Date: 2026-07-08
Scope: Temporary GitHub Pages public landing doctrine

## GitHub Pages Role

GitHub Pages is a temporary landing and preview surface for Mental Smile OS.

Its current responsibility is to show the current Flutter landing/showcase generated from the active development branch:

- `post-separation-pure-dna-v1`

It must publish only generated Flutter Web output:

- `build/web`

through:

- `gh-pages`
- `/root`

## Why GitHub Pages Is Temporary

GitHub Pages is used to unblock temporary public review while the official production hosting path is still being finalized.

It is not the permanent production identity of Mental Smile.
It is not the final official public hosting authority.
It is not the long-term documentation source.
It is not the archive host.

## Why Firebase Is Official Later

Firebase remains the intended official production publishing surface later because it owns the project hosting configuration, Firebase integration, and production deployment path.

GitHub Pages does not replace Firebase.
GitHub Pages only carries temporary landing/preview responsibility.

## Why `public-landing` Is Legacy

`public-landing/` is historical static web material.

It must not be revived as the GitHub Pages source.
It must not define the current product identity.
It must not replace the current Flutter landing/showcase.
It may remain as legacy/static historical material until a later explicit archive/cleanup operation.

## Why `docs` Must Never Be GitHub Pages Source

`docs/` is governance, history, archive, operations, and documentation material.

It must not be used as the GitHub Pages publishing source because that would mix:

- governance,
- archive,
- history,
- reports,
- current public landing,
- temporary deployment.

GitHub Pages must publish generated runtime output only, not governance documentation.

## Why `gh-pages` Contains Generated Output Only

`gh-pages` is a deployment branch, not a source branch.

Allowed:

- generated `build/web` files,
- `.nojekyll`.

Forbidden:

- source code,
- `docs`,
- `public-landing`,
- archives,
- reports,
- README philosophy,
- legacy static pages.

## Cache Validation Rule

After deployment, validate through a cache-busting URL and a private/incognito browser window:

- `https://kingbasbosa-beep.github.io/mental-smile-os/?v=latest`

If a stale page appears, treat it first as:

- browser cache,
- GitHub Pages source setting mismatch,
- stale `gh-pages` output,
- workflow/publish branch mismatch.

Do not treat stale GitHub Pages output as proof of current Flutter UI state.

## Final Verdict

GITHUB_PAGES_TEMP_LANDING_DOCTRINE_V1_ACTIVE
