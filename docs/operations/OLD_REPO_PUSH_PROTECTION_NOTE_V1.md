# Old Repository Push Protection Note V1

Date: 2026-07-08

This folder is the historical/full working tree:

`C:\mental_smile_workspace\app\mental-smile-platform`

It must not be pushed to the new clean repository.

This working tree contains dirty state, legacy history, runtime files, archive material, capsules, backups, generated files, deleted files, and long nested paths.

New clean repository work must happen in the separate clean folder:

`C:\mental_smile_workspace\repositories\mental-smile-platform-clean`

Do not run broad staging commands such as `git add .` from the historical/full working tree unless the owner explicitly asks for that exact action.

Result: OLD_REPO_PUSH_PROTECTION_NOTE_V1_CREATED
