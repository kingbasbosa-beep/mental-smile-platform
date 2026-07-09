# Archive Destination Fallback Rules V1

Status: ACTIVE
Date: 2026-07-02

## Fallback Destination

A Fallback Destination is a governed destination used only when a package cannot resolve to its intended normal destination but must still be retained for review.

## Current Fallback

`ARC-ERR-LANG-001` Archive Language Quarantine is the fallback for invalid or suspicious Archive traffic.

## Fallback Conditions

- unknown destination
- missing destination
- magnet mismatch
- package family mismatch
- signal family mismatch
- privacy/retention mismatch
- conflict requiring Owner review
- direct route/screen/collection target
- direct section-to-section bypass

## Fallback Rule

Fallback is not success. Fallback means the package is not trusted for normal destination flow and must be handled as quarantine/review.

