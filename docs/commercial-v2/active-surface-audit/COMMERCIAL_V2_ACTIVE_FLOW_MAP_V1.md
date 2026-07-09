# Commercial V2 Active Flow Map V1

## Operation

OP-COMMERCIAL-V2-ACTIVE-SURFACE-EXTRACTION-AND-CARD-REGISTRY-AUDIT-V1

## Status

FORENSIC EXTRACTION ONLY

NO ARCHIVING

NO DELETION

NO RUNTIME CHANGES

## Scope

Start: Commercial Registration.

End: Submit For Distribution.

## Active Flow

| Stage | Route | Widgets | Inputs | Outputs | Dependencies | Collections | Storage | Signals | Status |
|---|---|---|---|---|---|---|---|---|---|
| Registration | `/commercial-v2/start` | `CommercialV2StartPage`, `_GuidedField`, create account button | Email, Phone, Password | Firebase Auth user, profile shell | Firebase Auth, Firestore | `commercial_v2_profiles/{uid}` | None | None found | EXISTS / CHANGE_REQUIRED |
| Authentication | `/commercial-v2/start` | `CommercialV2StartPage`, login button | Email, Password, optional phone shell update | Auth session, ensured profile shell | Firebase Auth, Firestore | `commercial_v2_profiles/{uid}` | None | None found | EXISTS |
| Core Information | `/commercial-v2/owner` | `CommercialV2OwnerProfilePage`, `_GuidedField`, category controls | Name, category, description, location, phone, WhatsApp, services, audiences | Draft profile payload | Firebase Auth, Firestore | `commercial_v2_profiles/{uid}.draftProfile` | None | None found | EXISTS |
| Optional Information | `/commercial-v2/owner` | conditional fields, repeatable sections, custom sections, links/media fields | Links, social/media links, custom sections, category-specific fields | Expanded draft profile payload | Firebase Auth, Firestore | `commercial_v2_profiles/{uid}.draftProfile` | None | None found | EXISTS |
| Style Configuration | `/commercial-v2/owner` | style instruction field, generated CV preview controls | Style instruction text | Generated CV preview payload/style | Local state, PDF builder | Draft profile remains in Firestore when saved | None | None found | PARTIAL |
| Image Upload | `/commercial-v2/owner` | `_IdentityImageControl`, `_CommercialV2IdentityImage`, image picker | Gallery image | `profileImageUrl` or `logoImageUrl`, saved draft | ImagePicker, Firebase Storage, Firestore | `commercial_v2_profiles/{uid}` | `commercial_v2_identity/{uid}/profile_photo` or `/logo` | None found | EXISTS / BUG_PRESENT |
| Profile Generation | `/commercial-v2/owner` | save draft, publish, new version, `_CommercialV2Store` | Draft payload | Draft/live profile, version history | Firebase Auth, Firestore | `commercial_v2_profiles/{uid}`, `versions` | None | None found | EXISTS |
| CV Generation | `/commercial-v2/owner` | `_GeneratedCvPreview`, `_CommercialV2MedicalWhitePdfBuilder` | Draft payload, style instruction | Preview UI, preview PDF | Printing/pdf, network image retrieval | None beyond existing profile data | Reads image URL indirectly | None found | PARTIAL / BUG_PRESENT |
| Business Card Generation | None active | No active widget/action found | Not available | Not available | Missing generator | None | None | None found | MISSING |
| Promo Post Generation | None active | No active widget/action found | Not available | Not available | Missing generator | None | None | None found | MISSING |
| Preview | `/commercial-v2/preview` | `CommercialV2PreviewPage`, `_CommercialV2ProfileView` | Draft profile stream | Read-only profile preview | Firebase Auth, Firestore stream | `commercial_v2_profiles/{uid}.draftProfile` | Reads identity URL | None found | EXISTS |
| Submit For Distribution | `/commercial-v2/owner` | Publish button, `_publish`, `_CommercialV2Store.publish` | Valid draft payload | `liveProfile`, public URL readiness message, version increment | Firebase Auth, Firestore | `commercial_v2_profiles/{uid}`, `versions` | None | None found | EXISTS / CHANGE_REQUIRED |

## Flow Findings

- Registration currently requires Email, Phone, and Password.
- Confirm Password is not observed in the current registration surface.
- Target registration in the prompt is Phone, Password, Confirm Password.
- Profile publishing currently creates a live public profile, not a distribution asset package.
- Business card generation and promo post generation are not active surfaces.
- No Commercial V2 runtime signal emission was found.

