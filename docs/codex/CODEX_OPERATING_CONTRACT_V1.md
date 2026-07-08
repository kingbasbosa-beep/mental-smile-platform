# Codex Operating Contract V1

Operation: NEW_REPOSITORY_BIRTH_AND_ROLE_GOVERNANCE_V1

Codex must treat this repository as the clean current truth for Mental Smile Platform.

## Required Rules

- Do not import old repo directly.
- Do not copy legacy files unless a capsule/materialization step approves it.
- Treat capsules as source packages.
- Treat this repo as clean current truth.
- Keep app, landing, website, and presentation separate.
- Never confuse GitHub Pages with official production.
- Never confuse Firebase with GitHub Pages.
- Log every operation in operations registry/index.

## Materialization Rule

No capsule may be materialized silently.

Every materialization must define:

- source capsule
- target folder
- copied files
- excluded files
- runtime impact
- Firebase impact
- route impact
- asset impact
- verification status

## Runtime Rule

Runtime files may only enter `app/` through an approved materialization operation.

## Publishing Rule

GitHub Pages is temporary landing only.

Firebase is the future official production hosting surface.

## Documentation Rule

Governance files are active operating truth only when they are created or updated through a logged operation.
