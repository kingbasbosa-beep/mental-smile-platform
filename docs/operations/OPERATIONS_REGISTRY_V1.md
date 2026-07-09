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

## OP-CLEAN-REPOSITORY-WORKTREE-BIRTH-V1

Date: 2026-07-08

Operation Title: Clean Repository Worktree Birth V1

Scope: Create a separate clean local working tree for the new Mental Smile Platform repository without pushing, copying legacy history, importing runtime, materializing capsules, or connecting Firebase.

Old Repo Path:

- `C:\mental_smile_workspace\app\mental-smile-platform`

Clean Repo Path:

- `C:\mental_smile_workspace\repositories\mental-smile-platform-clean`

Remote URL:

- `https://github.com/kingbasbosa-beep/mental-smile-platform.git`

Branch:

- `post-separation-pure-dna-v1`

Runtime imported: NO

Capsules imported: NO

Landing imported: NO

Firebase connected: NO

Workflow created: NO

Push executed: NO

Commit executed: NO

Result: CLEAN_REPOSITORY_WORKTREE_BIRTH_V1_COMPLETED


## OP-LANDING-CAPSULE-MATERIALIZATION-V1

Date: 2026-07-09

Operation Title: Landing Capsule Materialization V1

Scope: Materialize only the existing Flutter landing runtime from the historical repository into the clean repository.

Source:

- `C:\mental_smile_workspace\app\mental-smile-platform`
- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`

Target:

- `C:\mental_smile_workspace\repositories\mental-smile-platform-clean`

Routes:

- `/`
- `/landing-preview`

Runtime partially materialized: YES

Landing imported: YES

Other modules imported: NO

Firebase imported: NO

Workflow created: NO

GitHub Pages published: NO

Build ready: PENDING OWNER-RUN BUILD

Report:

- `docs/materialization/LANDING_CAPSULE_MATERIALIZATION_V1.md`

Result: LANDING_CAPSULE_MATERIALIZATION_V1_COMPLETED

## OP-LANDING-BUILD-VERIFY-AND-GITHUB-PAGES-DEPLOY-V1

Date: 2026-07-09

Operation Title: Landing Build Verify And GitHub Pages Deploy V1

Scope: Verify the clean landing Flutter Web build and create the GitHub Pages workflow to publish `build/web` to `gh-pages`.

Repository:

- `C:\mental_smile_workspace\repositories\mental-smile-platform-clean`

Branch:

- `post-separation-pure-dna-v1`

Remote:

- `https://github.com/kingbasbosa-beep/mental-smile-platform.git`

Build Command:

```powershell
flutter build web --release --base-href /mental-smile-platform/
```

Build status: PASSED

Workflow:

- `.github/workflows/github-pages.yml`

Workflow created: YES

Firebase changed: NO

Firestore changed: NO

Historical repository touched: NO

Commit required: YES

Push required: YES

GitHub Pages Manual Settings:

- Source: Deploy from a branch
- Branch: `gh-pages`
- Folder: `/root`

Final URL:

- `https://kingbasbosa-beep.github.io/mental-smile-platform/`

Report:

- `docs/deployment/LANDING_BUILD_VERIFY_AND_GITHUB_PAGES_DEPLOY_V1.md`

Result: LANDING_BUILD_VERIFY_AND_GITHUB_PAGES_DEPLOY_V1_COMPLETED
