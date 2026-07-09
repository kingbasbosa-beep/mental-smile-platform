# Generation 2 Tester Handoff V1

Date: 2026-07-06

## How To Access

Use the running Flutter web app and open:

- `/splash`
- `/g2/mobile/login-selection`
- `/commercial/access` for desktop provider access

## Screens To Test

| Screen | What to Test |
| --- | --- |
| G2 Splash | Mobile/Desktop/Language buttons, layout, route behavior. |
| Mobile Login Selection | Friends, Supporters, Back, Language, Daleel guide, survey. |
| Client Account Selection | `صديقي العميل`, `صديقي المميز`, Back, Daleel guide, survey. |
| Supporters Account Selection | `أخصائيين داعمين`, `مراكز داعمة`, Back, Daleel guide, survey. |
| Client Friend Room | Room cards, guide, survey, exit/back. |
| Premium Friend Room | Room cards, accessibility/usability guide, survey, exit/back. |
| Specialist Friend Room | Professional profile/library/tools cards, guide, survey. |
| Center Friend Room | Center profile/library/tools cards, guide, survey. |
| Specialist Login | Fields, password visibility, register link, guide, survey, auth. |
| Center Login | Fields, password visibility, register link, guide, survey, auth. |
| Commercial Access | Specialist/center/admin buttons, wide desktop Daleel guide/survey. |

## Buttons To Press

1. On `/splash`, press Mobile.
2. On Mobile Login Selection, press Friends.
3. On Client Account Selection, press `صديقي العميل`, return, then press `صديقي المميز`.
4. Return and press Supporters.
5. On Supporters Account Selection, press `أخصائيين داعمين`, return, then press `مراكز داعمة`.
6. On every screen with Daleel, open `فتح دليل الصفحة`, then open `رأيك يهمنا`, submit sample feedback.
7. Press back/exit controls and verify they return to the expected previous surface.

## Accounts To Create / Use

| Account Type | Needed For |
| --- | --- |
| Specialist test account | `/commercial/specialist/login`, specialist room protected route. |
| Center test account | `/commercial/center/login`, center room protected route. |
| Admin test account | `/commercial/admin/login` if admin flow is included in final testing. |

Do not use production/private client data during final testing.

## Feedback To Submit

Use Daleel surveys for:

- confusing labels
- unclear icons
- missing audio/help cues
- hard-to-tap buttons
- color/contrast issues
- route/back behavior confusion
- missing guide images
- any text overlap or layout clipping

## How To Report Bugs

For each issue, include:

- Screen name
- Route or how you got there
- Device/viewport size
- Browser
- Exact button/card tapped
- Expected result
- Actual result
- Screenshot if visual
- Console error if present

Known issue to verify after asset handoff:

- `supporters_account_selection_mobile_guide.png` was missing from `assets/branding/guides/` during inventory.

