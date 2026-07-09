# Archive Marketing Asset Vault Constitution V1

Operation ID: OP-ARCHIVE-MARKETING-ASSET-VAULT-FOUNDATION-V1  
Date: 2026-06-25

## Mission

Marketing Asset Vault preserves the source-of-truth visual and media assets of Mental Smile.

The vault exists so logos, backgrounds, buttons, icons, cards, campaign visuals, provider portfolio visuals, library visuals, accessibility visuals, and future assets remain recoverable, versioned, and governed.

Archive remains the source of truth.

Runtime uses deployment copies only.

## Scope

Marketing Asset Vault may register:

- Logos
- Splash backgrounds
- Room backgrounds
- Exit page backgrounds
- Buttons
- Icons
- Card images
- Post images
- Campaign images
- Provider portfolio assets
- Commercial template assets
- Library assets
- Accessibility assets
- Future assets

## Ownership

Archive owns the source-of-truth asset record.

Owner approval is required before replacing source assets.

Departments may request, view, and consume asset references according to access policy.

Runtime does not own source assets.

## Consumers

- Marketing and Media Vault
- Marketing Content Library
- Technical Recovery Vault
- Provider Portfolio Vault
- Commercial
- Library
- Application / Residential
- Accessibility surfaces
- Owner Vault
- Strategic Planning

## Boundaries

Marketing Asset Vault does not:

- Create runtime
- Create routes
- Modify Firebase
- Modify UI
- Move asset files in this foundation operation
- Delete asset files
- Overwrite asset files
- Change `pubspec.yaml`
- Create asset upload runtime
- Create asset management UI

## Core Rules

No Asset Without Asset Card.

No Runtime Asset As Source Of Truth.

No Direct Runtime Asset Editing.

Archive Asset Vault Is Source Of Truth.

Runtime Uses Deployment Copies Only.

Marketing View-Only For Existing Archived Assets.

Technical Receives Deployment Copies.

Owner Approves Source Replacement.

## Runtime Copy Rule

Runtime assets may exist under application asset folders as deployment copies.

Deployment copies are not source-of-truth records.

If a runtime copy is changed, the source asset card must be updated or a new approved source version must be registered before the change becomes authoritative.

## Marketing Rule

Marketing may create candidate assets and request archive registration.

Marketing may view existing archived assets.

Marketing may not silently overwrite archived source assets.

## Technical Rule

Technical receives deployment copies for implementation.

Technical does not mutate source assets directly.

Technical must reference the relevant asset card when using a governed asset.

## Final Rule

Preserve source.

Deploy copies.

Replace only with approval.
