# Capsule Materialization Policy V1

Operation: NEW_REPOSITORY_BIRTH_AND_ROLE_GOVERNANCE_V1

## Policy

Approved sovereign capsules are source packages.

They are not copied blindly and are not automatically current truth until an explicit materialization operation imports them.

## Materialization Requirements

Every capsule materialization must record:

- capsule name
- capsule version
- capsule location
- materialization target
- files imported
- files excluded
- reason for import
- owner decision if required
- runtime impact
- route impact
- Firebase impact
- asset impact
- verification result

## Prohibited Actions

- importing old repo directly
- copying legacy files without approval
- treating archive history as current truth
- mixing runtime with landing, website, or presentation
- silently changing Firebase or GitHub Pages behavior

## Eligible Targets

- `app/` for approved runtime materialization
- `landing/` for temporary landing source
- `website/` for future website material
- `presentation/` for technical/product presentation material
- `docs/materialization/` for materialization logs and maps
- `docs/capsules/` for capsule registry and import records
