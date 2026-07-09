# G2 Backup Script README V1

Created: 2026-07-06

Script:

`tools/backup/create_g2_memory_package_backup.ps1`

## What It Does

- Creates a timestamped backup folder.
- Copies the G2 memory package.
- Copies `docs/generation-2`.
- Copies `assets/branding/guides`.
- Optionally creates a zip.
- Does not delete files.
- Does not copy `.git`, `build`, `.dart_tool`, or temp folders.

## Example

```powershell
powershell -ExecutionPolicy Bypass -File tools\backup\create_g2_memory_package_backup.ps1
```

With custom destination:

```powershell
powershell -ExecutionPolicy Bypass -File tools\backup\create_g2_memory_package_backup.ps1 -DestinationRoot "E:\Mental_Smile_Backups"
```

With zip:

```powershell
powershell -ExecutionPolicy Bypass -File tools\backup\create_g2_memory_package_backup.ps1 -CreateZip
```

## Restore

Copy the timestamped backup folder back into a safe workspace location. Review before overwriting active project files.

