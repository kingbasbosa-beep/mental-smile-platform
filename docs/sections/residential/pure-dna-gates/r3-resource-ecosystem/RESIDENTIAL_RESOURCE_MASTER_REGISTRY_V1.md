# RESIDENTIAL_RESOURCE_MASTER_REGISTRY_V1

Status: ACTIVE

Gate: R3

Runtime Status: NOT CONNECTED

Purpose: Register the full Residential operational resource ecosystem as governed assets.

---

## Resource Families

| Family | Includes | Master Registry |
|---|---|---|
| Applications | Website, YouTube, WhatsApp, external launcher channels | RESIDENTIAL_APPLICATION_MASTER_REGISTRY_V1 |
| Tools | Personal tools, accessibility tools, community tools, return tools | RESIDENTIAL_TOOL_MASTER_REGISTRY_V1 |
| Links | Personal links, accessibility links, check-in links, exit return link | RESIDENTIAL_LINK_MASTER_REGISTRY_V1 |
| Groups | Support/community contact groups and future community destinations | This registry |
| External Websites | Official and approved external resource URLs | This registry + link/app registries |
| Government Resources | Public institutional references when used in links/tools | This registry |
| NGOs | Non-government support/resource references when used in links/tools | This registry |
| Accessibility Resources | Assistive links/tools and accessibility support content | This registry + tool/link registries |
| Support Resources | Support, suggestion, return and complaint-adjacent resources | This registry |
| Educational Resources | YouTube/public content/library resource references | This registry |
| AI Resources | Future AI support/resource affordance placeholders only | This registry |

---

## Master Resource Cards

| Master Card | Resource ID | Resource Name | Category | Purpose | Reason for Existence | Residential Screens Using It | UI Card Reference | Signal Card Reference | Localization Reference | Accessibility Reference | Archive Magnet Reference | Review Cycle | Maintenance Owner | Strategic Importance | Replacement Strategy | Future Expansion Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R3-RES-MC-001 | RES-APPLICATIONS | Residential Applications | Application Group | Govern all external application/channel openings. | Keeps external channel usage controlled. | Splash, Client Room, Accessibility Room, Suggestions, Links/Tools | R2-UI-APP-001 to R2-UI-APP-005 | R2-SIG-064 to R2-SIG-068 | Existing app/link localization keys | AccessibilityGuideIcon + semantics | RB60 | Quarterly | Application UI Owner | High | Replace channels individually when official destinations change. | Future external channel registry. |
| R3-RES-MC-002 | RES-TOOLS | Residential Tools | Tool Group | Govern local support and accessibility tools. | Keeps tool entry points accountable. | Client Room, Accessibility Room, Tools, Community Tools | R2-UI-TOL-001 to R2-UI-TOL-007 | R2-SIG-057 to R2-SIG-063 | Existing tool localization keys | AccessibilityGuideIcon + semantics | RB50 | Quarterly | Residential / Accessibility Tools Owner | High | Replace individual tools with new governed tools module. | Future tool health registry. |
| R3-RES-MC-003 | RES-LINKS | Residential Links | Link Group | Govern all Residential link openings. | Links are operational assets, not loose UI copy. | Client Room, Accessibility Links, Check-in, Exit Portal | R2-UI-LNK-001 to R2-UI-LNK-008 | R2-SIG-069 to R2-SIG-076 | Existing link localization keys | AccessibilityGuideIcon + semantics | RB70 / RB130 | Quarterly | Residential Resource Owner | High | Replace broken links with approved alternatives. | Future link validation queue. |
| R3-RES-MC-004 | RES-GROUPS | Residential Communication Groups | Group / Community | Govern future support/community group references. | Prevent uncontrolled community destinations. | Suggestions, Community Tools, Support surfaces | R2-UI-MIX-002 / R2-UI-TOL-004 | R2-SIG-090 / R2-SIG-060 | Existing support/community keys | AccessibilityGuideIcon + semantics | RB120 / RB50 | Monthly | Support / Community Owner | High | Replace informal groups with official support channels. | Future group moderation governance. |
| R3-RES-MC-005 | RES-GOVERNMENT | Government Resources | Government Resource | Govern government/public institutional references. | Users may need trusted public institutional resources. | Accessibility Links / Tools when present | R2-UI-LNK-004 / R2-UI-TOL-003 | R2-SIG-072 / R2-SIG-059 | Existing resource keys | AccessibilityGuideIcon + semantics | RB70 / RB50 | Quarterly | Accessibility Resource Owner | Medium | Replace by country-specific registry. | Future Egyptian/government resource map. |
| R3-RES-MC-006 | RES-NGO | NGO Resources | NGO Resource | Govern NGO/public support references. | Supports community and accessibility referrals. | Accessibility Links / Tools when present | R2-UI-LNK-004 / R2-UI-TOL-003 | R2-SIG-072 / R2-SIG-059 | Existing resource keys | AccessibilityGuideIcon + semantics | RB70 / RB50 | Quarterly | Accessibility Resource Owner | Medium | Replace unverified NGO resources with verified entries. | Future NGO approval rules. |
| R3-RES-MC-007 | RES-ACCESSIBILITY | Accessibility Resources | Accessibility Resource | Govern accessibility-focused links, tools and guidance. | Accessibility is a core Mental Smile surface. | Accessibility Room, Links, Tools, Suggestions, Check-in | R2-UI-AUD-*, R2-UI-TOL-*, R2-UI-LNK-* | R2-SIG-039 to R2-SIG-076 | Accessibility localization keys | AccessibilityGuideIcon + semantics | RB40 / RB50 / RB70 | Monthly | Accessibility Owner | High | Replace with dedicated accessibility resource OS. | Future TTS/sign-language/readability packs. |
| R3-RES-MC-008 | RES-SUPPORT | Support Resources | Support Resource | Govern suggestions, support and complaint-adjacent paths. | Support paths must remain safe and auditable. | Suggestions, Check-in, Community Tools | R2-UI-MIX-001 / R2-UI-MIX-002 | R2-SIG-089 / R2-SIG-090 | Existing support localization keys | AccessibilityGuideIcon + semantics | RB110 / RB120 | Monthly | Support Owner | High | Replace WhatsApp-first path with governed intake later. | Future complaint/suggestion routing. |
| R3-RES-MC-009 | RES-EDUCATIONAL | Educational Resources | Education Resource | Govern educational and public learning destinations. | Supports safe learning without clinical replacement. | YouTube, Library links, Accessibility Links | R2-UI-APP-002/003, R2-UI-LNK-007 | R2-SIG-065/066/075 | Existing education/resource keys | AccessibilityGuideIcon + semantics | RB60 / RB70 | Quarterly | Content / Library Owner | High | Replace with curated public library cards. | Future educational taxonomy. |
| R3-RES-MC-010 | RES-AI | AI Resources | AI Resource Placeholder | Govern future AI support affordances only. | AI must remain bounded before runtime connection. | Audio/listen placeholders, prompt-intent future surfaces | R2-UI-AUD-* | R2-SIG-039 to R2-SIG-056 / future R.PR | applicationAudioSoon | AccessibilityGuideIcon + semantics | RB40 / RB140 | Owner review before runtime | Human-AI Governance Owner | High | Replace placeholder with approved AI provider flow only after runtime gates. | Future AI support, no execution now. |

---

## Validation

| Item | Count |
|---|---:|
| Resource families registered | 10 |
| Resource families with Master Cards | 10 |
| Missing resource cards | 0 |

Final Status: RESIDENTIAL_RESOURCE_MASTER_REGISTRY_CREATED

