# Archive Intake Pipeline V1

Status: ACTIVE
Date: 2026-07-02

## Pipeline

```mermaid
flowchart TD
  A["Incoming Signal / Package"] --> B["Archive Intake"]
  B --> C["Code Gate"]
  C --> D["Language Guard"]
  D --> E["Package Validation"]
  E --> F["Destination Validation"]
  F --> G["Archive Inbox"]
  G --> H["Destination Routing"]
  H --> I["Future Aggregation"]

  C -- "unknown code" --> Q["Quarantine Package"]
  D -- "grammar/language failure" --> Q
  E -- "invalid package shape" --> Q
  F -- "unknown or rejecting destination" --> Q
  Q --> R["Owner Review"]
```

## Current Boundary

The active foundation ends at Archive Inbox and destination-resolution doctrine. Destination routing and aggregation are future extension points.

## Required Stage Order

1. Code Authority
2. Language Guard
3. Package Shape
4. Destination Exists
5. Destination Accepts Signal
6. Privacy Class
7. Retention Class
8. Archive Inbox

