# Archive Access Model V1

Operation ID: OP-ARCHIVE-OS-FOUNDATION-BLOCKS-A-H-V1

Date: 2026-06-25

## Access Classes

| Access Class | Meaning | Examples |
|---|---|---|
| Public | May be visible publicly in future Archive web surfaces | public doctrine summaries, public history summaries |
| Internal | Platform internal reference | internal reports, section maps |
| Governance | Used for constitutional and registry governance | constitutions, registries, governance certification |
| Owner | Requires owner-level visibility or approval | sovereign storage references, owner decisions |
| Restricted | Sensitive operational record; not public by default | legal records, failure records with risk details |
| Frozen | Immutable record retained as final state | certified reports, freeze reports |
| Historical | Preserved for past lineage, not current authority | legacy docs, old audit reports |

## Access Rules

- Public does not mean editable.
- Internal does not mean ungoverned.
- Governance records must remain versioned.
- Owner access does not allow silent deletion.
- Restricted records require explicit future access policy before runtime exposure.
- Frozen records are read-only.
- Historical records are preserved but not active source of truth.

