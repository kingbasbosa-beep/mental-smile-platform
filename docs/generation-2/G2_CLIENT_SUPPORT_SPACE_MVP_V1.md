# G2 Client Support Space MVP V1

Date: 2026-07-07

Status: IMPLEMENTED_LOCAL_ONLY / BETA_READY_FOR_MANUAL_REVIEW

## Scope

Implement a short, safe, beta-only sharing space inside the existing client check-in flow.

Placement:

- Existing card/page: `طمنّا عليك`
- Screen file: `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart`
- Route: existing `/accessibility/checkin`
- New named route: NONE
- New room card: NONE
- Visibility gate: `supportSpaceEnabled == true` route argument.

This placement applies to client-facing versions that already open the shared `طمنّا عليك` page:

- Client Friend Mobile
- Premium Friend Mobile
- Client Friend Desktop
- Premium Friend Desktop

Specialist and center room openings of the shared check-in page do not enable the support space.

## User-Facing Name

مساحة المشاركة

## User-Facing Description

طمنّا عليك تبدأ بأسئلة بسيطة تساعدك تعبّر عن حالتك، وبعدها لو حابب تشارك رسالة قصيرة أو تشوف رسائل دعم من أصدقاء Mental Smile، تقدر تستخدم مساحة المشاركة.

## What It Is

- A short beta sharing prototype.
- A local-only way to write a brief supportive message.
- A local-only way to view recent shared messages during the app session.
- A safe placement after the existing wellbeing questions.

## What It Is Not

- It is not a therapy group.
- It is not a clinical intervention.
- It is not emergency support.
- It is not a chat.
- It does not include replies, likes, ranking, usernames, or private messaging.

## Runtime Placement

Inside `طمنّا عليك`, after the existing simple wellbeing questions, the page now shows:

Title:

ولو حابب تشارك...

Text:

لو حابب تسيب رسالة بسيطة، فكرة، إحساس، أو كلمة دعم لأصدقاء Mental Smile أثناء مرحلة الاختبار، تقدر تشارك من هنا.

Buttons:

- شارك برسالة
- شاهد المشاركات

Both buttons open `مساحة المشاركة` through an internal `MaterialPageRoute`.

## Storage Choice

The entry section is visible only when the existing check-in page receives `supportSpaceEnabled: true` from a client-facing room.

Storage: in-memory local session state only.

Backend: NONE

Firebase: NONE

Firestore: NONE

Collection planned if approved later:

`g2_client_support_space_messages`

Current local message shape:

- id
- text
- createdAt
- userType
- sourceScreen
- status
- isBeta

## Validation Rules

- Empty messages are blocked.
- More than 500 characters are blocked.
- More than 5 lines are blocked.
- A small local denylist blocks clearly unsafe wording.
- Blocked denylist messages show a warm safety message.

## Safety Rules Shown To User

- لا تكتب بياناتك الشخصية.
- لا تذكر أسماء أشخاص آخرين.
- لا تستخدم ألفاظ جارحة.
- لا تقدم نصائح طبية أو علاجية.
- لا تطلب مساعدة طارئة من هنا.
- إذا كنت في خطر أو تحتاج مساعدة فورية، تواصل مع جهة طوارئ أو شخص تثق به.

Confirmation checkbox:

قرأت القواعد وأوافق على المشاركة باحترام.

## Display Behavior

Display title:

مشاركات الأصدقاء

Display intro:

هنا تظهر مشاركات قصيرة من أصدقاء Mental Smile أثناء مرحلة الاختبار.

Behavior:

- Shows latest 50 messages.
- Shows message text.
- Shows simple local timestamp.
- Does not show real names.
- Does not allow replies.
- Does not allow likes.
- Does not allow private chat.
- Does not rank messages.

Empty state:

لسه مفيش مشاركات. كن أول من يترك رسالة بسيطة.

## Survey

Survey ID:

`G2_CLIENT_SUPPORT_SPACE_SURVEY_V1`

Runtime status:

DOCUMENTED_ONLY / NOT_WIRED

Storage:

Local-only when wired, `debugPrint` only.

Questions:

1. هل فكرة مساحة المشاركة مفيدة؟
2. هل القواعد واضحة؟
3. هل تشعر أن المساحة آمنة للتعبير؟
4. ما نوع المشاركات التي تفضل وجودها؟
5. هل تحب أن تكون المشاركات بدون أسماء أو باسم مستعار أو حسب اختيار المستخدم؟
6. ما الذي تقترحه لتحسين مساحة المشاركة؟

## Signals

Runtime signal backend: NONE

Current runtime debug output:

- `support_space_opened`
- `support_space_write_clicked`
- `support_space_message_submitted`
- `support_space_message_blocked`
- `support_space_messages_viewed`

Governance-only planned signals:

- `support_space_opened`
- `support_space_write_clicked`
- `support_space_message_submitted`
- `support_space_message_blocked`
- `support_space_messages_viewed`
- `support_space_survey_opened`
- `support_space_survey_submitted`

## Risks

- In-memory messages disappear on app reload.
- Denylist is intentionally small and not a substitute for moderation.
- No backend moderation workflow exists yet.
- Survey is documented but not wired in this placement update.

## Next Steps

- Owner reviews copy and safety stance.
- Decide whether to keep local-only for beta or approve a separated Firestore collection.
- Wire `G2_CLIENT_SUPPORT_SPACE_SURVEY_V1` only if the feature remains after beta review.
- Add a guide image only after the final UI copy is approved.

## Compliance

- New card created: NO
- Existing `طمنّا عليك` questions replaced: NO
- Therapy group wording used: NO
- Replies added: NO
- Likes added: NO
- Chat added: NO
- Usernames added: NO
- Firebase modified: NO
- Firestore modified: NO
- Routes modified: NO
- Route paths added: NO
- Route argument added for client-facing placement: YES
- Backend modified: NO
- Authentication modified: NO
- Specialist/center rooms enabled: NO
