# Marketing Asset Access Policy V1

Operation ID: OP-ARCHIVE-MARKETING-ASSET-VAULT-FOUNDATION-V1  
Date: 2026-06-25

## Purpose

This policy defines access expectations for archived visual and media assets.

## Policy Rules

Marketing may view existing archived assets.

Marketing may create new asset candidates.

Marketing may not overwrite source assets directly.

Technical may receive deployment copies only.

Technical may not mutate source assets directly.

Owner may approve replacement.

Archive preserves all versions.

## Department Access

| Actor | Allowed | Forbidden |
|---|---|---|
| Marketing | View archived assets, create candidates, request registration | Silent source overwrite |
| Technical | Receive deployment copies, implement runtime copies | Direct source mutation |
| Owner | Approve source replacement | Store credentials in Archive |
| Archive | Preserve source, cards, versions, registry | Execute runtime behavior |
| Strategic Planning | Reference asset history and readiness | Modify assets |

## Credential Rule

No credentials, secrets, account passwords, or private tokens may be stored inside asset vault records.

## Runtime Rule

Runtime may reference deployment copies only.

Source asset authority remains inside Archive.
