# Client News Dashboard

Weekly intelligence brief covering five client relationships and key global health topics. Refreshed by Cursor Automation every Sunday at 6:00 PM.

## Open the dashboard

**Each week, double-click this file in Windows Explorer:**

```
dashboards/latest.html
```

Or drag it into Chrome, Edge, or Firefox. Every headline links to its primary source.

Archived weeks: `dashboards/weekly-YYYY-MM-DD.html`

## Priority tiers

**Tier 1 (lead the brief):** Immunization Pulse, Global Public Health, Gates Foundation, Gavi

**Tier 2:** Louisiana OPH (PHUs, WIC, org change), ALSAC/St. Jude (fundraising; St. Jude only for major org news), RWJF

## Clients covered

| Client | Focus |
|--------|-------|
| Gates Foundation | Immunization, polio, health delivery |
| Gavi | Gavi 6.0, replenishment, country programs, supply chain |
| ALSAC / St. Jude | ALSAC fundraising & board; St. Jude CEO/major programs only |
| Louisiana OPH | PHU operations, WIC oversight, organizational change |
| RWJF | Health equity, Medicaid, nursing workforce |

## Project structure

```
client-news-dashboard/
├── config/
│   ├── clients.yaml          # Client definitions, priorities, search queries
│   └── research-playbook.md  # Weekly research and curation rules
├── templates/
│   └── dashboard.html.j2     # HTML structure reference
├── dashboards/
│   ├── latest.html           # Open this each week
│   └── weekly-*.html         # Archives
├── automation/
│   └── weekly-dashboard.md   # Cursor Automation prompt reference
└── README.md
```

## Customize

Edit `config/clients.yaml` for search queries, priority tiers, and client focus areas.

Edit `config/research-playbook.md` for curation rules.

## Manual refresh

> Read config/clients.yaml and config/research-playbook.md. Research the past 7 days and regenerate dashboards/latest.html with clickable primary-source headline links. Follow priority tiers and client curation rules.

## Git setup (required for automation)

```powershell
cd client-news-dashboard
git init
git add .
git commit -m "Initial client news dashboard"
gh repo create client-news-dashboard --private --source=. --push
```

Point the Cursor Automation at this repo in the Automations editor.

## Automation

- **Schedule:** Sunday 6:00 PM (`0 18 * * 0`)
- **Runtime:** Cloud agent (web research)
- **Prompt:** See `automation/weekly-dashboard.md`
