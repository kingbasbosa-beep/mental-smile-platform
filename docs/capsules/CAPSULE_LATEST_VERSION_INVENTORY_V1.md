# Capsule Latest Version Inventory V1

Status: COMPLETED
Date: 2026-07-08
Scope: Capsule inventory only

## Executive Summary

Total capsule/recovery/template families found: 14.

Latest complete certified capsule or recovery packages: 13.

Partial/deprecated/superseded/non-materialization families: 1.

No older V0/V2 superseding chain was found for the certified sovereign capsule families. The latest approved capsule version across certified families is V1 / 1.0.0.

The certified set consists of:

- 12 latest certified sovereign capsule families.
- 1 certified Emergency Recovery Vault package.
- 1 active master template that defines capsule structure but is not itself a materialization capsule.

## Capsule Master Table

| Capsule Family | Latest Version | Status | Location | Contains | Eligible For New Repo |
|---|---|---|---|---|---|
| Core Doctrine | `MENTAL_SMILE_SOVEREIGN_DOCTRINE_CAPSULE_V1` | COMPLETE / CERTIFIED | `docs/capsules/core-doctrine/MENTAL_SMILE_SOVEREIGN_DOCTRINE_CAPSULE_V1/` | doctrine, identity, manifest, prompts, recovery, validation, owner decisions, certificate | YES |
| Archive | `ARCHIVE_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED / REBUILD_READY | `docs/capsules/archive/builds/ARCHIVE_SOVEREIGN_CAPSULE_V1/` | archive docs, technical/source snapshots, routes, signals, Firebase excerpts, active documents, recovery, certificate | YES |
| Signals & Magnets | `SIGNALS_MAGNETS_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED / REBUILD_READY | `docs/capsules/signals-magnets/builds/SIGNALS_MAGNETS_SOVEREIGN_CAPSULE_V1/` | signal philosophy, signal runtime, magnets, destination resolution, archive destinations, recovery, certificate | YES |
| Federation | `FEDERATION_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED / REBUILD_READY | `docs/capsules/federation/builds/FEDERATION_SOVEREIGN_CAPSULE_V1/` | federation doctrine, districts/zones, ownership, relationships, registries, active documents, runtime snapshots, certificate | YES |
| Residential | `RESIDENTIAL_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED / REBUILD_READY | `docs/capsules/residential/builds/RESIDENTIAL_SOVEREIGN_CAPSULE_V1/` | residential runtime/source/UI/routes/signals/Firebase/YAML/assets/docs/recovery/certificate | YES |
| Library | `LIBRARY_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED / REBUILD_READY | `docs/capsules/library/builds/LIBRARY_SOVEREIGN_CAPSULE_V1/` | library runtime/source/UI/routes/signals/Firebase/YAML/assets/provider display/recovery/certificate | YES |
| Commercial V2 | `COMMERCIAL_V2_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED | `docs/capsules/commercial-v2/builds/COMMERCIAL_V2_SOVEREIGN_CAPSULE_V1/` | commercial V2 source/UI/routes/signals/Firebase/YAML/assets/docs/runtime connection/recovery/certificate | YES |
| Administrative | `ADMINISTRATIVE_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED | `docs/capsules/administrative/builds/ADMINISTRATIVE_SOVEREIGN_CAPSULE_V1/` | administrative runtime snapshots, owner/admin docs, routes, Firebase excerpts, recovery, certificate | YES |
| Monitoring | `MONITORING_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED | `docs/capsules/monitoring/builds/MONITORING_SOVEREIGN_CAPSULE_V1/` | monitoring runtime/readiness, signals, docs, Firebase excerpts, recovery, certificate | YES |
| Owner | `OWNER_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED | `docs/capsules/owner/builds/OWNER_SOVEREIGN_CAPSULE_V1/` | owner surfaces, administrative/monitoring runtime docs, routes, signals, active documents, recovery, certificate | YES |
| Knowledge Engine | `KNOWLEDGE_ENGINE_SOVEREIGN_CAPSULE_V1` | COMPLETE / CERTIFIED / REBUILD_READY | `docs/capsules/knowledge-engine/builds/KNOWLEDGE_ENGINE_SOVEREIGN_CAPSULE_V1/` | knowledge/intelligence/decision docs, technical snapshots, governance docs, recovery, certificate | YES |
| Master Generation 1 | `MASTER_GENERATION_1_SOVEREIGN_CAPSULE` | COMPLETE / CERTIFIED / FULLY_REBUILDABLE | `docs/capsules/generation-1/builds/MASTER_GENERATION_1_SOVEREIGN_CAPSULE/` | all capsule registry, dependency graph, recovery order, active docs, digital twins, registry snapshots, certificate | YES |
| Generation 1 Emergency Recovery Vault | `GENERATION_1_EMERGENCY_RECOVERY_VAULT` | COMPLETE / CERTIFIED / PERMANENTLY_PRESERVED | `docs/emergency-recovery-vault/GENERATION_1_EMERGENCY_RECOVERY_VAULT/` | recovery order, manifests, critical runtime registries, integrity, certificates, repository/tree snapshots | YES |
| Master Sovereign Capsule Template | `MASTER_SOVEREIGN_CAPSULE_TEMPLATE_V1` | ACTIVE_TEMPLATE / NOT_A_MATERIALIZATION_CAPSULE | `docs/capsules/template/MASTER_SOVEREIGN_CAPSULE_TEMPLATE_V1.md` | canonical capsule folder structure, required docs, governance rules | NO |

## Detailed Capsule Inventory

### Core Doctrine

- Latest version: `MENTAL_SMILE_SOVEREIGN_DOCTRINE_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED
- Location: `docs/capsules/core-doctrine/MENTAL_SMILE_SOVEREIGN_DOCTRINE_CAPSULE_V1/`
- Purpose: Certify the Mental Smile Generation 1 sovereign doctrine and constitutional identity.
- Contents: identity, dependency graph, evolution policy, manifest, constructive prompt, recovery, owner notes, owner decisions, doctrine, constitutional eras, philosophy transition, mistakes/discoveries, rejected philosophies, future vision, validation, certificate.
- Key files:
  - `01_MANIFEST/MENTAL_SMILE_SOVEREIGN_DOCTRINE_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/CORE_DOCTRINE_CAPSULE_VALIDATION_REPORT_V1.md`
  - `15_DOCTRINE/MENTAL_SMILE_GENERATION_1_SOVEREIGN_DOCTRINE_V1.md`
  - `99_CERTIFICATE/MENTAL_SMILE_SOVEREIGN_DOCTRINE_CAPSULE_V1_CERTIFICATE.md`
- Dependencies: none.
- Related governance docs: master capsule template, Generation 1 master capsule, emergency recovery vault integrity manifest.
- Eligible for clean repo materialization: YES
- Notes: Certified direct capsule rather than under a `builds/` wrapper. No separate zip observed in the inspected output, but the certificate marks it certified.

### Archive

- Latest version: `ARCHIVE_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED / REBUILD_READY
- Location: `docs/capsules/archive/builds/ARCHIVE_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve archive doctrine, active archive records, historical topology, archive runtime connection, and recovery instructions.
- Contents: readme, manifest, constructive prompt, technical source, UI/route/signal/Firebase/YAML snapshots, cards/guides/prompts, archive digital twin, runtime connection, recovery, validation, owner decisions, certificate, zip.
- Key files:
  - `01_MANIFEST/ARCHIVE_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/ARCHIVE_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/ARCHIVE_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../ARCHIVE_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine.
- Related governance docs: `docs/archive/`, archive active documents, archive topology, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certificate states `ARCHIVE_CAPSULE_REBUILD_READY`.

### Signals & Magnets

- Latest version: `SIGNALS_MAGNETS_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED / REBUILD_READY
- Location: `docs/capsules/signals-magnets/builds/SIGNALS_MAGNETS_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve signal philosophy, magnet routing, destination resolution, archive destination, and signal runtime rebuild material.
- Contents: signal registry, signal runtime, emitters/builders/writers, magnet philosophy/registry, runtime electricity, active documents, archive relationships, recovery, validation, certificate, zip.
- Key files:
  - `01_MANIFEST/SIGNALS_MAGNETS_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/SIGNALS_MAGNETS_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/SIGNALS_MAGNETS_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../SIGNALS_MAGNETS_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine; Archive.
- Related governance docs: signal/magnet registries, archive destination patches, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certificate states `SIGNALS_RUNTIME_REBUILD_READY`.

### Federation

- Latest version: `FEDERATION_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED / REBUILD_READY
- Location: `docs/capsules/federation/builds/FEDERATION_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve federation architecture, ownership, districts/zones, expansion model, routes, active docs, and relationships.
- Contents: federation philosophy, districts, sections, zones, ownership, relationships, expansion/white-label/tenant model, registries, active documents, signals/magnets, archive relationships, recovery, validation, certificate, zip.
- Key files:
  - `01_MANIFEST/FEDERATION_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/FEDERATION_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/FEDERATION_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../FEDERATION_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine; Archive; Signals & Magnets.
- Related governance docs: federation active documents, constitutional topology, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certificate states `FEDERATION_REBUILD_READY`.

### Residential

- Latest version: `RESIDENTIAL_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED / REBUILD_READY
- Location: `docs/capsules/residential/builds/RESIDENTIAL_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve Residential domain source, UI, routes, signals, Firebase/YAML/assets/l10n snapshots, governance, and recovery instructions.
- Contents: technical source, UI source, route snapshot, signal runtime, Firebase/Firestore rule snapshot, YAML/assets/l10n snapshot, cards/guides/prompts, archive digital twin, runtime connection, recovery, certificate, zip.
- Key files:
  - `01_MANIFEST/RESIDENTIAL_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/RESIDENTIAL_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/RESIDENTIAL_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../RESIDENTIAL_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine; Archive; Signals & Magnets; Federation.
- Related governance docs: Residential active documents, Residential pure-DNA gates, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certificate states `RESIDENTIAL_CAPSULE_REBUILD_READY`.

### Library

- Latest version: `LIBRARY_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED / REBUILD_READY
- Location: `docs/capsules/library/builds/LIBRARY_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve Library domain runtime/source/UI/routes/signals/provider display and recovery material.
- Contents: index snapshots, active documents registry, technical source, provider display snapshot, UI source, route snapshot, signal runtime, Firebase/Firestore rule snapshot, YAML/assets/l10n snapshot, cards/guides/prompts, archive digital twin, runtime connection, recovery, certificate, zip.
- Key files:
  - `01_MANIFEST/LIBRARY_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/LIBRARY_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/LIBRARY_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../LIBRARY_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine; Archive; Signals & Magnets; Federation; Residential.
- Related governance docs: Library active documents, provider display runtime certificate, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certificate states `LIBRARY_CAPSULE_REBUILD_READY`.

### Commercial V2

- Latest version: `COMMERCIAL_V2_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED
- Location: `docs/capsules/commercial-v2/builds/COMMERCIAL_V2_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve Commercial V2 source, showcase, signal/Firebase/YAML snapshots, runtime connection, and recovery material.
- Contents: index snapshots, active documents, technical source, UI, routes, signal runtime, Firebase/Firestore, YAML/assets/l10n, cards/guides/prompts, archive digital twin, runtime connection, recovery, validation, certificate, zip.
- Key files:
  - `01_MANIFEST/COMMERCIAL_V2_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/COMMERCIAL_V2_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/COMMERCIAL_V2_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../COMMERCIAL_V2_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine; Archive; Signals & Magnets; Federation; Library.
- Related governance docs: Commercial V2 active documents, runtime connection certificates, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certificate is certified; operation registry pairs it with Owner as `OWNER_COMMERCIAL_REBUILD_READY`.

### Administrative

- Latest version: `ADMINISTRATIVE_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED
- Location: `docs/capsules/administrative/builds/ADMINISTRATIVE_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve administrative operations/governance runtime snapshots and recovery material.
- Contents: index snapshots, active documents, technical source, UI, routes, signals, Firebase/YAML snapshots, administrative docs, runtime readiness, recovery, validation, certificate, zip.
- Key files:
  - `01_MANIFEST/ADMINISTRATIVE_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/ADMINISTRATIVE_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/ADMINISTRATIVE_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../ADMINISTRATIVE_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine; Archive; Federation; Owner.
- Related governance docs: administrative active docs, owner-monitoring runtime readiness, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certified with no runtime contamination.

### Monitoring

- Latest version: `MONITORING_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED
- Location: `docs/capsules/monitoring/builds/MONITORING_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve monitoring domain runtime readiness, signals, governance docs, recovery, and validation material.
- Contents: index snapshots, active docs, technical source, UI, routes, signals, Firebase/YAML snapshots, monitoring docs, owner-monitoring runtime readiness, recovery, validation, certificate, zip.
- Key files:
  - `01_MANIFEST/MONITORING_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/MONITORING_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/MONITORING_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../MONITORING_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine; Archive; Signals & Magnets; Administrative.
- Related governance docs: monitoring active documents, owner-monitoring runtime readiness, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certified with no runtime contamination.

### Owner

- Latest version: `OWNER_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED
- Location: `docs/capsules/owner/builds/OWNER_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve owner surfaces, owner governance, runtime readiness, archive digital twin, and recovery material.
- Contents: index snapshots, active documents, technical source, UI, routes, signals, Firebase/YAML snapshots, owner docs, runtime readiness, recovery, validation, certificate, zip.
- Key files:
  - `01_MANIFEST/OWNER_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/OWNER_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/OWNER_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../OWNER_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine; Archive; Federation; Administrative; Monitoring.
- Related governance docs: Owner active documents, owner-monitoring readiness, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certified with no runtime contamination.

### Knowledge Engine

- Latest version: `KNOWLEDGE_ENGINE_SOVEREIGN_CAPSULE_V1`
- Status: COMPLETE / CERTIFIED / REBUILD_READY
- Location: `docs/capsules/knowledge-engine/builds/KNOWLEDGE_ENGINE_SOVEREIGN_CAPSULE_V1/`
- Purpose: Preserve knowledge/intelligence/decision/orchestration governance and technical rebuild material.
- Contents: knowledge index snapshots, active documents, technical source, UI/route/signal/Firebase/YAML snapshots, philosophy docs, decision intelligence, intelligence engine/orchestration, recovery, validation, certificate, zip.
- Key files:
  - `01_MANIFEST/KNOWLEDGE_ENGINE_SOVEREIGN_CAPSULE_V1_MANIFEST.md`
  - `13_VALIDATION/KNOWLEDGE_ENGINE_CAPSULE_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/KNOWLEDGE_ENGINE_SOVEREIGN_CAPSULE_V1_CERTIFICATE.md`
  - `../KNOWLEDGE_ENGINE_SOVEREIGN_CAPSULE_V1.zip`
- Dependencies: Core Doctrine; Archive; Federation.
- Related governance docs: Knowledge Engine active documents, decision intelligence and AI constitution docs, Generation 1 master capsule.
- Eligible for clean repo materialization: YES
- Notes: Certificate states `KNOWLEDGE_ENGINE_REBUILD_READY`.

### Master Generation 1

- Latest version: `MASTER_GENERATION_1_SOVEREIGN_CAPSULE`
- Status: COMPLETE / CERTIFIED / FULLY_REBUILDABLE
- Location: `docs/capsules/generation-1/builds/MASTER_GENERATION_1_SOVEREIGN_CAPSULE/`
- Purpose: Provide the master capsule registry, dependency graph, reading/build/recovery order, and generation-level rebuild package.
- Contents: generation identity/timeline, all capsule registry, certificate registry, dependency graph, reading/build/recovery order, active docs, digital twins, registry snapshots, guide/prompt/signal/route/Firestore/YAML/asset/localization/archive snapshots, recovery manual, presentation manifest, certificate, zip.
- Key files:
  - `01_MANIFEST/MASTER_GENERATION_1_SOVEREIGN_CAPSULE_MANIFEST.md`
  - `13_VALIDATION/MASTER_GENERATION_1_VALIDATION_REPORT_V1.md`
  - `99_CERTIFICATE/MASTER_GENERATION_1_SOVEREIGN_CAPSULE_CERTIFICATE.md`
  - `../MASTER_GENERATION_1_SOVEREIGN_CAPSULE.zip`
- Dependencies: all Generation 1 capsules.
- Related governance docs: Generation 1 certificate registry snapshots, emergency recovery vault, all section capsule certificates.
- Eligible for clean repo materialization: YES
- Notes: Highest-level certified capsule; certificate states `GENERATION_1_FULLY_REBUILDABLE`.

### Generation 1 Emergency Recovery Vault

- Latest version: `GENERATION_1_EMERGENCY_RECOVERY_VAULT`
- Status: COMPLETE / CERTIFIED / PERMANENTLY_PRESERVED
- Location: `docs/emergency-recovery-vault/GENERATION_1_EMERGENCY_RECOVERY_VAULT/`
- Purpose: Preserve catastrophic recovery material for Generation 1, including indexed capsules, active documents, digital twins, registries, manifests, integrity records, and recovery order.
- Contents: generation identity, repository/folder tree, capsule registry, active documents, digital twins, registries, guides, prompts, Firebase/Firestore/storage/YAML/assets/localization/runtime/signals/magnets/routes/dependencies/build environment, recovery order, integrity, validation, owner notes, certificate.
- Key files:
  - `04_CAPSULE_REGISTRY/CAPSULE_REGISTRY.md`
  - `22_RECOVERY_ORDER/GENERATION_1_RECOVERY_ORDER.md`
  - `23_INTEGRITY/CRITICAL_FILE_MANIFEST.md`
  - `23_INTEGRITY/CHECKSUM_MANIFEST.md`
  - `99_CERTIFICATE/GENERATION_1_EMERGENCY_RECOVERY_CERTIFICATE.md`
- Dependencies: all certified Generation 1 capsules.
- Related governance docs: all capsule certificates, Operations Registry/Index, critical file manifest.
- Eligible for clean repo materialization: YES
- Notes: Recovery package, not a sovereign capsule family in the same format. Certificate states `GENERATION_1_PERMANENTLY_PRESERVED`. Capsule registry contains placeholder-like `$(System.Collections.Hashtable...)` cells for certificate/zip display, but the vault certificate and critical manifests confirm preservation.

### Master Sovereign Capsule Template

- Latest version: `MASTER_SOVEREIGN_CAPSULE_TEMPLATE_V1`
- Status: ACTIVE_TEMPLATE / NOT_A_MATERIALIZATION_CAPSULE
- Location: `docs/capsules/template/MASTER_SOVEREIGN_CAPSULE_TEMPLATE_V1.md`
- Purpose: Define standard structure required for future Mental Smile Sovereign Capsules.
- Contents: required folder structure, required documents, identity fields, governance rules, future inheritance requirements.
- Key files:
  - `docs/capsules/template/MASTER_SOVEREIGN_CAPSULE_TEMPLATE_V1.md`
- Dependencies: none.
- Related governance docs: section capsule manifests and certificates.
- Eligible for clean repo materialization: NO
- Notes: Use as schema/doctrine for future capsules, not as a capsule to materialize into the new repository.

## Superseded Capsule List

No explicit older approved capsule version was found that supersedes the latest V1 certified capsule families.

Do not use these as primary latest capsule sources for new repo birth:

- Embedded duplicate capsule snapshots inside `docs/capsules/generation-1/builds/MASTER_GENERATION_1_SOVEREIGN_CAPSULE/` when a top-level section capsule exists.
- Embedded duplicate capsule snapshots inside `docs/capsules/federation/builds/FEDERATION_SOVEREIGN_CAPSULE_V1/` when a top-level section capsule exists.
- Emergency Recovery Vault embedded copies or tree references when a top-level capsule build exists.
- `docs/capsules/*/index-snapshots/*CAPSULE_CONTENT_MANIFEST_DRAFT_V1.md` as standalone source packages; these are supporting manifest/index documents, not latest capsule builds.

## Missing / Partial Capsule List

| Area | Status | Reason | Owner Decision Needed |
|---|---|---|---|
| Master Sovereign Capsule Template | ACTIVE_TEMPLATE / NOT_A_MATERIALIZATION_CAPSULE | Template only, not a certified runtime/archive capsule package | NO for use as template; YES only if owner wants a separate template repository |
| Core Doctrine zip/build wrapper | COMPLETE / CERTIFIED but no `builds/` wrapper observed | Core Doctrine is a certified direct capsule path; unlike section capsules, no separate zip was observed in inspection output | Optional owner decision if future repo birth requires every family to have a zip |
| Emergency Recovery Vault capsule registry display | COMPLETE / CERTIFIED with registry formatting placeholders | `CAPSULE_REGISTRY.md` shows placeholder strings for certificate/zip cells, while certificate/integrity manifests confirm preservation | Optional formatting cleanup only; not required for materialization inventory |
| Active Findings / Owner Decision Gates inside capsule snapshots | GOVERNED_DECISION_GATES | Some embedded governance registries record owner-decision or partial findings | Owner decision required only for those findings, not for capsule existence |

## Recommended New Repo Materialization Order

Order only. No execution performed.

1. Repository Birth Capsule
2. Core Doctrine Capsule
3. Master Sovereign Capsule Template
4. Archive Capsule
5. Signals & Magnets Capsule
6. Federation Capsule
7. Constitutional Baseline / Registry Set from Master Generation 1
8. Residential Capsule
9. Library Capsule
10. Commercial V2 Capsule
11. Administrative Capsule
12. Monitoring Capsule
13. Owner Capsule
14. Knowledge Engine Capsule
15. Emergency Recovery Vault
16. GitHub Governance Capsule
17. Deployment Capsule

## Final Verdict

CAPSULE_LATEST_VERSION_INVENTORY_V1_COMPLETED
