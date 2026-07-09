# Entry/Auth Signal Guide V1

Status: ACTIVE_SECTION_GUIDE

Section: Entry/Auth

Date: 2026-06-23

## Current Signal Status

No Entry/Auth signals are implemented in the inspected Splash or Login files.

This guide defines future signal families only.

Implementation status for every signal below: NO.

## Future Signal Families

| Signal Name | Producer | Consumer | Purpose | Privacy Level | Aggregation Target | Implement Now |
| --- | --- | --- | --- | --- | --- | --- |
| `entry_splash_viewed` | Splash Page | Entry/Auth aggregation | know entry surface view count | anonymous/session aggregate | Entry/Auth | NO |
| `entry_button_clicked` | Splash buttons | Entry/Auth aggregation | know which entry button was selected | anonymous/session aggregate | Entry/Auth | NO |
| `entry_language_changed` | language control | Entry/Auth aggregation | language preference observation | anonymous/session aggregate | Entry/Auth | NO |
| `entry_voice_assistance_requested` | speaker/voice controls | Entry/Auth aggregation | know need for voice explanation | anonymous/session aggregate | Entry/Auth | NO |
| `entry_unified_start_login_attempt` | Unified Start | Entry/Auth aggregation | login attempt started | account/session | Entry/Auth | NO |
| `entry_unified_start_login_failure` | Unified Start | Entry/Auth aggregation | login failure observation | account/session minimal | Entry/Auth | NO |
| `entry_unified_start_login_success` | Unified Start | Entry/Auth aggregation | login success observation | account/session minimal | Entry/Auth | NO |
| `entry_client_opened` | Quick Access button | Entry/Auth aggregation | client room entry selected | anonymous/session aggregate | Entry/Auth | NO |
| `entry_accessibility_opened` | Accessibility Access button | Entry/Auth aggregation | accessibility entry selected | anonymous/session aggregate | Entry/Auth | NO |
| `entry_provider_login_opened` | Provider / Center button | Entry/Auth aggregation | professional login opened | anonymous/session aggregate | Entry/Auth | NO |
| `entry_center_login_opened` | Provider / Center button | Entry/Auth aggregation | center login opened | anonymous/session aggregate | Entry/Auth | NO |
| `entry_owner_login_opened` | owner login path if present | Entry/Auth aggregation | owner login path opened | protected/account aggregate | Entry/Auth | NO |
| `entry_external_web_opened` | Official Website button | Entry/Auth aggregation | web entry selected | anonymous/session aggregate | Entry/Auth | NO |
| `entry_back_clicked` | back/cancel controls | Entry/Auth aggregation | back navigation selected | anonymous/session aggregate | Entry/Auth | NO |
| `entry_exit_clicked` | exit controls | Entry/Auth aggregation | exit selected | anonymous/session aggregate | Entry/Auth | NO |

## Finalization Signal Preparation

The following final Entry/Auth signals are prepared by doctrine only and remain unimplemented:

- `entry_splash_opened`
- `entry_quick_access_clicked`
- `entry_accessibility_access_clicked`
- `entry_unified_start_opened`
- `entry_unified_start_login_attempt`
- `entry_unified_start_login_success`
- `entry_unified_start_login_failure`
- `entry_create_account_clicked`
- `entry_registration_started`
- `entry_registration_completed`
- `entry_language_changed`
- `entry_speaker_assistance_requested`
- `entry_website_opened`
- `entry_exit_clicked`
- `entry_back_clicked`

## Aggregation Rule

Entry/Auth signals must be aggregated separately from Client Room signals and Accessibility Room signals.

They may feed the same application-level aggregation point if a future implementation approves it.
