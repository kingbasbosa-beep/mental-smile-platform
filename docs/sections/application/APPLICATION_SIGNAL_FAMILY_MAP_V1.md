# APPLICATION SIGNAL FAMILY MAP V1

Operation ID: OP-LIBRARY-WARNINGS-AND-APPLICATION-AGGREGATION-DISCOVERY-V1

Status: PLANNED_ONLY

Implementation status for all families:

NOT_IMPLEMENTED

## Signal Family Map

| Signal Family | Producer | Summary Target | Privacy Level | Allowed Aggregation | Forbidden Payload | Future Administrative Destination | Implementation Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Entry/Auth signals | Unified Start / Entry Auth surfaces | Application Aggregation Point | Section summary only | Counts for start opened, login attempt category, create account entry | email, phone, password, uid, auth error details that identify a user | NONE until separately approved | NOT_IMPLEMENTED |
| Splash signals | Splash buttons and language toggle | Application Aggregation Point | Section summary only | Button click counts, language toggle counts | user identity, device fingerprint, session profile | NONE until separately approved | NOT_IMPLEMENTED |
| Unified Start signals | Commercial V2 start entry as Application gateway | Application Aggregation Point | Gateway summary only | Entry route opened, submit action category | email, phone, password, auth tokens | NONE until separately approved | NOT_IMPLEMENTED |
| Client Room signals | Client Room controls | Application Aggregation Point | Session-only summary | Room opened count, tool opened count, local control click count | uploaded image bytes, notebook text, personal answers | NONE until separately approved | NOT_IMPLEMENTED |
| Accessibility Room signals | Accessibility Room cards and controls | Application Aggregation Point | Session-only summary | Card opened count, resource page opened count | suggestion text, WhatsApp message content, personal needs | NONE until separately approved | NOT_IMPLEMENTED |
| Residential Exit signals | Residential Exit Social Links page | Application Aggregation Point | Destination intent summary | Exit page opened, official link category clicked | phone number, message body, account identity | NONE until separately approved | NOT_IMPLEMENTED |
| Links Card signals | Quick Access Links Card | Application Aggregation Point | Link category summary | Category opened, external link category clicked | exact user identity, saved link history, personal favorites | NONE until separately approved | NOT_IMPLEMENTED |
| Tools Card signals | Quick Access / Accessibility Tools cards | Application Aggregation Point | Tool category summary | Functional category opened, external tool clicked | disability labels, user classification, stored preferences | NONE until separately approved | NOT_IMPLEMENTED |
| Notebook/Feather signals | Feather Tool and notebook display | Application Aggregation Point | Local session summary | Feather opened, motivational sentence selected count | selected sentence text, personal reflection text, client profile | NONE until separately approved | NOT_IMPLEMENTED |
| Localization signals | Language toggles and localization coverage checks | Application Aggregation Point | Coverage summary | language toggle counts, missing-label counts | user identity, text input, private content | NONE until separately approved | NOT_IMPLEMENTED |
| Complaint guidance signals | Safety/Complaint guidance placement | Application Aggregation Point | Category summary only | complaint guidance opened, official authority guidance opened, platform contact clicked, complaint category selected count | complaint text, legal conclusion, names, phone, email, evidence, user identity | NONE until separately approved | NOT_IMPLEMENTED |
| WhatsApp opened signals | Residential Exit / platform support contact actions | Application Aggregation Point | Contact action summary only | WhatsApp opened/clicked count | message body, destination phone, user identity, complaint narrative | NONE until separately approved | NOT_IMPLEMENTED |

## No Connection Rule

This map is conceptual only.

Do not create:

- runtime aggregation;
- monitoring connection;
- Administrative connection;
- Firestore collections;
- Firebase rules;
- signal emitters;
- signal storage.

Final Verdict:

APPLICATION_SIGNAL_FAMILY_MAP_CREATED_PLANNED_ONLY
