# Weekly Client News Dashboard — Automation Prompt

Use this prompt in the Cursor Automation editor (or rely on this file from the repo).

## Instructions

Each Sunday, regenerate the weekly client intelligence dashboard:

1. Read `config/clients.yaml` and `config/research-playbook.md`.
2. Research the **past 7 days** of news using configured search queries and adaptive follow-ups.
3. Follow **priority tiers**: lead with Immunization Pulse, Global Public Health, Gates Foundation, and Gavi.
4. Apply **client curation rules**:
   - **ALSAC/St. Jude:** ALSAC fundraising and leadership first; St. Jude only for major org news — no routine research/clinical trial updates.
   - **Louisiana OPH:** PHU operations, WIC oversight/participation, organizational changes.
5. Every headline must be a **clickable link** to the best **primary source**.
6. Write `dashboards/weekly-YYYY-MM-DD.html` (archive) and overwrite `dashboards/latest.html`.
7. Use `templates/dashboard.html.j2` as structural reference — fully rendered self-contained HTML.

## REQUIRED: publish so Leah can view it (do every run)

8. **Commit and push to `main`** with message: `Weekly dashboard update YYYY-MM-DD`
9. Include all changed dashboard files in the commit.

GitHub Actions will automatically publish the site. Leah views it at:

**https://leahkaplowwork.github.io/client-news-dashboard/**

That link always opens the latest brief. No manual git pull needed.

## Output quality checklist

- [ ] At a Glance has 6–8 items; at least 4 from Tier 1
- [ ] All headlines link to primary sources
- [ ] Gates and Gavi cards are substantive
- [ ] ALSAC: no micro research updates
- [ ] Louisiana: PHUs/WIC/org change focus
- [ ] Committed and pushed to main
