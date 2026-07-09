# BUSINESS_CARD_STORAGE_CONTRACT_V1

Status: IMPLEMENTED

## Purpose

Define storage behavior for generated Business Card outputs.

## Storage Location

Firestore document:

`commercial_v2_profiles/{ownerUid}`

## Fields

- `commercialOutputs.businessCard`
- `commercialOutputRegistry.businessCard`
- `commercialSignals`
- `commercialSignalRegistry.commercial_generated`

## Storage Boundary

No Firebase Storage upload is performed by this implementation. Exported PDFs are operator-download artifacts until Archive and Marketing automation are connected.

