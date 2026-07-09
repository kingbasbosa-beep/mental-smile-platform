# Operations Registry V1

This registry records governance operations executed in the clean Mental Smile Platform repository.

## OP-NEW-REPOSITORY-BIRTH-AND-ROLE-GOVERNANCE-V1

Date: 2026-07-08

Operation Title: New Repository Birth And Role Governance V1

Scope: Create repository identity, role structure, folder governance, Codex operating rules, GitHub role constitution, Firebase role constitution, publishing surface map, capsule materialization policy, and clean repository operations registry/index.

Created Folders:

- `app/`
- `presentation/`
- `landing/`
- `website/`
- `docs/`
- `docs/repository/`
- `docs/github/`
- `docs/firebase/`
- `docs/codex/`
- `docs/capsules/`
- `docs/materialization/`
- `docs/deployment/`
- `docs/operations/`
- `.github/`
- `.github/workflows/`

Created Files:

- `README.md`
- `docs/repository/REPOSITORY_IDENTITY_V1.md`
- `docs/repository/REPOSITORY_STRUCTURE_MAP_V1.md`
- `docs/codex/CODEX_OPERATING_CONTRACT_V1.md`
- `docs/github/GITHUB_ROLE_CONSTITUTION_V1.md`
- `docs/firebase/FIREBASE_ROLE_CONSTITUTION_V1.md`
- `docs/deployment/PUBLISHING_SURFACE_MAP_V1.md`
- `docs/capsules/CAPSULE_MATERIALIZATION_POLICY_V1.md`
- `docs/operations/OPERATIONS_INDEX_V1.md`
- `docs/operations/OPERATIONS_REGISTRY_V1.md`

Runtime imported: NO

Capsules materialized: NO

Firebase connected: NO

GitHub Pages workflow created: NO

Flutter app created: NO

Deployment workflow created: NO

Legacy history imported: NO

Result: NEW_REPOSITORY_BIRTH_AND_ROLE_GOVERNANCE_V1_COMPLETED

## OP-EXISTING-FLUTTER-LANDING-GITHUB-PAGES-DEPLOY-V1

Date: 2026-07-08

Operation Title: Existing Flutter Landing GitHub Pages Deploy V1

Scope: Configure the existing GitHub Pages workflow to publish the existing Flutter landing/showcase page from `build/web` to the `gh-pages` branch for temporary testing access.

Landing Source:

- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`

Routes:

- `/`
- `/landing-preview`

Workflow:

- `.github/workflows/github-pages.yml`

Build Command:

```bash
flutter build web --release --base-href /mental-smile-platform/
```

Publish Source:

- `build/web`

Publish Target:

- branch: `gh-pages`
- folder: `/root`

Clean Publish:

- orphan publish enabled
- old files not retained
- docs not published
- public-landing not published
- presentation not published
- website not published

Manual GitHub Pages Settings Required:

- Source: Deploy from a branch
- Branch: `gh-pages`
- Folder: `/root`

Verification URLs:

- `https://kingbasbosa-beep.github.io/mental-smile-platform/`
- `https://kingbasbosa-beep.github.io/mental-smile-platform/?v=latest`
- `https://kingbasbosa-beep.github.io/mental-smile-platform/landing-preview`

Landing created: NO

Existing landing used: YES

UI changed: NO

Runtime logic changed: NO

Firebase changed: NO

Firestore changed: NO

Assets changed: NO

Workflow created/updated: YES

Result: EXISTING_FLUTTER_LANDING_GITHUB_PAGES_DEPLOY_V1_COMPLETED
