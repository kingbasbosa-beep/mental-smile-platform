# GitHub Repository Role Inventory V1

Status: COMPLETED
Date: 2026-07-08
Repository: `kingbasbosa-beep/mental-smile-os`
Scope: Governance inventory only

## Executive Summary

This repository is currently a hybrid federation repository.

It contains:

- Flutter runtime source.
- Firebase configuration and rules.
- Temporary GitHub Pages deployment infrastructure.
- Disabled Firebase Hosting workflow stubs.
- Large governance documentation.
- Historical archives.
- Sovereign capsules and recovery vaults.
- Generated and local build/analyzer artifacts.

The repository is not only a development repository and not only a documentation repository. It is a mixed operating node that combines runtime, governance, archive, deployment, and recovery responsibilities.

## Inspection Boundaries

This operation did not modify runtime behavior.

No Flutter code, UI, Firebase config, Firestore rules, routes, assets, localization, branch, commit, push, deletion, or cleanup operation was performed.

## Repository Structure

| Root Component | Current Responsibility | Status |
|---|---|---|
| `.github/` | GitHub automation and deployment workflow definitions | ACTIVE_INFRASTRUCTURE |
| `.github/workflows/github-pages.yml` | Temporary GitHub Pages publishing workflow for Flutter Web | ACTIVE_TEMP_DEPLOYMENT |
| `.github/workflows/firebase-hosting-merge.yml` | Firebase Hosting workflow stub, disabled for temporary publishing | DISABLED_STUB |
| `.github/workflows/firebase-hosting-pull-request.yml` | Firebase Hosting PR preview workflow stub, disabled for temporary publishing | DISABLED_STUB |
| `lib/` | Active Flutter runtime source and feature modules | ACTIVE_RUNTIME |
| `assets/` | Runtime visual, content, presentation, guide, and library assets | ACTIVE_ASSET_STORE |
| `web/` | Flutter Web shell files such as `index.html` and web metadata | ACTIVE_WEB_SHELL |
| `android/` | Android platform project files | ACTIVE_PLATFORM_TARGET |
| `functions/` | Firebase Functions source area | PRESENT_BACKEND_AREA |
| `firebase.json` | Firebase project config, hosting target, rewrites, functions/firestore/storage config | ACTIVE_FIREBASE_CONFIG |
| `firestore.rules` | Firestore security rules | ACTIVE_SECURITY_RULES |
| `storage.rules` | Firebase Storage security rules | ACTIVE_SECURITY_RULES |
| `firestore.indexes.json` | Firestore index config | ACTIVE_FIREBASE_CONFIG |
| `pubspec.yaml` | Flutter/Dart dependency and asset manifest | ACTIVE_RUNTIME_MANIFEST |
| `test/` | Test files and generated/retained test surface | ACTIVE_TEST_ZONE |
| `docs/` | Governance, operations, history, archives, capsules, readiness, and reports | ACTIVE_GOVERNANCE_ARCHIVE |
| `docs/github-governance/` | GitHub repository responsibility inventory area | ACTIVE_GOVERNANCE |
| `docs/operations/github-pages/` | GitHub Pages publishing operation reports | ACTIVE_OPERATIONS |
| `docs/constitutional-baseline/` | Constitutional governance baseline, registries, inventories, operations | ACTIVE_SOURCE_OF_TRUTH |
| `docs/archive/` | Historical archive, legacy extraction, and frozen record areas | ACTIVE_ARCHIVE |
| `docs/capsules/` | Sovereign capsule builds and rebuild packages | ACTIVE_CAPSULE_ARCHIVE |
| `docs/emergency-recovery-vault/` | Recovery vault for Generation 1 system restoration | ACTIVE_RECOVERY_ARCHIVE |
| `backups/` | External memory and backup packages | BACKUP_ZONE |
| `mental-smile-os-workspace/` | Nested workspace/release/showcase/memory material | MIXED_WORKSPACE_ARCHIVE |
| `public-landing/` | Static legacy landing package retained in repository | LEGACY_STATIC_WEB |
| `build/` | Local generated build output | GENERATED_LOCAL_OUTPUT |
| `.dart_tool/` | Local Flutter/Dart tooling cache | GENERATED_LOCAL_TOOLING |
| `.firebase/` | Local Firebase tooling cache/state | GENERATED_LOCAL_TOOLING |
| `tools/` | Utility scripts/tools | SUPPORT_TOOLING |
| analyzer text files | Local analyzer snapshots and reports | LOCAL_DIAGNOSTIC_ARTIFACTS |

## Branch Inventory

The following branch inventory is based on local Git refs available at inspection time.

| Branch | Current Role | Current Usage | Relationship |
|---|---|---|---|
| `post-separation-pure-dna-v1` | Current working/development branch | Active runtime, governance, and temporary publishing setup | Same commit as `origin/post-separation-pure-dna-v1`; used by GitHub Pages workflow |
| `origin/post-separation-pure-dna-v1` | Remote copy of current working branch | Remote source for current temporary publishing workflow | Tracks current working branch state |
| `origin/main` | Remote default/main branch | Older public/docs publishing baseline | `origin/HEAD` points here; current working branch is separate |
| `origin/ai-lab` | Remote lab/review branch | Older audit/report branch | Former Firebase workflow branch target before temporary publishing reset |
| `origin/codex/*` branches | Remote Codex task branches | Historical focused implementation/test/UI branches | Task-specific branches, not current primary publishing source |
| `gh-pages` | GitHub Pages publish branch | Expected target for temporary public web deployment | Not listed in local refs during this audit, but workflow publishes to it |

## Branch Details

| Ref | Commit | Date | Subject |
|---|---|---|---|
| `post-separation-pure-dna-v1` | `7811591642cf5f8f772a2833f174da1174b9888c` | 2026-07-08 | `ci: force clean gh-pages deployment` |
| `origin/post-separation-pure-dna-v1` | `7811591642cf5f8f772a2833f174da1174b9888c` | 2026-07-08 | `ci: force clean gh-pages deployment` |
| `origin/main` | `b41ba29cc4a3e027c88ec8c2ffcf81112b5ec887` | 2026-06-15 | `docs: publish public web to GitHub Pages` |
| `origin/ai-lab` | `fdb889d22cc99dac03f98e139c0c40b445efb2ca` | 2026-06-15 | `docs: add GitHub public readiness and account audit reports` |

## GitHub Workflow Inventory

| Workflow | Trigger | Purpose | Output | Dependencies | Deployment Target | Category | Status |
|---|---|---|---|---|---|---|---|
| `github-pages.yml` | `workflow_dispatch`, push to `post-separation-pure-dna-v1` | Build Flutter Web and publish temporary public site | `build/web` published to `gh-pages` | `actions/checkout`, `subosito/flutter-action`, `peaceiris/actions-gh-pages` | GitHub Pages branch `gh-pages` root | Deployment | ACTIVE_TEMP_DEPLOYMENT |
| `firebase-hosting-merge.yml` | `workflow_dispatch`; job `if: false` | Historical Firebase Hosting live deploy workflow | None while disabled | Flutter, FirebaseExtended/action-hosting-deploy | Firebase Hosting project `mental-smile-platform` if re-enabled | Deployment | DISABLED_STUB |
| `firebase-hosting-pull-request.yml` | `workflow_dispatch`; job `if: false` | Historical Firebase Hosting preview workflow | None while disabled | Flutter, FirebaseExtended/action-hosting-deploy | Firebase Hosting preview if re-enabled | Deployment | DISABLED_STUB |

## GitHub Pages Inventory

| Item | Current Responsibility |
|---|---|
| Expected URL | `https://kingbasbosa-beep.github.io/mental-smile-os/` |
| Build branch | `post-separation-pure-dna-v1` |
| Build command | `flutter build web --release --base-href /mental-smile-os/` |
| Build output | `build/web` |
| Publish branch | `gh-pages` |
| Publish folder | `/root` |
| Publish workflow | `.github/workflows/github-pages.yml` |
| Publish action | `peaceiris/actions-gh-pages@v3` |
| Clean deploy controls | `force_orphan: true`, `keep_files: false`, `destination_dir: .` |
| Jekyll handling | `.nojekyll` added to `build/web` during workflow |
| Non-source publishing paths | `/docs` and `public-landing` are not intended current GitHub Pages sources |

## Documentation Inventory

| Documentation Area | Current Responsibility | Status |
|---|---|---|
| `docs/constitutional-baseline/` | Primary governance baseline, registries, inventories, operations, memory, topology | ACTIVE_SOURCE_OF_TRUTH |
| `docs/constitutional-baseline/operations/` | Executed operations registry/index and operation reports | ACTIVE_OPERATIONS_LEDGER |
| `docs/constitutional-baseline/registries/` | Route, asset, memory, prompt, signal, and ownership registries | ACTIVE_REGISTRIES |
| `docs/constitutional-baseline/inventory/` | Runtime/platform/feature/document inventory files | ACTIVE_INVENTORY |
| `docs/constitutional-baseline/guides/` | System guides and operating doctrine | ACTIVE_GUIDES |
| `docs/sections/` | Domain and feature reports/cards across library, application, governance, presentation, etc. | ACTIVE_SECTION_DOCS |
| `docs/archive/` | Historical and legacy documentation vaults | ACTIVE_ARCHIVE |
| `docs/capsules/` | Sovereign capsules for domains and rebuild packages | ACTIVE_CAPSULE_ARCHIVE |
| `docs/emergency-recovery-vault/` | Recovery vault for reconstructing Generation 1 | ACTIVE_RECOVERY_VAULT |
| `docs/runtime-*` | Runtime connection, purification, readiness reports | ACTIVE_RUNTIME_GOVERNANCE |
| `docs/platform-final-seal/` | Final seal and production connection certification records | ACTIVE_RELEASE_GOVERNANCE |
| `docs/generation-2/` | Generation 2 design/runtime documentation | ACTIVE_EVOLUTION_DOCS |
| `docs/github-governance/` | GitHub repository role and responsibility maps | ACTIVE_GITHUB_GOVERNANCE |
| `docs/operations/github-pages/` | GitHub Pages publishing reports | ACTIVE_DEPLOYMENT_OPERATIONS |
| `docs/audits/` | Audit reports | ACTIVE_AUDIT_RECORDS |
| `docs/system-health/` | Health reports | ACTIVE_HEALTH_RECORDS |
| `docs/strategic-room/` | Strategic phase reports | STRATEGIC_HISTORY |
| `docs/history/` | Historical records | HISTORY |

## Archive Inventory

| Archive Area | Responsibility | Status |
|---|---|---|
| `docs/archive/` | Main historical archive and legacy/frozen evidence | ACTIVE_ARCHIVE |
| `docs/archive/platform-extraction/` | Extraction history and platform separation records | HISTORICAL_PLATFORM_ARCHIVE |
| `docs/archive/legacy-cleanup/` | Legacy cleanup decisions and evidence | LEGACY_ARCHIVE |
| `docs/archive/web-runtime/` | Web runtime historical records | WEB_RUNTIME_ARCHIVE |
| `docs/capsules/` | Domain-level rebuild packages and frozen sovereign capsules | CAPSULE_ARCHIVE |
| `docs/emergency-recovery-vault/` | Emergency restoration source bundle | RECOVERY_ARCHIVE |
| `backups/` | External memory and backup packages | BACKUP_ARCHIVE |
| `mental-smile-os-workspace/` | Showcase, memory, release, package workspace | MIXED_ARCHIVE_WORKSPACE |
| `public-landing/` | Legacy static landing retained as old public web package | LEGACY_STATIC_ARCHIVE |

## Runtime Inventory

Runtime source currently lives mainly in:

- `lib/`
- `assets/`
- `web/`
- `android/`
- Firebase config files at repository root

Major Flutter runtime feature zones under `lib/features/` include:

- `commercial_v2_web`
- `presentation_gallery`
- `library`
- `generation2_mobile_*`
- `commercial`
- `accessibility`
- `client`
- `residential`
- `s_*` federation surfaces
- `workshop_foundation`
- governance/admin blocks
- monitoring/signals/trust modules

The current root route `/` maps to `CommercialV2WebShowcasePage` in `lib/app/router/app_router.dart`.

## Project History Inventory

Project history currently lives in several places:

- Git commit history and remote refs.
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md`.
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`.
- `docs/archive/`.
- `docs/capsules/`.
- `docs/emergency-recovery-vault/`.
- `backups/`.
- `mental-smile-os-workspace/`.

The strongest human-readable operation history is the Operations Registry and Operations Index.

## Source Of Truth

Current architectural truth is distributed, but the primary source of truth is:

- `docs/constitutional-baseline/`

The strongest operational truth files are:

- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`

Runtime truth lives in:

- `lib/`
- `assets/`
- `web/`
- root config files

Deployment truth for temporary web publishing lives in:

- `.github/workflows/github-pages.yml`
- `docs/operations/github-pages/`

## Repository Zones

| Zone | Components | Responsibility |
|---|---|---|
| Development Zone | `lib/`, `test/`, `android/`, `web/`, `pubspec.yaml` | Flutter app development and runtime validation |
| Assets Zone | `assets/` | Runtime images, backgrounds, content, presentations, guides |
| Firebase Zone | `firebase.json`, `firestore.rules`, `storage.rules`, `functions/` | Firebase deployment and security configuration |
| Deployment Zone | `.github/workflows/`, `build/web` output | Temporary GitHub Pages publishing and disabled Firebase workflows |
| Governance Zone | `docs/constitutional-baseline/`, `docs/github-governance/`, operations registries | Current governance and repository truth |
| Documentation Zone | `docs/sections/`, `docs/generation-2/`, `docs/runtime-*`, reports | Human-readable architecture, audit, and feature documentation |
| Archive Zone | `docs/archive/`, `docs/capsules/`, `docs/emergency-recovery-vault/`, `backups/` | Historical, frozen, and recovery records |
| Legacy Web Zone | `public-landing/` | Static legacy landing package, not current temporary publishing source |
| Workspace/Memory Zone | `mental-smile-os-workspace/` | Nested memory/showcase/build package workspace |
| Local Generated Zone | `.dart_tool/`, `.firebase/`, `build/`, analyzer text snapshots | Generated local state and diagnostics |

## Repository Responsibility Matrix

| Repository Component | Current Responsibility | Status |
|---|---|---|
| Flutter runtime | Active application implementation | ACTIVE |
| Commercial V2 Web landing | Current root landing surface | ACTIVE |
| GitHub Pages workflow | Temporary web publishing | ACTIVE_TEMP |
| Firebase config | Future/official production publishing and backend config | ACTIVE_CONFIG |
| Firebase Hosting workflows | Historical deploy automation retained but disabled | DISABLED |
| Governance docs | Architectural and operational source of truth | ACTIVE |
| Operations Registry/Index | Project execution history | ACTIVE |
| Capsules | Rebuild/freeze domain packages | ACTIVE_ARCHIVE |
| Emergency recovery vault | Disaster/recovery source package | ACTIVE_ARCHIVE |
| `public-landing` | Legacy static landing evidence/package | LEGACY |
| `docs/archive` | Historical archive | ACTIVE_ARCHIVE |
| `mental-smile-os-workspace` | Nested showcase/memory workspace | MIXED_ARCHIVE |
| Tests | Validation surface and generated/retained test content | ACTIVE_TEST |
| Analyzer logs | Local diagnostics | LOCAL_ARTIFACT |

## Repository Identity

This repository is a hybrid federation repository.

Why:

- It contains active Flutter runtime code.
- It contains deployment automation.
- It contains Firebase configuration.
- It contains the official governance system.
- It contains historical archives and frozen capsules.
- It contains recovery vaults.
- It contains legacy static web material.
- It contains local/generated diagnostics and build artifacts.

It functions simultaneously as:

- Development repository.
- Governance repository.
- Documentation repository.
- Archive repository.
- Temporary deployment repository.
- Federation node for Mental Smile OS.

## Mixed Responsibilities Detected

Inventory only. No fix was performed.

| Mixed Area | Overlap Detected | Current Risk |
|---|---|---|
| Runtime + governance | `lib/` active runtime coexists with thousands of governance docs | Repository navigation and ownership can be confusing |
| Deployment + legacy | GitHub Pages publishes current build while `public-landing` remains in repo | Old static site can be mistaken for current web source |
| Firebase + GitHub Pages | Firebase config and disabled workflows coexist with active GitHub Pages workflow | Deployment source confusion |
| Docs + archive | Active docs, historical docs, capsules, and recovery vaults coexist under `docs/` | Source-of-truth discovery requires registry discipline |
| Runtime + archive in `lib/features` | Some legacy feature directories remain alongside active modules | Active/legacy boundary must be read through router/governance |
| Local generated files + source | `build/`, `.dart_tool/`, analyzer snapshots are present | Generated/local artifacts can blur repository state |
| Nested workspace | `mental-smile-os-workspace/` duplicates memory/showcase responsibilities | Secondary source-of-truth ambiguity |
| Test zone volume | `test/` contains many files relative to runtime count | Validation zone may include generated or historical material |

## Inspected Branches

- `post-separation-pure-dna-v1`
- `origin/post-separation-pure-dna-v1`
- `origin/main`
- `origin/ai-lab`
- `origin/codex/add-verification-for-accountingworkspacepage-rendering`
- `origin/codex/align-accounting-ui-labels`
- `origin/codex/apply-payment-authority-delegation-to-main`
- `origin/codex/create-accounting-workspace-shell`
- `origin/codex/rebuild-accounting-workspace-layout`
- `origin/codex/remove-financial-action-buttons-from-control-room`
- `origin/codex/replace-raw-status-values-with-labels`
- `origin/codex/restyle-accounting-workspace-ui`

## Inspected Workflows

- `.github/workflows/github-pages.yml`
- `.github/workflows/firebase-hosting-merge.yml`
- `.github/workflows/firebase-hosting-pull-request.yml`

## Inspected Documentation Areas

- `docs/accessibility`
- `docs/archive`
- `docs/audits`
- `docs/auth`
- `docs/capsules`
- `docs/commercial`
- `docs/commercial-v2`
- `docs/commercial-v2-web`
- `docs/constitutional-baseline`
- `docs/emergency-recovery-vault`
- `docs/firebase-purification`
- `docs/generation-2`
- `docs/history`
- `docs/operations`
- `docs/ownership`
- `docs/platform-final-seal`
- `docs/runtime-connection`
- `docs/runtime-purification`
- `docs/runtime-readiness`
- `docs/sections`
- `docs/strategic-room`
- `docs/system-health`
- `docs/github-governance`

## Inspected Deployment Surfaces

- GitHub Pages workflow and `gh-pages` target.
- Firebase Hosting config in `firebase.json`.
- Disabled Firebase Hosting workflows.
- `public-landing` legacy static package.
- `web/` Flutter web shell.
- `build/web` local generated web output area.

## Total Governance Summary

The repository is currently the primary Mental Smile OS mixed-governance repository.

The current temporary web publishing responsibility belongs to GitHub Pages through `gh-pages`.

The current official production publishing responsibility is retained for Firebase later, but Firebase workflows are not active temporary publishing paths.

The current runtime responsibility belongs to Flutter source under `lib/`, assets under `assets/`, and web shell under `web/`.

The current architectural truth responsibility belongs to `docs/constitutional-baseline/`, especially operations, registries, and inventories.

The current historical truth responsibility is distributed across Git history, Operations Registry/Index, archive docs, capsules, recovery vault, backups, and nested workspace material.

## Final Verdict

GITHUB_REPOSITORY_ROLE_INVENTORY_V1_COMPLETED
