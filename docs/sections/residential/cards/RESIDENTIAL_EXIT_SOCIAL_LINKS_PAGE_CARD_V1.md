# Residential Exit Social Links Page Card V1

Operation ID: OP-RESIDENTIAL-EXIT-SOCIAL-LINKS-PAGE-V1  
Date: 2026-06-23  
Section: Residential

## Page Identity

- Page name: Residential Exit Social Links
- Route: `/residential/exit-social-links`
- Route constant: `Routes.residentialExitSocialLinks`
- Runtime file: `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart`
- Ownership: Residential
- Authentication required: no
- Firebase dependency: none
- Commercial dependency: none

## Purpose

Provide a standalone Residential exit destination after leaving:

- Client Room
- Accessibility Room
- future Residential rooms

The page presents official Mental Smile communication links and allows returning to Splash.

## Source Reference

Visual and functional reference only:

- `/app/exit-social-links`
- `AppExitSocialLinksPage`

The Residential page does not import, wrap, call, or route through the reference page.

## Official Links

- Official Website
- Mental Smile OS
- Facebook
- YouTube
- Telegram
- TikTok
- LinkedIn
- X
- WhatsApp
- Instagram
- GitHub
- Email

All destinations were copied from the existing official accounts page.

## Missing Contact Data

No separate voice-call contact number exists in the source page.

The only source contact number is embedded in the existing WhatsApp URL.

Status: OWNER_REQUIRED if a separate public phone number is intended later.

## Exit Flow

```text
Client Room / Accessibility Room
-> clear local room state
-> /residential/exit-social-links
-> official external link or return to Splash
```

## Future Signals

Documentation only:

- Residential Exit Clicked
- Residential Exit Page Opened
- Official Website Clicked
- Social Link Clicked
- Contact Link Clicked
- Return To Splash Clicked

No runtime signal was implemented.

## Status

Page Status: ACTIVE_PENDING_OWNER_MANUAL_VERIFICATION

Final Verdict: RESIDENTIAL_EXIT_SOCIAL_LINKS_PAGE_CARD_CREATED
