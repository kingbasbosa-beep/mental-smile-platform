# APPLICATION LOCALIZATION FINAL WIRING MATRIX V1

Status: PARTIAL FINAL WIRING

Operation ID: OP-G2-UI-MICRO-PASS-2B-APPLICATION-UI-RESIDUE-CLOSURE-V1

| Surface | Localization Status | Notes |
|---|---|---|
| Splash | PARTIAL / IMPROVED | Core visible labels are wired to Application localization getters from Wave 2. |
| Residential Exit Portal | PARTIAL / IMPROVED | Central title, message, and exit button wired to localization getters from Wave 2. |
| Client Room main cards | PARTIAL | Some strings remain local/hardcoded. |
| Client Room dialogs | OPEN | Dialog text needs focused localization pass. |
| Client Room tools/links/notebook | OPEN | Local tool text needs key expansion and wiring. |
| Accessibility Room | OPEN | Old audio placeholder SnackBars and static labels need key wiring. |
| Accessibility Links | OPEN | Large static resource text needs registry/key strategy. |
| Accessibility Tools | OPEN | Large static tool text needs registry/key strategy. |
| Accessibility Suggestions | OPEN | Form labels, validation, success/error messages need full key wiring. |
| Accessibility Check-in | OPEN | Static labels need focused pass. |
| Message of the Day | OPEN | Static labels need focused pass. |
| Community Tools | OPEN | Static labels need focused pass. |

## Manual Generation Requirement

Owner still needs to run:

```powershell
flutter gen-l10n
```

Final Localization Verdict: PARTIAL

