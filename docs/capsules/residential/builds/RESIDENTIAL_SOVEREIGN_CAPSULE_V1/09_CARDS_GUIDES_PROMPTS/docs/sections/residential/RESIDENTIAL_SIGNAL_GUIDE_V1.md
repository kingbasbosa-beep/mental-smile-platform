# Residential Signal Guide V1

Status: ACTIVE_SECTION_GUIDE

Section: Residential

Date: 2026-06-23

## Current Signal Doctrine

Residential signals must represent fresh intent, not permanent client identity.

Current Residential room work is primarily local, static, external-link based, or WhatsApp based. No active client identity signal should be inferred from a page existing.

## Current Residential Signal Ledger

| Signal | Source | Destination | Aggregation Point | Reader | Reporting | Retention | Privacy |
| --- | --- | --- | --- | --- | --- | --- | --- |
| none confirmed for static Client Room controls | Client Room | none | none | none | none | none | no client identity |
| future `quick_access_feather_tool_opened` | Client Room Feather Tool | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | session-only |
| future `quick_access_motivational_sentence_selected` | Client Room selector | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | selected text should not create identity |
| future `quick_access_notebook_updated` | Client Room notebook | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | session-only |
| future `quick_access_card_clicked` | Quick Access wall cards | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no identity |
| future `quick_access_checkin_opened` | طمّنا عليك card | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no answers included |
| future `quick_access_apps_tools_opened` | تطبيقات وأدوات card | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no identity |
| future `quick_access_suggestion_opened` | شاركنا باقتراح card | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no suggestion content |
| future `quick_access_personal_tools_opened` | أدواتك local dialog | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no personal storage |
| future `quick_access_personal_links_opened` | لينكاتك local dialog | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no saved links |
| none confirmed for Accessibility Room cards | Accessibility Room | none | none | none | none | none | no client identity |
| future `residential_room_opened` | Client or Accessibility Room | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | session-only |
| future `accessibility_card_opened` | Accessibility card tap | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no personal profile |
| future `external_resource_opened` | external link tap | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | link intent only |
| future `residential_exit_clicked` | Client or Accessibility exit cup | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no identity |
| future `residential_exit_page_opened` | Residential Exit Social Links page | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | session-only |
| future `residential_official_website_clicked` | Official Website card | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | destination intent only |
| future `residential_social_link_clicked` | Social channel card | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | channel type only |
| future `residential_contact_link_clicked` | WhatsApp or Email card | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no message content |
| future `residential_return_to_splash_clicked` | Residential Exit return button | Residential signal point | Residential aggregation point | Monitoring only if approved | optional | short-lived | no identity |

## Signal Rules

Residential signals must not store:

- permanent client account identity
- diagnosis
- case notes
- saved preferences
- saved destinations
- booking requests
- payment state
- provider assignment
- complaint text
- legal or professional misconduct details
- uploaded evidence
- phone numbers or emails

## Complaint And Safety Signal Boundary

If complaint-related summaries are approved later, Residential may only emit platform-related category counts.

Allowed future count categories may include:

- fake page inside platform
- technical/support issue
- offensive platform-owned content
- suggestion or feedback

Forbidden payloads:

- criminal complaint details
- harassment, assault, threat, or extortion details
- session misconduct details
- professional misconduct details
- center misconduct details
- licensing/regulatory complaint details
- names, phone numbers, emails, evidence, or message body

No direct Legal Governance signal is created by Residential.

## Reporting Boundary

If Residential signals are introduced later, they may feed:

- Residential reports
- Monitoring observability
- Owner coordination summaries only at convergence points
- Residential archive snapshots

They must not create a client profile.
