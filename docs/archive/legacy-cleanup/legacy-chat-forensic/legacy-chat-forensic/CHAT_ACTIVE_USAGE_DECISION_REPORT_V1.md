# CHAT_ACTIVE_USAGE_DECISION_REPORT_V1

Decision: LEGACY_SUPPORT_CHAT

Answers:

1. Is `ChatPage` reachable from an active route?
   - NO after this operation.

2. Is `/chat` registered in `app_router`?
   - NO after this operation.

3. Which screens navigate to `/chat`?
   - None after this operation.

4. Is it used by current Residential?
   - NO.

5. Is it used by current Library?
   - NO.

6. Is it used by provider/center display pages?
   - NO.

7. Is it only a legacy support dependency?
   - YES.

8. Are current analyze errors caused by keeping a legacy file under `lib`?
   - YES. `chat_page.dart` remains under `lib`, so analyzer can still parse it even when detached from active routing.

9. Can the route be safely detached from active routing?
   - YES. Done.

10. If detached, what replaces it?
   - Existing support entry uses `Routes.supportIssueSelector`.
   - Direct `/chat` has no active replacement route because the old chat product surface is retired.

Remaining Owner Decision:

Decide whether to move the legacy chat folder out of `lib/` into archive so analyzer no longer scans legacy implementation files.
