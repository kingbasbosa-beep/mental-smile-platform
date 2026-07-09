# RESIDENTIAL_FIRESTORE_RULES_SNAPSHOT_V1

Status: SNAPSHOTTED

## Purpose

Snapshot the Residential-relevant Firestore rules branch.

## Signal Codes

```javascript
function residentialToolSignalCodes() {
  return [
    'R.T.001.OPEN',
    'R.T.005.OPEN',
    'R.T.006.OPEN',
    'R.T.007.OPEN'
  ];
}
```

## Residential Validation Branch

```javascript
function firstResidentialToolArchiveSignalValid(eventId) {
  return request.resource.data.keys().hasOnly(archiveSignalEventAllowedKeys())
    && request.resource.data.event_id == eventId
    && request.resource.data.source_section_code == 'SEC-RES'
    && request.resource.data.source_outbox_plug == 'PLG-RES-OUT'
    && request.resource.data.destination_section_code == 'SEC-ARC'
    && request.resource.data.destination_inbox_plug == 'PLG-ARC-IN'
    && request.resource.data.archive_destination_code == 'ARC-SIG-RES-TOOLS-001'
    && request.resource.data.package_family == 'signal_event'
    && request.resource.data.signal_code in residentialToolSignalCodes()
    && request.resource.data.magnet_code == 'RES-MAG-TOOLS'
    && request.resource.data.privacy_class == 'anonymous_navigation_signal'
    && request.resource.data.retention_class == 'operational_summary'
    && request.resource.data.guard_status == 'accepted'
    && request.resource.data.quarantine_reason == 'NONE'
    && request.resource.data.created_at is timestamp
    && request.resource.data.payload_minimal is map
    && request.resource.data.payload_minimal.keys().hasOnly(archiveSignalPayloadAllowedKeys())
    && isNonEmptyString(request.resource.data.payload_minimal.source_screen)
    && isNonEmptyString(request.resource.data.payload_minimal.source_widget)
    && isNonEmptyString(request.resource.data.payload_minimal.action)
    && request.resource.data.payload_minimal.runtime_version == 'residential-r11-local-v1';
}
```

## Collection Rule

```javascript
match /archive_signal_events/{eventId} {
  allow read: if isOwner() || isMonitoringOperator();
  allow create: if firstControlledArchiveSignalValid(eventId)
    || firstResidentialToolArchiveSignalValid(eventId)
    || firstLibraryHomeSignalValid(eventId)
    || firstLibrarySpecialistsSignalValid(eventId)
    || firstLibraryCentersSignalValid(eventId);
  allow update, delete: if false;
}
```

## Firebase Files

| File | Residential Relevance |
|---|---|
| `firestore.rules` | Required Residential `archive_signal_events` create branch. |
| `firestore.indexes.json` | No special Residential index required by current capsule. |
| `storage.rules` | No Residential Storage write branch required by current capsule. |
| `firebase.json` | Project Firebase config file; no secrets included in capsule excerpts. |

FINAL STATUS: RESIDENTIAL_FIRESTORE_RULES_SNAPSHOTTED
