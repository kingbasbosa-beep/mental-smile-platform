# External Drive README V1

Created: 2026-07-06

## Recommended External Structure

```text
Mental_Smile_Backups/
  2026-07-06_G2_Final_Testing/
    Memory_Package/
    Clean_Project_Backup/
    Windows_Backup_Notes/
```

## Simple Steps

1. Copy `backups/external-memory/Mental_Smile_G2_Memory_Package_V1/` to the external drive under `Memory_Package/`.
2. After build verification, copy the clean project backup under `Clean_Project_Backup/`.
3. Keep one zip and one normal folder.
4. Do not edit the external copy directly.
5. Restore by copying the external folder back into the workspace.
6. Keep date-based versions, for example `2026-07-06_G2_Final_Testing`.

## Restore Notes

- To restore memory only, copy `Memory_Package/` back into `backups/external-memory/`.
- To restore the full project, use the clean project backup zip/folder, not this memory package alone.
- Do not overwrite active work without checking `git status` first.

