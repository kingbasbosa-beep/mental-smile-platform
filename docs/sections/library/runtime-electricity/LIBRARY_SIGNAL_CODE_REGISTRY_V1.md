# LIBRARY_SIGNAL_CODE_REGISTRY_V1

Status: ACTIVE

Purpose: Master signal code list for the Library Runtime Electricity Foundation.

| Signal Code | Family | Runtime Meaning | Status |
|---|---|---|---|
| L.S.001.VIEW | Screen Presence | Library home viewed | ACTIVE |
| L.S.002.VIEW | Screen Presence | Library policy viewed | READY |
| L.S.003.VIEW | Screen Presence | Specialists library branch viewed | ACTIVE |
| L.S.004.VIEW | Screen Presence | Centers library branch viewed | ACTIVE |
| L.S.005.VIEW | Screen Presence | Provider category branch viewed | ACTIVE |
| L.C.001.OPEN | Category Selection | Main library category opened | ACTIVE |
| L.C.003.OPEN | Card Open | Specialist provider content branch opened | ACTIVE |
| L.C.004.OPEN | Card Open | Center provider content branch opened | ACTIVE |
| L.C.005.OPEN | Card Open | Provider category card opened | ACTIVE |
| L.B.001.TAP | Navigation | Library carousel next tapped | ACTIVE |
| L.B.002.TAP | Navigation | Library carousel previous tapped | ACTIVE |
| L.B.003.TAP | Navigation | Library back action tapped | ACTIVE |
| L.B.004.TAP | Navigation | Library policy button tapped | ACTIVE |
| L.SE.001.SEARCH | Search | Future library search | RESERVED |
| L.F.001.FILTER | Filter | Future library filter | RESERVED |
| L.SO.001.SORT | Sorting | Future library sort | RESERVED |
| L.P.001.OPEN | Profile Open | Future public profile opened | RESERVED |
| L.E.001.OPEN | External Resource | Future external library resource opened | RESERVED |
| L.R.001.SUBMIT | Registration | Future library registration submitted | RESERVED |
| L.A.001.PLAY | Accessibility | Library accessibility/audio action | RESERVED |
| L.G.001.SUBMIT | Suggestion | Future library suggestion submitted | RESERVED |
| L.X.001.OPEN | Complaint / Support | Future library support or complaint action | RESERVED |

Validation:

- Missing Signal Codes: 0
- Signal Code Prefix: `L`
- Runtime Registry: `lib/features/library/signals/library_signal_codes.dart`
- Firebase writes: NO
- Firestore writes: NO
