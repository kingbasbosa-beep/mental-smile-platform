# LIBRARY_PROVIDER_MANUAL_TEST_CARDS_V1

Status: ACTIVE

## Before Testing

Deploy Firestore rules if the RUN-7 rule extension is not deployed:

`firebase deploy --only firestore:rules`

## Test Cards

| Test | User Action | Expected Signal | Expected Destination |
|---|---|---|---|
| Library home view | Open `/web/library` | `L.S.001.VIEW` | `ARC-SIG-LIB-HOME-001` |
| Library category/card open | Open a Library category card | `L.C.001.OPEN` | `ARC-SIG-LIB-HOME-001` |
| Specialists display view/open | Open `/library/providers/specialists` or the Specialists card | `L.S.003.VIEW` or `L.C.003.OPEN` | `ARC-SIG-LIB-SP-001` |
| Centers display view/open | Open `/library/providers/centers` or the Centers card | `L.S.004.VIEW` or `L.C.004.OPEN` | `ARC-SIG-LIB-CTR-001` |

## Console Evidence

Expected payload log:

`LIB_PROVIDER_WRITE_PAYLOAD`

Expected success log:

`LIB_PROVIDER_WRITE_SUCCESS`

Expected safe failure log:

`LIB_PROVIDER_WRITE_FAILURE`

## Expected Firestore Result

Documents are created in `archive_signal_events` with ids beginning:

`lib_signal_`

Navigation should continue unchanged even if Firestore is unavailable.

## Final Status

LIBRARY_PROVIDER_MANUAL_TEST_CARDS_CREATED
