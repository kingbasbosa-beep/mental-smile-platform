# First Runtime Write Firestore Failure Forensic V1

Operation: FIRST_RUNTIME_WRITE_FIRESTORE_FAILURE_FORENSIC

Date: 2026-07-02

Scope: Forensic only. Inspected only the requested Commercial V2 signal/presentation files, `lib/main.dart`, `lib/firebase_options.dart`, and `firestore.rules`. No code, rules, format, analyze, or tests were changed/run.

## Executive Finding

The Commercial V2 Library card path is wired to call the writer before navigation, and the local `firestore.rules` file appears to allow the exact first controlled document shape.

The most likely blocker in the inspected runtime is observability/control flow:

1. The write is started as fire-and-forget.
2. Navigation happens immediately after the signal emit.
3. Any Firestore/Firebase/rules/network exception is caught inside the writer and only sent to `debugPrint`.
4. Firebase init failure is also caught and only sent to `debugPrint`, while the app continues.

So the app can navigate correctly while the write fails silently from the user's perspective.

## Answers

Firebase initialized: UNKNOWN at runtime / YES in code path

- `lib/main.dart:13-16` executes `await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)`.
- `lib/main.dart:17-19` catches initialization failure and continues app startup.

Firebase initialized on web: YES in code path

- `lib/firebase_options.dart:18-21` returns `web` when `kIsWeb` is true.
- `lib/firebase_options.dart:49-55` sets web `projectId: 'mental-smile-platform'`.

Writer imported and used: YES

- `lib/features/commercial_v2_web/signals/commercial_v2_signal_emitter.dart:2` imports `commercial_v2_archive_signal_event_writer.dart`.
- `lib/features/commercial_v2_web/signals/commercial_v2_signal_emitter.dart:25` calls `CommercialV2ArchiveSignalEventWriter.writeFirstControlledSignal(payload)`.

Writer called when pressing Library card: YES, if the press is on the Commercial V2 showcase Library card

- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:79-86` emits before `Navigator.of(context).pushNamed(section.route)`.
- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:25-35` maps section id `library` to `CommercialV2SignalCode.openLibrary`.

Firestore write attempted: YES, if the Commercial V2 Library card is pressed and Firebase/Firestore runtime is available

- `lib/features/commercial_v2_web/signals/commercial_v2_archive_signal_event_writer.dart:19-24` filters for `CommercialV2SignalCode.openLibrary` and calls `_write(payload)`.
- `lib/features/commercial_v2_web/signals/commercial_v2_archive_signal_event_writer.dart:57-61` calls `.collection('archive_signal_events').doc(eventId).set(event)`.

`await` used before navigation: NO

- `CommercialV2SignalEmitter.emit(...)` returns `void`.
- `commercial_v2_signal_emitter.dart:25` does not await the writer.
- `commercial_v2_archive_signal_event_writer.dart:24` calls `_write(payload)` without `await`.
- `commercial_v2_web_showcase_page.dart:86` navigates immediately after emit.

Exception swallowed: YES

- `commercial_v2_archive_signal_event_writer.dart:62-67` catches all write errors and prints only debug output.
- `main.dart:17-19` catches Firebase initialization errors and prints only debug output.

Correct collection name: YES

- `commercial_v2_archive_signal_event_writer.dart:11` uses `archive_signal_events`.

Document id equals `event_id`: YES

- `commercial_v2_archive_signal_event_writer.dart:29-30` creates `eventId`.
- `commercial_v2_archive_signal_event_writer.dart:34` writes `'event_id': eventId`.
- `commercial_v2_archive_signal_event_writer.dart:60` uses `.doc(eventId)`.
- `firestore.rules:485` requires `request.resource.data.event_id == eventId`.

Rules likely rejecting: NO if the deployed rules match the inspected local `firestore.rules`

- `firestore.rules:507-510` allows create for `archive_signal_events` when `firstControlledArchiveSignalValid(eventId)` is true.
- `firestore.rules:483-504` matches the writer's fields and exact values.
- No `signedIn()` requirement exists in the inspected `archive_signal_events` create rule.

Wrong project risk: NO for web options in inspected code

- `firebase_options.dart:49-55` sets web project `mental-smile-platform`.

Firestore package imported and available in inspected runtime file: YES for import / UNKNOWN for `pubspec`

- `commercial_v2_archive_signal_event_writer.dart:1` imports `package:cloud_firestore/cloud_firestore.dart`.
- `pubspec.yaml` was not inspected because it was outside the requested inspection scope.

Browser console errors visible or expected: EXPECTED

- Expected if Firestore fails: `Commercial V2 archive signal write skipped safely: ...`
- Source: `commercial_v2_archive_signal_event_writer.dart:63-66`
- Expected if Firebase init fails: `Firebase init failed: ...`
- Source: `main.dart:17-19`

## Exact Suspected Blocker

Primary suspected blocker:

Fire-and-forget write with swallowed exception prevents visible failure reporting.

Exact files and lines:

- `lib/features/commercial_v2_web/signals/commercial_v2_archive_signal_event_writer.dart:19-24`
- `lib/features/commercial_v2_web/signals/commercial_v2_archive_signal_event_writer.dart:57-67`
- `lib/features/commercial_v2_web/signals/commercial_v2_signal_emitter.dart:12-26`
- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:79-86`

Secondary runtime risk:

Firebase initialization failures are swallowed, so the app can keep running without a usable Firebase app.

Exact file and lines:

- `lib/main.dart:13-19`

Rule rejection is not the leading suspect in the inspected files because the local rules match the writer payload and do not require authentication for this create.

## Minimal Safe Fix Recommendation

Do not broaden Firestore rules blindly.

Minimal safe fix path:

1. Make the first write return a `Future<bool>` or structured result.
2. Await only the first controlled Library write before navigation, with a short fail-safe timeout.
3. Keep navigation fail-safe: navigate even if the write fails.
4. Surface a temporary debug-only result for Owner testing, or log an explicit local status such as `write_attempted`, `write_success`, `write_failed_permission`, `write_failed_firebase_init`.
5. Keep the same collection, document id, fields, destination code, magnet code, privacy class, and retention class.

Recommended minimal code target for a future fix:

- `commercial_v2_archive_signal_event_writer.dart`
- `commercial_v2_signal_emitter.dart`
- `commercial_v2_web_showcase_page.dart`

No rules change is recommended unless browser console shows `permission-denied` while deployed rules are confirmed to match local `firestore.rules`.

## Final Verdict

FIRST_RUNTIME_WRITE_FIRESTORE_FAILURE_FORENSIC_COMPLETED
