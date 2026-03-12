# DreamHost DDNS Add-on for Home Assistant

![Home Assistant Add-on](https://img.shields.io/badge/Home%20Assistant-Addon-blue)
![DNS](https://img.shields.io/badge/DNS-Dynamic%20DNS-orange)
![DreamHost](https://img.shields.io/badge/Provider-DreamHost-lightgrey)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

A lightweight Home Assistant add-on that keeps a **DreamHost DNS A record** updated with your current WAN IP.

Perfect for:
- Dynamic IP home internet users
- Remote access to Home Assistant
- Self-hosted services with changing IPs
- Anyone who uses DreamHost for DNS hosting

---

## Features

- Automatically updates the DreamHost A record when your IP changes  
- Safe update sequence avoids DNS outages  
- Choose update interval from within the add-on UI  
- Logging with adjustable verbosity  
- Designed specifically for Home Assistant environments  
- Works standalone or within Home Assistant

---

## Installation

1. In Home Assistant, go to **Settings → Apps → Install App**  
2. Click the ⋮ menu → **Repositories**  
3. Add this URL: https://github.com/PRProd/home-assistant-addon-dreamhost-ddns
4. Click **Add**  
5. Install **DreamHost DDNS**  
6. Configure and start the add-on  

> Make sure you are on a Supervisor-managed system that supports add-ons.

---

## Configuration

### Required Values

| Setting       | Description                                     | Type     |
|---------------|-------------------------------------------------|----------|
| `api_key`     | Your DreamHost API key (with DNS permissions)  | password |
| `dns_record`  | DNS A record to update (e.g., `ha.example.com`) | string   |

### Optional Values

| Setting       | Description                                              | Type  | Default |
|---------------|----------------------------------------------------------|-------|---------|
| `interval`    | Seconds between checks (default 300 = 5 minutes)        | int   | 300     |
| `log_level`   | Log verbosity (trace, debug, info, warn, error)         | enum  | info    |

### Example

```yaml
api_key: "YOUR_DREAMHOST_API_KEY"
dns_record: "ha.example.com"
interval: 300
log_level: info
```

### How It Works
1. Detects your current public WAN IP using multiple online services
2. Fetches the current DNS A record from DreamHost
3. If the IP has changed:
   - Adds the new DNS record
   - Verifies the update
   - Removes the old DNS record only after the new one is verified

This sequence prevents temporary DNS outages during updates.

---

## Logs

Logs are accessible from the add-on UI. Use the ``log_level`` setting to control verbosity:

| Level | Output Shows                |
|-------|-----------------------------|
| error | Only errors                 |
| warn  | Errors + warnings           |
| info  | Normal operations (default) |
| debug | Detailed debug info         |
| trace | Most verbose, very detailed |

---

## Start, Stop & Restart
 - Click Start to begin periodic updates
 - Use Stop to halt updates
 - Restart applies any updated configuration

---

## Tips & Best Practices
 - Ensure your DreamHost API key has DNS permissions
 - For frequent IP changes, lower interval values (e.g., 120s) may help
 - Test your configuration with the add-on logs before leaving it running

---

## Common Issues
If Home Assistant reports "_failed to start_", check:
 - API key and record are correct
 - Network connectivity
 - Firewall or proxy is not blocking outgoing HTTP calls

---

## Related Projects

[dreamhost-ddns Rust CLI](https://github.com/PRProd/dreamhost-ddns) - the standalone binary used by this add-on

---

## Feedback & Support
 - Open an Issue on GitHub
 - Star the repository ⭐ to show support
 - Share feedback in the Home Assistant community forum
