# Clean Project Backup Plan V1

Created: 2026-07-06

Suggested tag: `g2-final-testing-clean-v1`

Suggested folder: `Mental_Smile_G2_Final_Testing_Clean_Backup_V1`

## Commands To Run Before Backup

Run manually from the project root:

```powershell
flutter clean
```

```powershell
flutter pub get
```

```powershell
dart format lib test
```

```powershell
flutter analyze
```

```powershell
flutter build web
```

```powershell
git status
```

```powershell
git diff --stat
```

## Backup Steps

1. Review verification output.
2. Commit the final clean state.
3. Tag the final testing version:

```powershell
git tag g2-final-testing-clean-v1
```

4. Create a clean backup folder named `Mental_Smile_G2_Final_Testing_Clean_Backup_V1`.
5. Zip the project excluding:
   - `.git`
   - `build`
   - `.dart_tool`
   - `.idea`
   - `.vscode` if not needed
   - `node_modules`
   - temporary logs
6. Copy the zip to the external drive.
7. Copy `backups/external-memory/Mental_Smile_G2_Memory_Package_V1/` to the external drive.
8. Keep one normal folder and one zip copy.

## Do Not Include

- Secrets
- Private environment variables
- Local machine credentials
- Temporary build caches

