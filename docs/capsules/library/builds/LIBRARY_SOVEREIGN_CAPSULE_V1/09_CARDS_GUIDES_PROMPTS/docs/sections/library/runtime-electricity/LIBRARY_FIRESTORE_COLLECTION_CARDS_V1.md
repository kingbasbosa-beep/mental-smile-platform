# LIBRARY_FIRESTORE_COLLECTION_CARDS_V1

Status: FUTURE_CANDIDATES_ONLY

| Candidate Collection | Purpose | Allowed Fields | Blocked Fields | Write Source |
|---|---|---|---|---|
| `library_signal_events` | Future anonymous signal events | Signal payload schema fields only | identity, free text, uploads | Library Aggregation Point |
| `library_signal_aggregates` | Future aggregate counters | counts, families, time windows | raw user data | Aggregation Worker |
| `library_signal_archive_packages` | Future archive-ready packages | aggregate summaries, magnet codes | personal data | Archive Pipeline |
| `library_strategic_summary_inputs` | Future owner summary inputs | category demand summaries | identity, diagnosis | Strategic Summary Pipeline |

Current state:

- Collections created: NO
- Rules modified: NO
- Writes enabled: NO
