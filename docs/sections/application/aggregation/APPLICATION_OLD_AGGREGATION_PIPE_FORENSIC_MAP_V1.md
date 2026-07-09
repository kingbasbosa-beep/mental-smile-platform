# APPLICATION OLD AGGREGATION PIPE FORENSIC MAP V1

Operation ID: OP-APPLICATION-AGGREGATION-POINT-FOUNDATION-CLEAN-V1

Mode: FORENSIC MAP ONLY

Runtime changed: NO

Signals connected: NO

Monitoring connected: NO

Administrative connected: NO

Firebase changed: NO

## Purpose

This map inspects existing aggregation components before creating a clean Application-owned aggregation foundation.

The rule is conservative:

- clean generic infrastructure may be reused conceptually;
- Monitoring-owned runtime stays Monitoring-owned;
- Residential monitoring runtime stays Residential/Monitoring-owned;
- unclear, old, screen-specific, or cross-section pipes are not patched into Application;
- Application aggregation remains foundation-only until certified.

## Pipe Map

| Component | File | Current Owner | Producer | Consumer | Input Type | Output Type | Current Destination | Current Status | Old Screen Dependency | Old Route Dependency | Archived Section Dependency | Not-Yet-Generated Dependency | Can Application Reuse Safely? | Decision |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Signal aggregation engine | lib/features/signals/domain/aggregation/signal_aggregation_engine.dart | Signals infrastructure | `CleanSignalRuntime` or caller passing `SignalPackage` | In-memory snapshot caller | `SignalPackage` | `SignalAggregate` | In-memory static map | Active generic infrastructure | NO | NO | NO | NO | Yes, only as conceptual infrastructure later | REUSE_AS_INFRASTRUCTURE |
| Signal aggregate model | lib/features/signals/domain/models/signal_aggregate.dart | Signals infrastructure | Aggregation engine | Monitoring/read model consumers | aggregate fields | Map/model | Generic aggregate representation | Active generic model | NO | NO | NO | NO | Yes, model shape can inspire Application summary contracts | REUSE_AS_INFRASTRUCTURE |
| Signal aggregate read models | lib/features/signals/domain/models/signal_aggregate_read_models.dart | Signals/read-model layer | Aggregate readers | UI/report consumers if wired | `SignalAggregate` lists | typed summary containers | Generic read models | Partial/legacy-read-model style | YES/UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | Not directly; names include old concepts like goals | ARCHIVE_ONLY |
| Signal aggregation validator | lib/features/signals/domain/validators/signal_aggregation_validator.dart | Signals infrastructure | Signal runtime | Aggregation engine | `SignalPackage` | eligibility/failure reason | Generic aggregation gate | Active but scoped to existing signal types | PARTIAL | PARTIAL | NO | NO | No direct reuse for Application until Application signal families are certified | APPLICATION_LOCAL_WRAP_ONLY |
| Aggregation category registry | lib/features/signals/domain/registries/signal_aggregation_category_registry.dart | Signals infrastructure | Aggregation engine | aggregate keys/readers | signal category | aggregate category string | Generic categories | Active but not Application-specific | PARTIAL | PARTIAL | NO | NO | No direct reuse unless Application categories are approved | APPLICATION_LOCAL_WRAP_ONLY |
| Clean signal runtime aggregation call | lib/features/signals/domain/emitters/clean_signal_runtime.dart | Signals runtime | Signal emitter | Aggregation engine | emitted signal | aggregate update log | runtime debug/update path | Active generic runtime | UNKNOWN | UNKNOWN | NO | NO | Not reused now; Application has no runtime signal connection | OUT_OF_SCOPE |
| Monitoring aggregation adapter | lib/features/monitoring/domain/adapters/monitoring_aggregation_adapter.dart | Monitoring | Generic aggregates | Monitoring feeds | `SignalAggregate` iterable | `ResidentialMonitoringFeed`, `CommercialMonitoringFeed` | Monitoring UI/feed layer | Active Monitoring-owned adapter | PARTIAL | PARTIAL | NO | NO | No. Application must not connect to Monitoring now | OUT_OF_SCOPE |
| Residential monitoring router | lib/features/monitoring/residential/domain/residential_monitoring_router.dart | Monitoring / Residential observability | Residential signal package | Residential monitoring route | `SignalPackage` | `ResidentialMonitoringRoute` | Monitoring residential route mapping | Active Residential monitoring concept | PARTIAL | PARTIAL | NO | NO | No direct reuse; only pattern may inspire later local Application router | APPLICATION_LOCAL_WRAP_ONLY |
| Residential monitoring registry | lib/features/monitoring/residential/domain/residential_monitoring_registry.dart | Monitoring / Residential observability | Signal type constants | Residential monitoring router | signal type | aggregate kind | Residential monitoring | Active but covers old/support/library/tool signal names | PARTIAL | PARTIAL | NO | NO | No direct reuse; Application must define its own family map | APPLICATION_LOCAL_WRAP_ONLY |
| Residential monitoring snapshot builder | lib/features/monitoring/residential/application/residential_monitoring_snapshot_builder.dart | Monitoring / Residential observability | Residential aggregates | Residential monitoring snapshot | Residential aggregates | summary snapshot | Residential monitoring read model | Active Monitoring-owned builder | PARTIAL | PARTIAL | NO | NO | Pattern only; no runtime reuse now | APPLICATION_LOCAL_WRAP_ONLY |
| Residential signal aggregate models | lib/features/monitoring/residential/aggregates/residential_signal_aggregate.dart | Monitoring / Residential observability | Residential monitoring route/builders | Snapshot/report builders | residential aggregate data | aggregate subclasses | Residential monitoring | Active but includes historical aggregate kinds | PARTIAL | PARTIAL | NO | NO | No direct reuse; Application needs section-local summary contracts | APPLICATION_LOCAL_WRAP_ONLY |
| Application aggregation readiness doc | docs/sections/application/APPLICATION_SECTION_AGGREGATION_READINESS_V1.md | Application docs | Application final audit | Owner/developer review | documentation | readiness statement | Application docs | PLANNED_ONLY | NO | NO | NO | YES, future Application runtime not generated | Yes, as foundation evidence | REUSE_AS_INFRASTRUCTURE |
| Residential signal guide aggregation references | docs/sections/residential/RESIDENTIAL_SIGNAL_GUIDE_V1.md | Residential docs | Residential governance docs | Owner/developer review | documentation | future signal ledger | Residential docs | ACTIVE_SECTION_GUIDE | NO | NO | NO | YES | Yes, as Application input family reference only | APPLICATION_LOCAL_WRAP_ONLY |
| Governance registry aggregate lifecycle references | docs/constitutional-baseline/registries/SIGNAL_GOVERNANCE_REGISTRY_V1.md and SIGNAL_OWNERSHIP_REGISTRY_V1.md | Historical governance | Governance registry | Owner/developer review | documentation | lifecycle warnings | Constitutional baseline | Historical / cross-system | UNKNOWN | UNKNOWN | YES/UNKNOWN | UNKNOWN | No direct Application ownership | OUT_OF_SCOPE |

## Counts

Old Pipes Inspected:

14

Reusable Infrastructure:

3

Application Local Wrap Only:

6

Archive Only:

1

Out Of Scope:

4

Owner Decision Required:

0

## Current Finding

There is no certified Application-owned runtime aggregation point.

Existing runtime aggregation belongs to:

- generic Signals infrastructure;
- Monitoring adapters;
- Residential monitoring observability.

The Application Section should therefore create a clean local foundation and avoid patching old runtime pipes.

Final Verdict:

APPLICATION_OLD_AGGREGATION_PIPE_FORENSIC_MAP_COMPLETED
