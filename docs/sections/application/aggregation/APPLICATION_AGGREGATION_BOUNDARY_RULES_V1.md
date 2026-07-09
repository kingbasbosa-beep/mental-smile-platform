# APPLICATION AGGREGATION BOUNDARY RULES V1

Operation ID: OP-APPLICATION-AGGREGATION-POINT-FOUNDATION-CLEAN-V1

Status: FOUNDATION_ONLY

## Rules

1. Application aggregation is section-local.

2. Application aggregation does not send data to Administrative yet.

3. Application aggregation does not send data to Monitoring yet.

4. Application aggregation does not store private user content.

5. Application aggregation does not store identity.

6. Application aggregation does not store phone, email, notebook text, suggestion body, check-in body, or uploaded image.

7. Application aggregation only summarizes counts and status.

8. Old pipes may be reused only as infrastructure if clean.

9. Old screen-based pipes are not trusted.

10. Unknown producers or consumers are ARCHIVE_ONLY or OUT_OF_SCOPE.

11. No runtime connection is allowed until the aggregation point itself is fully certified.

12. Application aggregation is not analytics, monitoring, recommendation, or decision infrastructure.

13. Application aggregation may only collect, summarize, and prepare dispatch copies.

14. Application aggregation must never analyze, decide, classify, recommend, alert, or intervene.

15. Dispatch is manual and operator-authorized only; dispatch timing is operational policy, not aggregation logic.

16. Complaint summaries must not store complaint text, evidence, personal names, phone numbers, emails, or legal/medical details.

17. Complaint-related summary categories, if approved later, may only count platform-related issue categories.

18. No direct Legal Governance output exists from Application Aggregation.

19. Complaint/legal/professional matters may reach Legal Governance later only through Archive or a separately approved governance flow.

20. Operational buckets are limited to hourly, manual dispatch range, daily rollup-ready, and weekly rollup-ready counters.

21. WhatsApp-related aggregation may count only open/click events, never message body or destination phone details.

## Reuse Rule

Allowed later, after approval:

- use generic aggregate model ideas;
- use daily/weekly window ideas;
- use summary contract style;
- use privacy-safe key construction.

Not allowed now:

- connecting `CleanSignalRuntime`;
- extending Monitoring adapters;
- creating Firestore aggregate collections;
- sending Application summaries to Administrative;
- storing raw event payloads.
- transforming summary reports differently for Archive and Strategic Planning.
- automatic dispatch.

## Forbidden Payload Rule

Never aggregate:

- phone;
- email;
- password;
- auth token;
- uid where avoidable;
- uploaded image data;
- notebook text;
- selected motivational sentence text;
- suggestion body;
- check-in answers;
- WhatsApp message body;
- diagnosis;
- booking/payment/case data.
- complaint text;
- complaint evidence;
- legal details;
- professional misconduct details;
- criminal complaint details.
- WhatsApp message body;
- destination phone details.

## Dual Output Boundary

When summary dispatch is approved in a future runtime operation, every generated summary package must produce two identical outputs:

- Archive Receiver Copy
- Strategic Planning Receiver Copy

Application Aggregation Point must not transform, interpret, rank, or analyze the package for either receiver.

Final Verdict:

APPLICATION_AGGREGATION_BOUNDARY_RULES_CREATED
