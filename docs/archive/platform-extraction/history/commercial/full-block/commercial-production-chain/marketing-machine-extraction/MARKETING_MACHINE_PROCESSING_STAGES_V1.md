# Marketing Machine Processing Stages V1

## Operation

OP-MARKETING-MACHINE-EXTRACTION-AUDIT-V1

## Status

FORENSIC EXTRACTION ONLY

NO DEPARTMENT CREATION

## Processing Chain

```text
Receive
  -> Prepare
  -> Generate
  -> Publish
  -> Track
  -> Report
  -> Archive
```

## Stage Map

| Stage | Purpose | Inputs | Outputs | Current Status | Boundary |
|---|---|---|---|---|---|
| Receive | Accept Commercial V2 outputs into the Marketing Machine. | Published profiles, images, logos, PDFs, CV assets, future campaign inputs | Intake record / asset package draft | MISSING | Must not accept unowned or unclassified assets. |
| Prepare | Normalize assets for campaign or publication use. | Intake record, source metadata, archive destination | Prepared asset package | MISSING | Must preserve source and ownership metadata. |
| Generate | Create derivative marketing assets. | Prepared package | Business cards, promo posts, campaign packages, announcements | MISSING | Must not auto-publish generated assets. |
| Publish | Send approved assets to publication destinations. | Generated assets, channel selection, publication status | Published item reference | MISSING | Publication manager required; no current department. |
| Track | Capture performance signals. | Published item references, channel events | Performance observations/signals | MISSING | Requires signal definitions and privacy rules. |
| Report | Convert tracked performance into summaries. | Performance observations, campaign metadata | Marketing performance report / strategic input | MISSING | Requires aggregation and report registry. |
| Archive | Store source, generated assets, and publication history. | Source assets, generated assets, reports | Archive package | PARTIAL / BLOCKED | Archive destinations exist; contracts missing. |

## Stage Finding

The only partially available stage is Archive, because Archive destinations exist. Receive through Report remain missing as an operational machine.

