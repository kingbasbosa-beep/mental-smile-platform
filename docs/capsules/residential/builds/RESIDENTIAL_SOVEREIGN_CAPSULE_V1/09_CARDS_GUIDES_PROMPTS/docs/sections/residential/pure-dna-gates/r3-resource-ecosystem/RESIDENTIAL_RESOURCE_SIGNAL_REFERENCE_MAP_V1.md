# RESIDENTIAL_RESOURCE_SIGNAL_REFERENCE_MAP_V1

Status: ACTIVE

Gate: R3

Runtime Status: NOT CONNECTED

Purpose: Connect each Residential operational resource family to its R2 Minimal Signal Card references.

---

## Signal Reference Map

| Resource Family | Resource IDs | Signal Codes | Minimal Signal Cards | Signal Family | Counted Action | Archive Magnet |
|---|---|---|---|---|---|---|
| Applications | R-APP-001 to R-APP-005 | R.Q.001.OPEN to R.Q.005.OPEN | R2-SIG-064 to R2-SIG-068 | External App Opening | Open external channel | RB60 |
| Tools | R-TOL-001 to R-TOL-007 | R.T.001.OPEN to R.T.007.OPEN | R2-SIG-057 to R2-SIG-063 | Tool Usage | Open / use tool | RB50 |
| Links | R-LNK-001 to R-LNK-008 | R.L.001.OPEN to R.L.008.OPEN | R2-SIG-069 to R2-SIG-076 | Link Opening | Open link/resource | RB70 / RB130 |
| Groups | RES-GROUPS | R.P.001.OPEN / R.T.004.OPEN | R2-SIG-090 / R2-SIG-060 | Complaint / Support + Tool Usage | Open support/community path | RB120 / RB50 |
| External Websites | RES-APPLICATIONS / RES-LINKS | R.Q.* / R.L.* | R2-SIG-064 to R2-SIG-076 | External App + Link Opening | Open destination | RB60 / RB70 |
| Government Resources | RES-GOVERNMENT | R.L.004.OPEN / R.T.003.OPEN | R2-SIG-072 / R2-SIG-059 | Link / Tool | Open resource | RB70 / RB50 |
| NGOs | RES-NGO | R.L.004.OPEN / R.T.003.OPEN | R2-SIG-072 / R2-SIG-059 | Link / Tool | Open resource | RB70 / RB50 |
| Accessibility Resources | RES-ACCESSIBILITY | R.A.*, R.T.*, R.L.* | R2-SIG-039 to R2-SIG-076 | Audio / Tool / Link | Request support / open resource | RB40 / RB50 / RB70 |
| Support Resources | RES-SUPPORT | R.G.001.SUBMIT / R.P.001.OPEN | R2-SIG-089 / R2-SIG-090 | Suggestion / Support | Submit or open support | RB110 / RB120 |
| Educational Resources | RES-EDUCATIONAL | R.Q.002/003.OPEN / R.L.007.OPEN | R2-SIG-065 / R2-SIG-066 / R2-SIG-075 | External App + Link Opening | Open educational/public resource | RB60 / RB70 |
| AI Resources | RES-AI | R.A.* / future R.PR | R2-SIG-039 to R2-SIG-056 / future prompt cards | Audio / Prompt Intent | Request support / future prompt intent | RB40 / RB140 |

---

## Validation

| Item | Count |
|---|---:|
| App signal references | 5 |
| Tool signal references | 7 |
| Link signal references | 8 |
| Resource family signal references | 10 |
| Missing signal references | 0 |

Final Status: RESIDENTIAL_RESOURCE_SIGNAL_REFERENCE_MAP_CREATED

