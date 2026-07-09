# Residential Card Guide V1

Status: ACTIVE_SECTION_GUIDE

Section: Residential

Date: 2026-06-23

## Card And Control Ledger

| Item | Surface | Purpose | Route | Signal | Fixed Or Evolvable | Asset Needed | Localization Needed |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Client Room background | Client Room | Residential room scene | `/client/room` | none confirmed | Fixed visual base | yes | no visible copy |
| Client exit cup | Client Room | Clear local room state and open the Residential official-links exit page | `/residential/exit-social-links` | future documentation only | Fixed control | yes | yes |
| Client YouTube button | Client Room | Open external YouTube gateway | external URL | none confirmed | Evolvable URL | yes | yes if label appears |
| Client temporary photo button | Client Room | Select local display-only image | none | none confirmed | Evolvable local control | yes | yes if label appears |
| Client Feather Tool | Client Room | Open motivational sentence selector and update notebook | no separate route | documented only | Evolvable message list | yes | yes |
| Client notebook | Client Room | Daily Reflection Surface for selected motivational sentence | no separate route | documented only | Evolvable local surface | no new asset | yes |
| Quick Access: طمّنا عليك | Client Room | Open the shared Residential check-in flow | `/accessibility/checkin` | future documentation only | Fixed wall card | yes | yes |
| Quick Access: تطبيقات وأدوات | Client Room | Open the shared community tools surface | `/accessibility/community-tools` | future documentation only | Fixed wall card | yes | yes |
| Quick Access: شاركنا باقتراح | Client Room | Open the shared suggestion flow | `/accessibility/suggestions` | future documentation only | Fixed wall card | yes | yes |
| Quick Access: أدواتك | Client Room | Explain the future personal tools space | local dialog | future documentation only | Fixed wall card, destination pending approval | yes | yes |
| Quick Access: لينكاتك | Client Room | Open five organized categories of external support, family, recovery, learning, and accessibility links | categorized local dialog | none | Fixed wall card with evolvable external-link content | yes | yes |
| Accessibility Room background | Accessibility Room | Accessibility residential room scene | `/accessibility/room` | none confirmed | Fixed visual base | yes | no visible copy |
| Accessibility exit cup | Accessibility Room | Clear local room state and open the Residential official-links exit page | `/residential/exit-social-links` | future documentation only | Fixed control | yes | yes |
| Accessibility YouTube button | Accessibility Room | Open external YouTube gateway | external URL | none confirmed | Evolvable URL | yes | yes if label appears |
| Accessibility temporary photo button | Accessibility Room | Select local display-only image | none | none confirmed | Evolvable local control | yes | yes if label appears |
| Important Links card | Accessibility Room | Open important accessibility/support websites | `/accessibility/links` | none confirmed | Evolvable content | yes | yes |
| Assistive Tools card | Accessibility Room | Open external assistive tools list | `/accessibility/tools` | none confirmed | Evolvable content | yes | yes |
| Shared tools classifications | Accessibility and Quick Access shared tools surface | Organize tools by function rather than by user identity | `/accessibility/tools` | none | Functional categories: visual support, audio support, communication, reading, writing, daily assistance | no new asset | yes |
| Suggestions card | Accessibility Room | Open WhatsApp-only suggestion form | `/accessibility/suggestions` | none confirmed | Evolvable copy | yes | yes |
| Community Tools card | Accessibility Room | Open placeholder community tools page | `/accessibility/community-tools` | none confirmed | Evolvable future content | yes | yes |
| Check In card | Accessibility Room | Open WhatsApp-only check-in/support page | `/accessibility/checkin` | none confirmed | Evolvable copy | yes | yes |
| Notebook feather | Accessibility Room | Open predefined message selection | `/accessibility/message-of-the-day` | none confirmed | Evolvable message list | yes | yes |
| Residential Exit Social Links page | Residential | Present official Mental Smile communication links after room exit | `/residential/exit-social-links` | future documentation only | Fixed standalone exit surface with evolvable verified links | no new asset | yes |
| Application Safety & Complaint Guidance | Application / Residential guidance placement | Provide safety, verification, privacy, and complaint-boundary guidance without creating complaint runtime | READY_TO_ADD | future documentation only | Guidance content; not a complaint system | no new asset | yes |

## Residential Card Law

Every visible Residential accessibility label should follow:

`[visual icon] label [speaker placeholder]`

Speaker behavior is placeholder only unless a future Residential accessibility audio feature is approved.

## No Identity Rule

No card may create client identity, saved preference memory, booking state, payment state, diagnosis state, or provider assignment.

## Safety Guide Placement

The safety/complaint guide is active inside the Quick Access Links Card.

Placement:

- Client Room
- Links Card / `لينكاتك`
- Local entry: `إرشادات الأمان والشكاوى` / `Safety & Complaint Guidance`
- Local dialog only

Behavior:

- no external URL;
- no room exit;
- no route;
- no Firebase write;
- no complaint form;
- no complaint collection.

It must not be implemented as a complaint form or complaint collection.

## Application Final Placement Correction

The Residential Exit Social Links page is no longer the main safety/complaint guidance holder.

Exit page scope:

- official Mental Smile accounts;
- official website;
- contact channels;
- return to Splash;
- short public-channel safety note only.

Links Card scope:

- external categorized links;
- local Safety & Complaint Guidance dialog.
