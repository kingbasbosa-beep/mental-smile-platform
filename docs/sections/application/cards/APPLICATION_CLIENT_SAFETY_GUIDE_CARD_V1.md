# APPLICATION CLIENT SAFETY GUIDE CARD V1

Operation ID: OP-APPLICATION-CARDS-LINKS-LOCALIZATION-CLOSURE-V1

Status: ACTIVE

Section Owner: Application

Parent Guide:

- docs/sections/application/APPLICATION_CLIENT_SAFETY_AND_COMPLAINT_GUIDE_V1.md

## Card Identity

Card ID:

APPLICATION_CLIENT_SAFETY_GUIDE_CARD_V1

Arabic Label:

إرشادات الأمان والشكاوى

English Label:

Safety & Complaint Guidance

## Purpose

Provide client-facing guidance about safety, provider/center verification, written agreements, privacy, and complaint boundaries.

This card is guidance only.

It is not a complaint form.

It is not a complaint runtime.

It is not a Legal Governance connection.

## Placement

Current runtime placement:

ACTIVE_IN_QUICK_ACCESS_LINKS_CARD

Reason:

The final placement correction inserted the safety guide as a local guidance dialog inside the Quick Access Links Card. It is not an external link and does not create a route, Firebase collection, complaint form, or complaint runtime.

Current placement:

- Client Room
- Quick Access Links Card / `لينكاتك`
- Local entry: `إرشادات الأمان والشكاوى` / `Safety & Complaint Guidance`
- Local dialog sections: before provider contact, safety rules, platform contact, official authorities, important notice

## Route

Current route:

NONE

Runtime surface:

Local dialog inside `client_room_page.dart`

## Signal

Current signal:

NONE

Future signal candidate:

`application_safety_guidance_opened`

Allowed future aggregation:

count only

Forbidden payload:

- complaint text
- names
- phone numbers
- emails
- evidence
- legal details
- professional misconduct details

## Runtime Impact

Runtime changed:

YES

Firebase changed:

NO

Complaint collection created:

NO

Complaint runtime created:

NO

Final Verdict:

APPLICATION_CLIENT_SAFETY_GUIDE_CARD_PLACED_IN_LINKS_CARD
