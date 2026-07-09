# GitHub AI Interpretation Rules V1

Status: ACTIVE_GOVERNANCE_FOUNDATION
Date: 2026-07-08
Scope: Codex/AI interpretation rules for GitHub repository context

## Mandatory Rules

Codex and future AI agents must not infer product philosophy from legacy GitHub Pages output.

Codex and future AI agents must not infer current product identity from `public-landing`.

Codex and future AI agents must not treat `gh-pages` as source code.

Codex and future AI agents must not treat history as runtime.

Codex and future AI agents must not treat Firebase workflow stubs as active production unless explicitly enabled by owner/governance.

Codex and future AI agents must not treat old archive/capsule files as current runtime truth without checking active registries and active runtime files.

## Current Source Of Truth

Current architectural truth:

- `docs/constitutional-baseline/`
- active `docs/sections/`
- current operations registry and index

Current runtime truth:

- `lib/`
- `assets/`
- `web/`
- active root config files

Current temporary deployment truth:

- `.github/workflows/github-pages.yml`
- `docs/operations/github-pages/`
- `gh-pages` as generated output only

Current history truth:

- Git history
- `docs/archive/`
- `docs/capsules/`
- `docs/emergency-recovery-vault/`
- `backups/`
- operation registries

## Legacy Interpretation Rules

If a file lives in `public-landing`, interpret it as legacy/static web material unless a current governance decision says otherwise.

If a file lives in `docs/archive`, interpret it as historical evidence.

If a file lives in `docs/capsules`, interpret it as a frozen/rebuild package, not live runtime.

If a file lives in `docs/emergency-recovery-vault`, interpret it as recovery material.

If a public website shows a stale page, treat that as a publishing source problem first, not proof of current UI/runtime.

## Deployment Interpretation Rules

GitHub Pages is temporary public publishing.

Firebase is official production publishing later, unless owner explicitly activates it earlier.

`gh-pages` must contain generated build output only.

`actions/deploy-pages` is not the current temporary publishing model.

Firebase workflow stubs are disabled and must not be described as live deploy automation.

## Runtime Interpretation Rules

Before describing a screen as active, verify:

- route mapping,
- active imports,
- active widget construction,
- current branch context,
- governance state.

Before modifying anything, classify the file as:

- runtime,
- governance,
- archive,
- deployment,
- generated output,
- legacy,
- config.

## Final Verdict

GITHUB_AI_INTERPRETATION_RULES_V1_ACTIVE
