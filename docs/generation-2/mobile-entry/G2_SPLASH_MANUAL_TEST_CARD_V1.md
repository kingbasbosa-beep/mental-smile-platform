# G2 Splash Manual Test Card V1

## Manual Checks

| Check | Expected result |
| --- | --- |
| Open app normally | New G2 splash appears |
| Open `/` | New G2 splash appears |
| Open `/splash` | New G2 splash appears |
| Tap Mobile | Opens `/g2/mobile/login-selection` |
| Direct `#/g2/mobile/login-selection` | Opens G2 Login Selection |
| Tap Desktop | Opens old splash through `/legacy/splash` |
| Tap Language | Opens Arabic/English selector |
| Count visible main buttons (Splash) | Three buttons only |
| Search for Friend / `صديق` on first Splash | Not visible |
| Search for Supporter / `داعم صديق` on first Splash | Not visible |
| Friend visible on Login Selection | Visible |
| Supporter visible on Login Selection | Visible |
| Search for Start/Yalla button | No sixth start button |
| Phone portrait | Uses mobile background |
| Tablet/desktop width | Uses tablet background |
| Labels | Arabic labels visible with audio icon |

## Deferred Identity Rule

Supporter registration-first behavior belongs to the Mobile identity flow, not the first Splash.

## Guardrails

Confirm no changes were made to:

- Firebase
- Firestore
- Signals
- Archive runtime
- Capsules

## Owner Command Note

Static command validation was intentionally stopped after owner instruction. Owner will run manual checks.
