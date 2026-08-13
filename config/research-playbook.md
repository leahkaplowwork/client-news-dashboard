# Weekly Research Playbook

Instructions for the Cursor Automation agent (or manual runs) that generate the client news dashboard.

## Reporting window

- Default: **past 7 days** from the run date (see `reporting_window_days` in `clients.yaml`).
- State the exact date range in the dashboard header.

## Priority and curation

Follow `priority_tiers` in `clients.yaml`:

**Tier 1 (lead the brief):** Immunization Pulse, Global Public Health, Gates Foundation, Gavi
- Allocate more At a Glance slots and fuller subsections to these areas.
- Headlines must link to the **best primary source** (org press release, WHO, Gavi, CDC — not aggregators when a primary link exists).

**Tier 2:** Louisiana OPH, ALSAC/St. Jude, RWJF
- Fewer bullets; only high-signal items.

### Client-specific curation rules

**ALSAC / St. Jude**
- Lead with ALSAC: fundraising, board, executive team, campaigns.
- St. Jude only for major organizational news (CEO transition, $12.9B strategic plan milestones, major new programs).
- **Exclude** routine clinical trial results, incremental research publications, or lab science updates.

**Louisiana Office of Public Health**
- Focus on organizational changes, **parish health units (PHUs)**, and **WIC** program oversight and participation.
- Prioritize legislative audits, LDH corrective actions, PHU clinic hours/outreach, WIC enrollment barriers.
- Skip general outbreak news unless OPH/PHU operations are directly implicated.

## Research sequence

1. Read `config/clients.yaml`.
2. Research **Tier 1** global topics, then **Tier 1** clients (Gates, Gavi).
3. Research **Tier 2** clients.
4. Build **At a Glance** from highest-priority items (aim for 6–8; at least 4 from Tier 1).

## Item format (required)

Each news item must include:

| Field | Requirement |
|-------|-------------|
| `headline` | Linked to best primary URL — headline text IS the link |
| `summary` | 1–2 sentences; client-specific "why it matters" for external items |
| `tags` | 1–3 relevance tags |
| `status` | `confirmed` or `developing` |
| `source` | Publisher name (secondary text below summary) |
| `url` | Same as headline link; prefer HTTPS primary sources |

## Curation limits

- **3–5 bullets** per subsection for Tier 1; **2–4** for Tier 2.
- If no news: **"No significant updates this week"** — never leave empty.
- Deduplicate At a Glance vs. card content (higher-level summary in glance).

## Output files

1. `dashboards/weekly-YYYY-MM-DD.html` — archive
2. `dashboards/latest.html` — overwrite each run
3. **Commit and push to `main`** after every run (required — Leah views via GitHub Pages)

Live view URL (bookmark this):

**https://leahkaplowwork.github.io/client-news-dashboard/**

## HTML requirements

- Self-contained single file; no external CSS/JS.
- **Improved formatting:** clear visual hierarchy, Tier 1 sections more prominent, clickable headlines.
- Structure: Header → At a Glance → Global Topics → Client Updates (Tier 1 clients first).
- Color-coded left border per client (from `clients.yaml`).
- Print-friendly CSS; mobile single-column fallback.
- Footer: item count, source count, generation timestamp.

## Do not

- Skip commit/push — Leah relies on the live Pages URL updating automatically.
- Fabricate news or URLs.
- Use aggregator links when a primary source is available.
