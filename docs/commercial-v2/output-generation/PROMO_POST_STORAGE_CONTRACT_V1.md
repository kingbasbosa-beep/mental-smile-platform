# PROMO_POST_STORAGE_CONTRACT_V1

Status: IMPLEMENTED

## Storage Location

Firestore document:

`commercial_v2_profiles/{ownerUid}`

## Fields

- `commercialOutputs.promoPost`
- `commercialOutputRegistry.promoPost`
- `commercialSignals`
- `commercialSignalRegistry.commercial_generated`

## Storage Boundary

No Firebase Storage upload is performed by this implementation. Exported PDFs are operator-download artifacts until Archive and Marketing automation are connected.

