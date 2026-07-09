# RESIDENTIAL_CAPSULE_RECOVERY_INSTRUCTIONS_V1

Status: READY

## Purpose

Provide recovery instructions for rebuilding Residential from this capsule.

## Recovery Order

1. Read `00_READ_ME/README_RESIDENTIAL_SOVEREIGN_CAPSULE_V1.md`.
2. Read `01_MANIFEST/RESIDENTIAL_SOVEREIGN_CAPSULE_V1_MANIFEST.md`.
3. Read `02_CONSTRUCTIVE_PROMPT/RESIDENTIAL_CAPSULE_CONSTRUCTIVE_PROMPT_V1.md`.
4. Copy source files from `03_TECHNICAL_SOURCE/` into matching project paths.
5. Copy signal runtime files from `06_SIGNALS_RUNTIME/` into `lib/features/residential/signals/`.
6. Restore route constants and router cases from `05_ROUTES/RESIDENTIAL_ROUTE_EXCERPTS_V1.md`.
7. Restore Firestore rules branch from `07_FIREBASE_FIRESTORE/RESIDENTIAL_FIRESTORE_RULES_SNAPSHOT_V1.md`.
8. Restore assets and YAML/l10n references from `08_YAML_ASSETS_L10N/`.
9. Restore cards/guides/prompts from `09_CARDS_GUIDES_PROMPTS/`.
10. Restore active document and Archive references from `10_ARCHIVE_DIGITAL_TWIN/`.
11. Verify runtime manually.

## Manual Test Checklist

- Open `/client/room`.
- Open `/accessibility/room`.
- Open `/accessibility/links`.
- Open `/accessibility/tools`.
- Open `/accessibility/suggestions`.
- Open `/accessibility/community-tools`.
- Open `/accessibility/checkin`.
- Open `/accessibility/message-of-the-day`.
- Open `/residential/exit-social-links`.
- Open Residential tool cards and confirm governed `archive_signal_events` write attempts.
- Confirm navigation continues if Firestore is unavailable.

## Safety Checks

- No identity fields.
- No diagnosis fields.
- No free personal text in Archive payload.
- No credentials.
- No secret tokens.
- No direct section write.
- No direct Library or Publishing writes.

FINAL STATUS: RESIDENTIAL_CAPSULE_RECOVERY_READY
