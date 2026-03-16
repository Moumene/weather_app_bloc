# Stitch Design Assets

Design screens from Stitch project `6343193776601235375`, fetched via the Stitch MCP API.

## Screens

| Screen | ID | Dimensions | Files |
|--------|-----|------------|-------|
| Settings & Location Search | `8b290fc80ed14714b34ada30733d1c03` | 780×2268 (MOBILE) | `settings_location_search.png`, `settings_location_search.html` |
| Weather Dashboard (Fixed Layout) | `3c211f41dcfa4908b6f906864819a1e4` | 780×3424 (MOBILE) | `weather_dashboard.png`, `weather_dashboard.html` |

## Design Tokens (from HTML)

- **Primary**: `#258cf4`
- **Background Light**: `#f5f7f8`
- **Background Dark**: `#101922`
- **Font**: Inter
- **Border Radius**: 0.5rem (default), 1rem (lg), 1.5rem (xl)

## Fetching Updates

```bash
# Get screen metadata (requires Stitch API key)
curl -s -X POST "https://stitch.googleapis.com/mcp" \
  -H "Content-Type: application/json" \
  -H "X-Goog-Api-Key: YOUR_API_KEY" \
  -d '{"jsonrpc":"2.0","id":"1","method":"tools/call","params":{"name":"get_screen","arguments":{"projectId":"6343193776601235375","screenId":"SCREEN_ID"}}}'
```
