# Windows Backup Notes V1

Created: 2026-07-06

## User-Level Windows Backup Recommendations

1. Create a Windows restore point before major system or dependency changes.
2. Enable File History or Windows Backup for the project parent folder.
3. Copy the project folder to an external drive after verification.
4. Export important environment notes without secrets.
5. Save Firebase config references safely, but do not publish secrets.
6. Save the GitHub remote URL:

```powershell
git remote -v
```

7. Keep at least:
   - one local copy
   - one external drive copy
   - one cloud/GitHub copy if available

## Safety Notes

- Do not store passwords, API keys, service account JSON, or `.env` values in this documentation package.
- Do not edit the external backup directly.
- Use date-based backup folders.
- Verify a backup can be opened before deleting any local temporary files.

