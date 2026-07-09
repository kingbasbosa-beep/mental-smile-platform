# COMMERCIAL V2 PROFILE ENGINE DESIGN

Mode: DESIGN ONLY  
Runtime effect: none  
Implementation authority: none  
Commercial V1 state: frozen and archived  
Foundation: HYBRID UNIVERSAL ENTITY MODEL

## Profile Engine Summary

Commercial V2 should be built around one idea: the profile is the product. The public profile is the market-facing presence, and the owner dashboard is the same profile with management actions revealed. The system should collect only enough structured information to publish, discover, contact, and generate reusable materials. It should not become a booking, payment, verification, ranking, recommendation, contract, or session-management system.

## Final Profile Flow

### Current Proposal

Step 1:
- create account
- email
- phone
- password

Step 2:
- create profile

### Evaluation

This is close, but it can be simpler if profile creation starts before the account feels heavy.

The main risk in asking for account first is psychological friction. A user may want to understand what they are publishing before committing.

The main risk in asking for profile first is losing drafts if no account exists.

### Recommended Flow

Use a three-state flow:

1. Start Profile
   - choose entity display name
   - choose broad entity lens
   - write one short description

2. Create Account To Save
   - email
   - phone
   - password

3. Complete And Publish
   - add required contact method
   - add service area/location
   - preview
   - publish or keep draft

### Why This Is Simpler

The user begins with the thing they care about: their public presence.

Account creation becomes a save step, not the emotional entry gate.

Final rule:
No profile should be public until the minimum useful public fields exist.

## Final Profile Structure

### Mandatory Fields Only

Minimum information required to create a useful profile:

- entity display name
- broad entity lens
- short public description
- primary category tag
- service area or location
- at least one contact method
- profile language
- public visibility state
- basic notice acceptance

### Mandatory Field Philosophy

Mandatory means:
- necessary for public understanding
- necessary for discovery
- necessary for contact
- necessary for boundary clarity

Mandatory does not mean:
- credentials
- certificates
- pricing
- full biography
- full service catalog
- documents
- media
- social links
- working hours

Those can remain optional because the system is publishing and discovery, not verification or operations.

## Custom Sections

### Proposal

The profile includes core fields plus custom sections.

Each custom section contains:
- title
- content

Examples:
- certificates
- diplomas
- experience
- work history
- research
- publications
- courses
- special notes

### Should Custom Sections Be Unlimited?

No. Unlimited sections sound flexible, but they create clutter, performance risk, low-quality pages, and confusing public profiles.

### Recommended Model

Allow custom sections, but with practical limits:

- maximum active custom sections: 8
- maximum title length: short, label-like
- maximum content length: enough for a paragraph or compact list
- section order: user-controlled
- section visibility: public or hidden
- suggested section templates: available as examples only

Recommended section templates:
- Certificates
- Experience
- Education
- Publications
- Courses
- Research
- Methods
- Special Notes

The user can rename or ignore templates.

### Philosophy

Custom sections should extend the profile, not replace the core structure.

If a user needs more than 8 custom sections, the profile is becoming a website, not a discovery profile.

## Public Profile Structure

Recommended public profile layout:

1. Cover
   - optional cover image
   - fallback visual style if no image

2. Identity Header
   - profile image or logo
   - entity display name
   - broad entity lens
   - primary category tag
   - service area/location
   - short description
   - primary contact action

3. About
   - plain-language description
   - what the entity does
   - who it may help

4. Services
   - compact list of offered services
   - optional delivery mode: online, in-person, hybrid

5. Audiences
   - audience labels
   - age groups or support groups if relevant

6. Contact
   - primary contact method
   - optional secondary contact methods
   - preferred contact note

7. Links
   - website
   - social links
   - external portfolio/content links

8. Custom Sections
   - user-created public sections
   - displayed after core trust and access content

9. Documents
   - optional documents or brochures
   - clearly labeled as entity-provided material

10. Notices
   - Mental Smile does not verify, rank, recommend, book, or manage payments
   - profile is published for visibility and discovery

## Final Owner Experience

Owner view should be identical to public profile, with management actions added.

### Public View

Public users see:
- profile content
- contact actions
- links
- documents
- notices

Public users do not see:
- edit tools
- generation tools
- draft controls
- internal status labels

### Owner View

Profile owner sees the same profile plus:

- Edit Profile
- Preview Public View
- Generate PDF
- Generate CV
- Generate Business Card
- Generate Promotional Post
- Generate Brochure
- Publish
- Unpublish
- Manage Custom Sections
- Manage Contact Methods
- Manage Documents

### Regenerate Profile

The action should not be called "Regenerate Profile" as a primary button because it sounds destructive.

Recommended label:
- Create New Version

Secondary label:
- Regenerate With AI

This should only appear inside owner management actions.

### Actions To Avoid

Do not add:
- booking settings
- payment settings
- ranking controls
- verification badge controls
- recommendation controls
- contract management
- session management

## Final Regeneration Flow

### Proposed Flow

Start Regeneration  
Old Profile remains active  
Create New Profile  
Preview  
Publish New Version  
Old Profile archived

### Evaluation

This is the safest model, but the wording should avoid anxiety.

### Recommended Flow

1. Create New Version
2. Current public profile remains live
3. New version opens as private draft
4. Owner edits or uses AI assist
5. Owner previews public version
6. Owner publishes new version
7. Previous version becomes historical profile version
8. Owner may restore previous version if approved later

### Safety Rules

- never overwrite the live profile directly
- never unpublish the live profile during draft creation
- never auto-publish AI text
- never delete old profile versions in the creation flow
- never expose draft content publicly

### Simplest Versioning Philosophy

One live profile.

One editable draft.

Historical versions are reference only.

## AI Generation Layer

### What Should Be Generated

From profile data, the system can generate:

- public profile polish
- CV
- PDF profile
- business card
- promotional post
- service brochure
- printable one-page profile
- simplified easy-language version
- Arabic/English profile summary
- short social media caption

### What Should Be Editable

The owner should edit:

- final generated text
- tone
- language
- service wording
- brochure sections
- post caption
- contact wording
- visual template selection
- document title

### What Should Never Be Stored

Never store:

- hidden AI prompts
- private mental health details of clients
- private conversations
- inferred competence scores
- inferred trust scores
- recommendation statements
- ranking language
- verification claims
- generated clinical claims not provided by the owner
- raw failed generations unless explicitly approved for debugging later

### AI Principle

AI is a publishing assistant.

AI must not become an authority engine.

AI helps the entity say what it already wants to say more clearly.

## Final Accessibility Model

Commercial V2 should not create a separate accessibility system.

Accessibility should be embedded in the profile creation experience.

### Field Guidance

Every field should explain itself with:

- plain label
- short help text
- example answer
- optional visual icon
- optional audio guidance placeholder

Example:

Field: Short Description  
Help: Write one simple sentence about what you provide.  
Example: "I provide speech therapy sessions for children and families."

### Deaf Users

Support:
- visual hints
- plain text instructions
- sign-friendly contact label
- video-friendly service label where relevant

### Blind Users

Support:
- semantic field order
- clear labels
- screen-reader-friendly help text
- no image-only controls

### Low Literacy Users

Support:
- examples
- short field descriptions
- simple-language mode
- optional AI rewrite into clearer text

### Elderly Users

Support:
- large text mode
- low-clutter forms
- clear next button
- clear save state

### Accessibility Professionals

Support:
- field for accessibility services
- audience tags
- accessible communication preferences
- documents and links for resources

### Core Rule

Every creator sees the same system.

Accessibility is guidance and clarity inside the same flow, not a separate product.

## Final Community Model

Mental Smile does not build chat, messaging, groups, or community platforms inside Commercial V2.

Official communities exist externally.

Examples:
- Professionals Group
- Centers Group
- Clients Community
- Supervisors Community
- Complaints & Support

### How Communities Appear Inside Owner Dashboard

Owner view may show a simple Community Access section:

- Professionals Group
- Centers Group
- Clients Community
- Supervisors Community
- Complaints & Support

Each item should be:
- clearly external
- opened outside the app/site
- labeled by purpose
- not treated as official platform messaging

### Community Boundaries

Commercial V2 should not store:
- group messages
- chat history
- private disputes
- moderation logs
- community membership details unless explicitly approved later

### Philosophy

Communities support humans.

Commercial V2 publishes entities.

The two should connect lightly without merging.

## Final Data Model

This is a design data model, not a technical schema.

### Minimum Sustainable Data Footprint

Store only what is needed to publish and manage a profile:

- account identity needed for owner access
- entity display name
- broad entity lens
- category tags
- short description
- about text
- service area/location
- contact methods chosen for publication
- services
- audiences
- links
- custom sections
- documents chosen for publication
- visibility state
- profile version state
- notices acceptance
- accessibility-friendly communication labels

### Data To Keep Optional

- cover image
- profile image/logo
- certificates
- credentials
- working hours
- pricing note
- social links
- generated documents
- generated posts
- additional languages

### Data To Avoid

- client private information
- booking history
- session history
- payments
- contracts
- provider ranking scores
- recommendation scores
- hidden verification scores
- private AI reasoning
- community chat logs
- unnecessary personal identity details

### Data Minimization Principle

If the user can simply publish it as public profile content, do not turn it into a complex operational field.

If Mental Smile does not act on it, do not store it as structured operational data.

If it creates authority, ranking, or verification implications, avoid it unless Owner approves a future doctrine.

## Final Scores

Simplicity score: **9/10**

Reason: one profile, one owner view, optional sections, no operational backend.

Future expansion score: **9/10**

Reason: custom sections and category lenses can absorb new professions, organizations, tools, and future unknown categories.

Implementation readiness score: **7/10**

Reason: product model is clear, but implementation should not start until Owner approves:
- final mandatory fields
- maximum custom section limits
- community link policy
- AI generation boundaries
- publication/versioning language

## Final Verdict

Commercial V2 Profile Engine should be:

**Profile-first, universal, editable, accessible, AI-assisted, and low-data.**

Recommended operating sentence:

Create your profile. Publish your presence. Generate your materials. Be discovered.

The system should remain a publishing and discovery engine, not a business operations platform.
