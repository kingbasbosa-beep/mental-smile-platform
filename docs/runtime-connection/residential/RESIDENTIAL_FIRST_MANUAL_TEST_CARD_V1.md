# RESIDENTIAL_FIRST_MANUAL_TEST_CARD_V1

Status: ACTIVE

## Manual Test

1. Deploy Firestore rules if the Residential rule extension is not deployed:

   `firebase deploy --only firestore:rules`

2. Open the app normally.

3. Open a Residential tool card or tool page that emits one of the allowed `R.T.*` tool signals.

4. Confirm navigation or dialog behavior remains unchanged.

5. Inspect browser console for:

   `RES_FIRST_TOOL_WRITE_PAYLOAD`

   `RES_FIRST_TOOL_WRITE_SUCCESS`

6. Inspect Firestore collection:

   `archive_signal_events`

## Expected Firestore Result

One new document is created with an id beginning with:

`res_tool_`

Expected values:

| Field | Expected |
|---|---|
| `source_section_code` | `SEC-RES` |
| `source_outbox_plug` | `PLG-RES-OUT` |
| `archive_destination_code` | `ARC-SIG-RES-TOOLS-001` |
| `magnet_code` | `RES-MAG-TOOLS` |
| `package_family` | `signal_event` |
| `privacy_class` | `anonymous_navigation_signal` |
| `retention_class` | `operational_summary` |
| `guard_status` | `accepted` |
| `quarantine_reason` | `NONE` |

## Failure Behavior

If Firestore is unavailable or rules reject the write, the writer logs `RES_FIRST_TOOL_WRITE_FAILURE` and does not block navigation.

## Final Status

RESIDENTIAL_FIRST_MANUAL_TEST_CARD_CREATED
