# ARCHIVE_DESTINATION_TRAFFIC_CARDS_V1

Status: ACTIVE TRAFFIC CARDS

## Traffic Cards

| Archive Destination Code | Human Title | Incoming Sources | Accepted Section Codes | Accepted Outbox Plugs | Package / Signal Families | Magnet Family | Archive Vault | Generated Summaries | Generated Dispatches | Allowed Destination Inboxes | Privacy Class | Retention Class | AI Memory Destination | Owner | Lifecycle |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `ARC-PKG-CV2-001` | Commercial V2 Registration Packages | Commercial V2 registration package builder | `SEC-CV2` | `PLG-CV2-OUT` | Registration package | Commercial V2 Registration | Commercial V2 Package Vault | Strategic / Owner / Publishing readiness | Publishing dispatch after approval | `PLG-PUB-IN`, `PLG-LIB-IN` after approval | governed_provider_package | archive_ready | `ARC-AIM-PUB-001` | Archive Owner | Active foundation |
| `ARC-PUB-CV2-001` | Commercial V2 Publishing Packages | Commercial V2 / Publishing | `SEC-CV2`, `SEC-PUB` | `PLG-CV2-OUT`, `PLG-PUB-OUT` | Publishing package | Commercial V2 Publishing | Publishing Package Vault | Owner / Monitoring / Publishing summaries | Library dispatch after approval | `PLG-LIB-IN` | governed_publishing_package | archive_ready | `ARC-AIM-PUB-001` | Publishing Owner | Active foundation |
| `ARC-SIG-CV2-SHOWCASE-001` | Commercial V2 Showcase Signals | Commercial V2 showcase navigation signals | `SEC-CV2` | `PLG-CV2-OUT` | Showcase navigation signals; Commercial V2 demand signals | Commercial V2 Showcase Interest | Commercial V2 Signal Vault | Commercial V2 Demand Summary; Monitoring Summary; Owner Summary | Monitoring summary dispatch; Owner summary dispatch | `PLG-MON-IN`, `PLG-OWN-IN` | anonymous_navigation_signal | operational_summary | `ARC-AIM-RUN-001` | Commercial V2 Owner / Archive Owner | Active foundation |
| `ARC-SIG-LIB-001` | Library Demand Signals | Library local signals | `SEC-LIB` | `PLG-LIB-OUT` | Demand signals | Library Demand | Library Signal Vault | Library demand summary | Owner/Monitoring summary dispatch | `PLG-OWN-IN`, `PLG-MON-IN` | anonymous_demand_signal | operational_summary | `ARC-AIM-RUN-001` | Library Owner | Active foundation |
| `ARC-SIG-RES-TOOLS-001` | Residential Tool Signals | Residential tool actions | `SEC-RES` | `PLG-RES-OUT` | Tool signals | Residential Tool | Residential Signal Vault | Residential tool summary | Owner/Monitoring summary dispatch | `PLG-OWN-IN`, `PLG-MON-IN` | anonymous_demand_signal | operational_summary | `ARC-AIM-RUN-001` | Residential Owner | Active foundation |
| `ARC-SIG-ACC-AUD-001` | Accessibility Audio Signals | Accessibility/audio actions | ALL | Any governed outbox | Accessibility/audio signals | Accessibility Audio | Accessibility Signal Vault | Accessibility readiness summary | Owner/Monitoring summary dispatch | `PLG-OWN-IN`, `PLG-MON-IN` | anonymous_navigation_signal | operational_summary | `ARC-AIM-GOV-001` | Accessibility Owner | Active foundation |
| `ARC-PUB-PROV-001` | Provider Publishing Queue | Commercial V2 / Publishing | `SEC-CV2`, `SEC-PUB` | `PLG-CV2-OUT`, `PLG-PUB-OUT` | Provider publishing package | Provider Publishing | Provider Publishing Queue Vault | Publishing readiness summary | Library display dispatch after approval | `PLG-LIB-IN` | governed_publishing_package | archive_ready | `ARC-AIM-PUB-001` | Publishing Owner | Active foundation |
| `ARC-SUM-STR-001` | Strategic Summary Feed | Archive summaries | Archive internal | Archive internal | Strategic summaries | Strategic Summary | Strategic Vault | Strategic memory | Strategic dispatch | `PLG-SMV-IN`, `PLG-OWN-IN` | constitutional_record | constitutional_permanent | `ARC-AIM-STR-001` | Strategic Owner | Active foundation |
| `ARC-SUM-OWN-001` | Owner Decision Feed | Archive summaries | Archive internal | Archive internal | Owner decision summaries | Owner Summary | Owner Vault | Owner decision feed | Owner dispatch | `PLG-OWN-IN` | constitutional_record | constitutional_permanent | `ARC-AIM-STR-001` | Owner | Active foundation |
| `ARC-RUN-SNP-001` | Runtime Snapshots | Runtime packages | ALL | Any governed outbox | Runtime snapshots | Runtime Snapshot | Runtime Package Vault | Runtime health summary | Technical/Owner dispatch | `PLG-TRV-IN`, `PLG-OWN-IN` | restricted_recovery | recovery_permanent | `ARC-AIM-RUN-001` | Runtime Owner | Active foundation |
| `ARC-DNA-SNP-001` | DNA Snapshots | Pure DNA gates | ALL | Any governed outbox | DNA snapshots | DNA Snapshot | DNA Vault | DNA readiness summary | Owner/Recovery dispatch | `PLG-OWN-IN`, `PLG-TRV-IN` | constitutional_record | constitutional_permanent | `ARC-AIM-REC-001` | DNA Owner | Active foundation |
| `ARC-AIM-PKG-001` | AI Memory Packages | AI memory packages | ALL | Any governed outbox | AI memory packages | AI Memory | AI Memory Vault | AI memory summary | Strategic/Owner dispatch | `PLG-SMV-IN`, `PLG-OWN-IN` | ai_memory_governed | ai_memory_governed | `ARC-AIM-OPS-001` | AI Memory Owner | Active foundation |

## Validation

Every Archive Destination owns a Traffic Card: YES

Missing Traffic Cards: 0

FINAL STATUS: ARCHIVE_DESTINATION_TRAFFIC_CARDS_COMPLETE
