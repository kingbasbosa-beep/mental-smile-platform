# LIBRARY CONTENT OWNERSHIP DOCTRINE V1

Operation ID: OP-LIBRARY-CONSTITUTION-AND-GOVERNANCE-BLOCK-V1

Status: ACTIVE_LIBRARY_DOCTRINE

Runtime effect: none

## Rule

Every Library content item must have ownership metadata before it becomes active Library content.

## Ownership Types

Allowed ownership types:

- Mental Smile Original;
- Mental Smile AI-assisted Original;
- Licensed Content;
- Partner Owned;
- Public Resource;
- Government Resource;
- Association Resource;
- Educational Resource;
- External Reference Only.

## Mandatory Metadata

Each content item must record:

- Content ID;
- Title;
- Type;
- Owner;
- Ownership Type;
- License Type;
- Source URL if external;
- Author / Publisher;
- Created By;
- Imported By;
- Published By;
- Prompt Attached if generated here;
- Review Status;
- Visibility Status;
- Allowed Use;
- Forbidden Use;
- Last Review.

## Prompt Ownership Rule

Any content created by Mental Smile using AI must have:

- original prompt;
- prompt version;
- generation purpose;
- reviewer;
- review status;
- ownership statement;
- safety notes.

No AI-generated Library content may exist without a prompt card.

## Card Enforcement

Ownership metadata must be represented in a Library Content Card.

External content requires a Source Card.

Mental Smile original or AI-assisted content requires a Prompt Card.

Reference card guides:

- `cards/LIBRARY_CONTENT_CARD_TEMPLATE_V1.md`
- `cards/LIBRARY_SOURCE_CARD_GUIDE_V1.md`
- `cards/LIBRARY_PROMPT_CARD_GUIDE_V1.md`

## Client Contribution Rule

Clients cannot upload content directly into the Library.

Client inputs are limited to:

- suggested topic;
- suggested link;
- suggested resource;
- content request.

These inputs are not Library content until Mental Smile reviews and approves them.

## External Reference Rule

External resources may be linked, but the Library must not imply ownership unless the ownership record says so.

External Reference Only content must retain source attribution and allowed-use boundaries.
