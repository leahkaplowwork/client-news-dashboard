# Weekly Client News Dashboard — Automation Prompt

Use this prompt in the Cursor Automation editor.

## Instructions

Each Sunday, regenerate the weekly client intelligence dashboard:

1. Read `config/clients.yaml` and `config/research-playbook.md`.
2. Research the **past 7 days** of news using configured search queries and adaptive follow-ups.
3. Follow **priority tiers**: lead with Immunization Pulse, Global Public Health, Gates Foundation, and Gavi.
4. Apply **client curation rules**:
   - **ALSAC/St. Jude:** ALSAC fundraising and leadership first; St. Jude only for major org news (CEO transition, strategic plan, major programs) — no routine research/clinical trial updates.
   - **Louisiana OPH:** PHU operations, WIC oversight/participation, organizational changes — not general health news.
5. Every headline must be a **clickable link** to the best **primary source** (org press release, WHO, Gavi, CDC, legislative auditor — not aggregators when primary exists).
6. Curate ruthlessly: 3–5 bullets per Tier 1 subsection, 2–4 for Tier 2.
7. Mark each item **confirmed** or **developing**.
8. Write `dashboards/weekly-YYYY-MM-DD.html` (archive) and overwrite `dashboards/latest.html`.
9. Use `templates/dashboard.html.j2` as structural reference — output fully rendered self-contained HTML.
10. **Do not commit** unless explicitly asked.

## Output quality checklist

- [ ] At a Glance has 6–8 items; at least 4 from Tier 1
- [ ] All headlines link to primary sources
- [ ] Gates and Gavi cards are substantive
- [ ] ALSAC card has no micro research updates
- [ ] Louisiana card focuses on PHUs/WIC/org change
- [ ] Footer shows item and source counts
- [ ] Empty subsections say "No significant updates this week"
