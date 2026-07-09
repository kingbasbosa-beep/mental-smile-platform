# GitHub Branch Responsibility Matrix V1

Status: ACTIVE_GOVERNANCE_FOUNDATION
Date: 2026-07-08
Scope: Intended branch responsibilities

| Branch | Purpose | Allowed Contents | Forbidden Contents | Current Status | Future Decision |
|---|---|---|---|---|---|
| `main` | Stable final documentation and stable governance truth | Final governance docs, public technical docs, stable release declarations, platform state summaries | Active experimental runtime work, outdated landing, temporary deployment output, old history philosophy as current truth | Remote default branch exists; older than current development branch | Govern as stable documentation/governance branch |
| `post-separation-pure-dna-v1` | Active work branch | Active runtime, active docs, current governance operations, temporary publishing workflow source | Unlabeled stale product identity, permanent history dump | Current working branch | Continue as active development branch until owner changes active branch |
| `gh-pages` | Temporary public web publishing only | Generated `build/web`, `.nojekyll` | Docs, source code, archive, README philosophy, `public-landing`, old static website | Target branch for GitHub Pages workflow | Keep as generated output branch only |
| `ai-lab` | Lab/legacy review branch | Experimental or historical audit material | Current production identity unless revalidated | Remote branch exists; older lab/audit state | Treat as legacy/lab until owner reclassifies |
| `codex/*` | Task-specific work branches | Focused task changes, experiments, reviewable units | Permanent source of truth, unmerged production identity | Multiple remote Codex branches exist | Treat as task branches, not current truth |
| Future history repo branches | Historical memory only | Old reports, retired systems, frozen decisions, old landing packages, recovery material | Active runtime, active publishing, current landing page | Planned model, not created here | Move historical memory only after explicit owner approval |

## Branch Interpretation Rules

- Do not infer current product truth from `gh-pages`.
- Do not infer current product truth from `main` if active development has moved ahead.
- Do not infer current product truth from `ai-lab` or `codex/*`.
- Use active governance reports and current runtime files to establish current truth.
- Treat branch names as role indicators only when the governance model confirms the role.

## Final Verdict

GITHUB_BRANCH_RESPONSIBILITY_MATRIX_V1_ACTIVE
