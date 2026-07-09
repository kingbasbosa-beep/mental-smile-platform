# APPLICATION_INTERNAL_NETWORK_MAP_V1

Status: COMPLETED

## Internal Network Map

| Button / Card | Action / Route | Signal | Local Handler | Aggregation Point | Archive Destination | Summary Output | Strategic / Owner / Monitoring | Chain Status |
|---|---|---|---|---|---|---|---|---|
| Splash Quick Access | `/client/room` | Expected `splash_button_clicked` | Navigator | Application Aggregation Point | Application route summary | Splash button counts | Strategic/Owner future summary | Missing signal |
| Splash Accessibility | `/accessibility/room` | Expected `splash_button_clicked` | Navigator | Application Aggregation Point | Application route summary | Splash button counts | Strategic/Owner future summary | Missing signal |
| Splash Website | External URL | Expected `official_website_clicked` | `launchUrl` | Application Aggregation Point | Destination summary | Website click counts | Strategic future summary | Missing signal |
| Client Check-in | `/accessibility/checkin` | Expected `client_room_control_clicked` | Navigator | Application Aggregation Point | Client support summary | Check-in entry counts | Monitoring future summary | Missing signal |
| Client Suggestions | `/accessibility/suggestions` | Expected `client_room_control_clicked` | Navigator | Application Aggregation Point | Suggestion summary | Suggestion entry counts | Governance Operations future | Missing signal/admin visibility |
| Client Links | Local dialog / external links | Expected `links_card_opened` | Dialog + `launchUrl` | Application Aggregation Point | Link category summary | Link category counts | Strategic future summary | Missing signal |
| Client Tools | Local dialog | Expected `tools_card_opened` | Dialog | Application Aggregation Point | Tools summary | Tool interest counts | Strategic future summary | Missing signal |
| Client Feather | Local dialog | Expected `feather_tool_opened` | Dialog/setState | Application Aggregation Point | Notebook count summary only | Feather open count | Monitoring future summary | Missing signal/archive |
| Client Temporary Photo | Local image picker | Expected local control click | ImagePicker/setState | Application Aggregation Point | No raw image archive | Control count only | None | Missing signal |
| Client Exit | `/residential/exit-social-links` | Expected `residential_exit_opened` | Navigator | Application Aggregation Point | Exit summary | Exit count | Strategic/Owner future summary | Missing signal |
| Accessibility Links | `/accessibility/links` | Expected `accessibility_card_clicked` | Navigator | Application Aggregation Point | Links summary | Link surface counts | Strategic future summary | Missing signal |
| Accessibility Tools | `/accessibility/tools` | Expected `accessibility_card_clicked` | Navigator | Application Aggregation Point | Tool summary | Tool surface counts | Strategic future summary | Missing signal |
| Accessibility Suggestions | `/accessibility/suggestions` | Expected `accessibility_card_clicked` | Navigator | Application Aggregation Point | Suggestion summary | Suggestion surface counts | Governance future | Missing signal/admin visibility |
| Accessibility Check-in | `/accessibility/checkin` | Expected `accessibility_card_clicked` | Navigator | Application Aggregation Point | Support summary | Check-in counts | Monitoring future | Missing signal |
| Residential Exit Button | `/splash` | Expected `residential_return_to_splash_clicked` | Navigator | Application Aggregation Point | Exit flow summary | Return count | Strategic future | Missing signal |

## Overall Chain Result

The visual route/action layer is mostly connected.

The signal → aggregation → archive → admin/owner/monitoring layer is not connected.

Final Status: APPLICATION_INTERNAL_NETWORK_MAP_COMPLETED
