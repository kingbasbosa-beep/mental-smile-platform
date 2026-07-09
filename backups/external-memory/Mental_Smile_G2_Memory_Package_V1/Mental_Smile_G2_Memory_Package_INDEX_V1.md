# Mental Smile G2 Memory Package Index V1

Created: 2026-07-06

Project branch: `post-separation-pure-dna-v1`

Git commit hash at scan time: `d897d7f`

## Package Purpose

This package is an external-memory-ready governance bundle for Mental Smile Generation 2 final testing. It is designed to be copied to an external drive and used to restore project memory into a new Codex/ChatGPT conversation without copying build output or source-control internals.

## Folder Structure

| Folder | Contents |
| --- | --- |
| `01_CAPSULES/` | Final testing capsule and tester handoff. |
| `02_GUIDES/` | Guide asset registry and copied guide PNGs under `assets/`. |
| `03_CARDS/` | Master card registry, project inventory, guide asset index. |
| `04_PROMPTS/` | G2 prompt registry. |
| `05_OPERATIONS_LEDGER/` | Operations index and registry copies. |
| `06_SIGNALS/` | G2 signal registry. |
| `07_ROUTES/` | G2 route map. |
| `08_SURVEYS/` | G2 survey registry. |
| `09_FINAL_REPORTS/` | Final documentation reports, verification report, cleanup audit, backup readiness, and previous mobile-entry docs. |
| `10_BACKUP_INSTRUCTIONS/` | External drive README, clean backup plan, Windows backup notes. |

## Files Included

Core package files include:

- `G2_FINAL_TESTING_CAPSULE_V1.md`
- `G2_TESTER_HANDOFF_V1.md`
- `G2_GUIDE_ASSET_REGISTRY_V1.md`
- `G2_GUIDE_ASSET_INDEX_V1.md`
- `G2_MASTER_CARD_REGISTRY_V1.md`
- `G2_PROJECT_INVENTORY_V1.md`
- `G2_PROMPT_REGISTRY_V1.md`
- `EXECUTED_OPERATIONS_INDEX_V1.md`
- `EXECUTED_OPERATIONS_REGISTRY_V1.md`
- `G2_SIGNAL_REGISTRY_V1.md`
- `G2_ROUTE_MAP_V1.md`
- `G2_SURVEY_REGISTRY_V1.md`
- `G2_FINAL_DOCUMENTATION_INVENTORY_REPORT_V1.md`
- `G2_FINAL_VERIFICATION_REPORT_V1.md`
- `G2_FINAL_CLEANUP_AUDIT_V1.md`
- `G2_BACKUP_READINESS_CHECKLIST_V1.md`
- `EXTERNAL_DRIVE_README_V1.md`
- `CLEAN_PROJECT_BACKUP_PLAN_V1.md`
- `WINDOWS_BACKUP_NOTES_V1.md`
- `G2_EXTERNAL_MEMORY_PACKAGE_REPORT_V1.md`

Guide PNG files from `assets/branding/guides/*.png` are copied under `02_GUIDES/assets/`.

## Restore Memory Into A New Codex/ChatGPT Conversation

1. Attach or paste `Mental_Smile_G2_Memory_Package_INDEX_V1.md`.
2. Attach the registries most relevant to the task:
   - Cards: `03_CARDS/G2_MASTER_CARD_REGISTRY_V1.md`
   - Routes: `07_ROUTES/G2_ROUTE_MAP_V1.md`
   - Surveys: `08_SURVEYS/G2_SURVEY_REGISTRY_V1.md`
   - Signals: `06_SIGNALS/G2_SIGNAL_REGISTRY_V1.md`
   - Capsule: `01_CAPSULES/G2_FINAL_TESTING_CAPSULE_V1.md`
3. For visual guide work, attach the needed PNG from `02_GUIDES/assets/`.
4. Tell Codex whether to treat this package as read-only memory or as a source for updating the repo.

## Use During Testing

- Give testers `01_CAPSULES/G2_TESTER_HANDOFF_V1.md`.
- Use `09_FINAL_REPORTS/G2_FINAL_CLEANUP_AUDIT_V1.md` to triage bugs before final testing.
- Use `02_GUIDES/G2_GUIDE_ASSET_REGISTRY_V1.md` and `03_CARDS/G2_GUIDE_ASSET_INDEX_V1.md` to confirm guide assets.
- Use `10_BACKUP_INSTRUCTIONS/` before copying the project to an external drive.

## Excluded

This package intentionally excludes:

- `.git/`
- `build/`
- `.dart_tool/`
- IDE folders
- node modules
- Flutter build output
- runtime Dart source files except where documentation references file paths
- secrets, environment values, private keys, and Firebase credentials

## Risks

- `supporters_account_selection_mobile_guide.png` is missing from the source guide folder at package creation time.
- This is a memory package, not a clean full project backup.
- Verification commands were left for manual execution if local commands hang.

## Next Steps

1. Add the missing supporters guide PNG.
2. Run verification commands manually.
3. Commit/tag final clean state.
4. Copy this folder to external storage.
5. Create clean project backup after verification.
