# G2 Splash Owner Notes V1

## What Changed

The first G2 Splash is now device/display selection only.

- **Sequence**: Splash -> Device/display choice -> Mobile identity selection or legacy Splash.
- **Splash Choice**: Mobile, Desktop/Tablet, Language.
- **First Splash Count**: Three choices only.

## Removed From First Splash

- Friend / `صديق` button removed.
- Supporter / `داعم صديق` button removed.
- Supporter registration-first rule belongs to the Mobile identity flow, not the first Splash.

## What Stayed

The old splash still exists and is reachable from the Desktop button.

## Temporary Route Notes

The Mobile button routes to `/g2/mobile/login-selection`.
The `/g2/mobile/client` route remains registered as a temporary Mobile Lite client target.

## Validation Summary

- New Splash opens on app start: YES by route mapping
- Old Splash still available from Desktop button: YES
- Three buttons only: YES
- Friend button removed from first Splash: YES
- Supporter button removed from first Splash: YES
- Mobile button opens Login Selection: YES by route mapping
- Mobile background used: YES
- Tablet background used/documented: YES
- Arabic labels visible: YES
- Headphones/audio icon added to labels: YES
- Firebase changed: NO intentional changes
- Firestore changed: NO intentional changes
- Signals changed: NO intentional changes
- Archive runtime changed: NO intentional changes
- Capsules changed: NO intentional changes
- Broken routes: expected 0, manual verification pending
