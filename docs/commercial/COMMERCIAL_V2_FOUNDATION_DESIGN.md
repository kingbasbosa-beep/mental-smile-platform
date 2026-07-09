# COMMERCIAL V2 FOUNDATION DESIGN

Mode: DESIGN ONLY  
Runtime effect: none  
Implementation authority: none  
Commercial V1 state: frozen and archived as historical reference only

## Executive Summary

Commercial V2 should be a simple publishing and discovery system for mental-health-related entities. Its job is visibility, access, and reusable profile publishing. It should not verify, rank, recommend, book, schedule, contract, or manage payments. The safest foundation is a universal entity model with lightweight category lenses, so Mental Smile can publish psychiatrists, centers, NGOs, academies, coaches, tools, initiatives, and future unknown entity types without redesigning the system each time.

## Final Entity Model

### What Is An Entity?

An Entity is any person, organization, initiative, place, service group, tool provider, educator, or support resource that wants a public Mental Smile presence.

An entity is not automatically trusted, verified, recommended, ranked, or endorsed. It is a published presence.

Examples:
- psychiatrist
- psychologist
- addiction specialist
- speech therapist
- behavioral specialist
- special education specialist
- addiction center
- mental health center
- speech center
- educational academy
- NGO
- charity
- initiative
- yoga instructor
- meditation coach
- energy therapy practitioner
- mental health tool provider
- future category not yet known

### What Is A Published Entity?

A Published Entity is an entity with enough public information to appear in discovery and have a public profile.

Publishing means:
- visible
- findable
- contactable
- understandable
- shareable

Publishing does not mean:
- verified
- approved as clinically superior
- recommended
- ranked
- contracted with Mental Smile
- available for booking through Mental Smile

### Always Existing Information

The simplest always-required information should be:
- display name
- entity type label
- short description
- location or service area
- contact method
- public profile status
- audience/language basics
- category tags
- visibility notice

These are enough for discovery and access.

### Optional Information

Optional fields should carry richness without blocking publication:
- long about text
- service list
- credentials or documents
- photos
- logo
- website
- social links
- WhatsApp
- email
- phone
- accessibility readiness
- languages
- audience groups
- working hours
- pricing note
- notices and disclaimers
- downloadable material preferences

Philosophy: required data should make the entity visible; optional data should make it clearer.

## Final Template Model

### Option A: Specialist / Center / Educational / Organization

Strength:
- familiar to users
- easier first release grouping

Weakness:
- quickly becomes rigid
- future entities need new buckets
- borderline entities cause category arguments
- duplicates old Commercial V1 complexity

### Option B: Single Universal Template

Strength:
- simplest foundation
- future-proof
- no new code for new entity types
- profile/dashboard remains the same idea

Weakness:
- can feel too generic if not supported by category lenses

### Option C: Hybrid Model

Strength:
- universal core with flexible presentation categories
- supports simplicity and user-friendly browsing
- avoids rigid provider/center split
- keeps future categories possible

Weakness:
- requires discipline: categories must not become separate systems.

### Recommendation

Choose **Option C: Hybrid Model**.

Commercial V2 should use one universal entity profile, then apply category lenses for display and discovery.

Core rule:
One entity system. Many labels. No separate architecture per profession.

Recommended category lenses:
- Individual Professional
- Center / Organization
- Education / Training
- Initiative / NGO
- Tool / Product
- Wellness / Complementary Practice
- Other / Emerging

These are discovery and presentation lenses only, not separate systems.

## Final Profile Model

The ideal public profile should be simple, readable, shareable, and printable.

### 1. Header

Purpose:
- first impression
- name
- type/category
- area
- primary contact action

Suggested content:
- name
- short tagline
- entity type label
- location/service area
- main image/logo if provided
- contact button
- visibility notice

### 2. About

Purpose:
- explain who they are in plain language

Suggested content:
- short description
- longer story optional
- languages
- audience-friendly statement

### 3. Services

Purpose:
- show what is offered without booking or ranking

Suggested content:
- service names
- short service descriptions
- delivery mode if relevant: online, in-person, hybrid

### 4. Audiences

Purpose:
- help people self-identify fit without recommendations

Suggested content:
- adults
- children
- families
- addiction recovery
- learning difficulties
- speech/language
- accessibility needs
- custom audience labels

### 5. Contact

Purpose:
- enable access

Suggested content:
- WhatsApp
- phone
- email
- website
- preferred contact note

Mental Smile should not intermediate contracts, booking, or payment.

### 6. Links

Purpose:
- extend discovery

Suggested content:
- website
- social pages
- published content links
- external portfolio

### 7. Documents

Purpose:
- let entities publish optional supporting material

Suggested content:
- certificates
- license documents
- brochures
- profile PDFs

Documents are published references, not platform verification by default.

### 8. Notices

Purpose:
- keep boundaries clear

Suggested content:
- "This profile is published for discovery."
- "Mental Smile does not rank or recommend providers."
- "Contact and service decisions happen outside Mental Smile unless a future approved tool says otherwise."

### Optional Additional Section: Publishing Assets

Purpose:
- show generated public materials made from the profile

Suggested content:
- PDF profile
- business card
- promotional post
- brochure

## Dashboard Philosophy

The dashboard should be the profile itself.

There should not be a separate complex dashboard if the profile can serve both public and owner needs.

### Public View

Public View shows:
- profile content
- contact actions
- services
- audiences
- links
- documents
- notices

Public View hides:
- edit controls
- publishing controls
- draft state
- internal status
- owner-only tools

### Owner View

Owner View is the same profile with management actions revealed.

Owner View shows:
- edit profile
- preview public profile
- manage media
- manage documents
- generate publishing materials
- visibility status
- missing content suggestions

Owner View should not create:
- booking management
- session management
- payments
- ranking controls
- recommendation controls
- verification hierarchy

Philosophy:
The owner manages the public presence, not an operational business backend.

## AI Creation System

The profile should become a publishing source.

### Data Coming From Profile

AI generation can use:
- name
- entity type
- about text
- services
- audiences
- location/service area
- contact methods
- links
- language preferences
- notices
- brand tone if provided

### What Should Be Generated

Commercial V2 can generate:
- CV/profile summary
- PDF public profile
- business card text/layout
- promotional post
- service brochure
- printable one-page introduction
- short Arabic/English descriptions
- accessibility-friendly simplified version

### What Should Be Editable

Entity owner should edit:
- final text
- selected tone
- selected language
- service wording
- brochure sections
- public contact wording
- image selection if media exists

### What Should Never Be Stored

Do not store:
- hidden AI prompts
- sensitive private notes
- user mental health information
- generated assumptions about quality or trust
- ranking language
- recommendation labels
- clinical claims not provided by the entity
- private drafts unless explicitly approved later

Rule:
AI helps publish what the entity says about itself; it does not invent authority.

## Final Discovery Model

Discovery should be browsing, filtering, and searching.

No ranking.
No recommendation.
No verification hierarchy.

### Browsing

Users can browse by:
- category lens
- location/service area
- audience
- service type
- accessibility readiness
- language
- online/in-person
- entity type

### Filtering

Filters should narrow choices without implying superiority.

Examples:
- "Arabic speaking"
- "Works with families"
- "Online available"
- "Accessible communication"
- "Addiction support"
- "Learning difficulties"

### Search

Search should match:
- name
- service words
- category tags
- location
- audience labels
- free text from profile

### Final Discovery Philosophy

Mental Smile helps users see available options.

It should not tell users who is best.

It should not sort by hidden trust, payment, sponsorship, or platform preference unless a future explicitly approved advertising system creates transparent labeling.

## Final Accessibility Model

Mental Smile should not rebuild accessibility tools.

It should make commercial profiles compatible with accessibility use.

### Deaf Users

Support:
- clear text descriptions
- WhatsApp/text-friendly contact labels
- video/sign-friendly availability field
- captions on published videos where applicable
- external assistive tool links through Accessibility/Library surfaces

### Blind Users

Support:
- semantic text-first profile structure
- meaningful labels
- alt text for images where provided
- simple page hierarchy
- external screen reader compatibility

### Low Literacy Users

Support:
- short descriptions
- plain language summary
- icons/categories
- optional simplified profile version
- generated easy-language brochure

### Elderly Users

Support:
- larger readable text
- clear contact actions
- low-clutter page layout
- phone/WhatsApp visibility

### Integration Philosophy

Accessibility tools should be linked and supported naturally:
- Google Translate
- screen readers
- live transcription tools
- text-to-speech tools
- captions
- browser accessibility features

Commercial V2 content should be structured so those tools work well.

## Library Relationship

### Library Contains

Library owns:
- educational content
- tools
- assessments
- VR prompts
- learning resources
- accessibility awareness
- public knowledge

### Commercial V2 Contains

Commercial V2 owns:
- published entities
- entity profiles
- entity services
- entity contact paths
- entity publishing materials

### Boundary

Library teaches and supports understanding.

Commercial V2 shows who/what exists and how to contact them.

Library content can link to Commercial V2 categories, but it should not rank or recommend specific entities.

Commercial V2 profiles can link to Library resources, but they should not become educational content systems.

## Future Expansion Score

| Test Case | New code required? | New forms required? | New systems required? | Result |
| --- | --- | --- | --- | --- |
| New provider type | No, if category labels are configurable | No, universal profile is enough | No | Pass |
| New center type | No | No | No | Pass |
| New NGO | No | No | No | Pass |
| New educational category | No | No | No | Pass |
| Future unknown category | No, if "Other / Emerging" exists | No | No | Pass |

Future expansion score: **9/10**

The only risk is category governance. If every new category becomes a special template, complexity returns.

## Recommended Foundation

Recommended Commercial V2 foundation:

**Universal Published Entity + Category Lenses + Profile-As-Dashboard + Discovery Without Ranking.**

Core decisions:
- one entity model
- one public profile structure
- owner view reveals management actions
- category lenses guide browsing
- AI generates publishing materials from profile data
- discovery uses filters/search only
- no ranking, recommendation, booking, payment, sessions, contracts, or verification authority
- Library remains knowledge/resources
- Commercial V2 remains published entities

## Final Verdict

Is the design future-proof? Yes.

Is it simpler than Commercial V1? Yes.

Can non-technical providers use it? Yes, if the profile editor stays plain-language and profile-first.

Does it support growth without architectural complexity? Yes, as long as new categories remain labels/lenses rather than new systems.

Recommended foundation: **HYBRID UNIVERSAL ENTITY MODEL**
