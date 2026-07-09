# Commercial V2 Navigation Graph V1

Date: 2026-07-02
Mode: Investigation only

## Primary Graph

```text
Direct URL or Admin TV SEC-CV2
  -> /commercial-v2/web
  -> CommercialV2WebShowcasePage
      -> Library card
          -> emit CV2_SIG_OPEN_LIBRARY
          -> aggregate locally
          -> attempt archive_signal_events write
          -> /web/library
          -> LibraryPage
              -> Specialists provider card
                  -> /library/providers/specialists
                  -> LibrarySpecialistsPage
                  -> specialist branch routes
                  -> LibraryProviderBranchPage
              -> Centers provider card
                  -> /library/providers/centers
                  -> LibraryCentersPage
                  -> center branch routes
                  -> LibraryProviderBranchPage
      -> Specialists card
          -> emit CV2_SIG_OPEN_SPECIALISTS
          -> aggregate locally
          -> /library/providers/specialists
      -> Centers card
          -> emit CV2_SIG_OPEN_CENTERS
          -> aggregate locally
          -> /library/providers/centers
```

## Secondary Entry Paths

```text
Admin Operations Room
  -> SEC-LIB -> /web/library
  -> SEC-LIB-SP -> /library/providers/specialists
  -> SEC-LIB-CTR -> /library/providers/centers
  -> SEC-CV2 -> /commercial-v2/web
  -> SEC-CV2-REG-SP -> ROUTE_PENDING
  -> SEC-CV2-REG-CTR -> ROUTE_PENDING

LibraryPage
  -> provider content cards
  -> Specialists / Centers

Accessibility Check-In
  -> Specialists / Centers

Support Entry
  -> Specialists / Centers

[S] Surface Index or direct URL
  -> /s/city
  -> SCityDistrictPage
      -> /s/city/library
      -> /s/city/providers
      -> /s/city/centers
      -> /s/city/services
      -> /s/city/tools
      -> /s/city/organizations
      -> /s/city/programs
      -> /s/city/marketplace
      -> SWebSurfacePage public discovery skeletons
```

## Removed Legacy Placeholder Paths

```text
/commercial-v2/web/library
/commercial-v2/web/specialists
/commercial-v2/web/centers
```

No active route constants or router cases were found for these paths in the inspected code.
