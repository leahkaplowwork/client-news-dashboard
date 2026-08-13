# Client News Dashboard

Weekly intelligence brief for five client relationships + global health topics.

---

## Fix 404 (run once now)

The bookmark link 404s until these **local-only** files are pushed and Pages is turned on:

- `index.html`
- `.nojekyll`
- `.github/workflows/deploy-pages.yml`

**Fastest fix** — open PowerShell in this folder and run:

```powershell
cd "C:\Users\Leah Kaplow\.cursor\projects\C-Users-Leah-Kaplow-AppData-Local-Temp-7acbefa7-5736-4c13-b1e8-0ccd4e76158b\client-news-dashboard"
.\scripts\enable-pages.ps1
```

Or run manually:

```powershell
cd "C:\Users\Leah Kaplow\.cursor\projects\C-Users-Leah-Kaplow-AppData-Local-Temp-7acbefa7-5736-4c13-b1e8-0ccd4e76158b\client-news-dashboard"
git add index.html .nojekyll .github/workflows/deploy-pages.yml README.md scripts/enable-pages.ps1
git commit -m "Enable GitHub Pages delivery via Actions workflow"
git push origin main
gh api --method POST repos/leahkaplowwork/client-news-dashboard/pages -f build_type=workflow
gh workflow run deploy-pages.yml --repo leahkaplowwork/client-news-dashboard
```

Then in GitHub: **Settings → Pages → Build and deployment → Source → GitHub Actions**  
(https://github.com/leahkaplowwork/client-news-dashboard/settings/pages)

Wait ~2 minutes after the workflow finishes (check **Actions** tab).

**Still 404?** If the repo is **private** on a free GitHub plan, public Pages will not work. Either:

- Make the repo public (recommended — this is only public news links):  
  `gh repo edit leahkaplowwork/client-news-dashboard --visibility public`
- Or use GitHub Pro and set Pages visibility to public in repo Settings → Pages

---

## One link to view (bookmark this)

### https://leahkaplowwork.github.io/client-news-dashboard/

Open that URL anytime — it always shows the latest brief.  
Updated automatically every Sunday after the Cursor Automation runs.

No git pull. No hunting for files.

---

## First-time setup (one time only)

If you already ran the 404 fix above, skip this section.

### 1. Push deployment files to GitHub

Run `.\scripts\enable-pages.ps1` or the manual commands in **Fix 404**.

### 2. Turn on GitHub Pages

1. Go to **https://github.com/leahkaplowwork/client-news-dashboard/settings/pages**
2. Under **Build and deployment** → **Source**, choose **GitHub Actions**
3. Save (no other settings needed — the workflow is already in the repo)

After the first push, wait ~2 minutes, then open the bookmark link above.

### 3. Update Cursor Automation instructions

In **Automations → Weekly Client News Dashboard → Instructions**, paste the text from [`automation/weekly-dashboard.md`](automation/weekly-dashboard.md) — especially the **commit and push** steps.

Or add this line at the end:

```
After updating the HTML files, commit and push to main with message "Weekly dashboard update YYYY-MM-DD".
Leah views the live site at https://leahkaplowwork.github.io/client-news-dashboard/
```

---

## Clients covered

| Client | Focus |
|--------|-------|
| Gates Foundation | Immunization, polio, health delivery |
| Gavi | Gavi 6.0, replenishment, country programs |
| ALSAC / St. Jude | ALSAC fundraising; St. Jude major org news only |
| Louisiana OPH | PHUs, WIC, organizational change |
| RWJF | Health equity, Medicaid, nursing workforce |

Edit focus areas in [`config/clients.yaml`](config/clients.yaml).

---

## How delivery works

```
Sunday 6 PM → Cursor Automation researches & writes HTML
           → Commits & pushes to GitHub
           → GitHub Actions publishes to Pages
           → You open your bookmark
```

---

## Manual refresh (optional)

Ask a Cursor agent to read `config/research-playbook.md`, refresh `dashboards/latest.html`, commit, and push.

---

## Local copy (optional)

```
dashboards/latest.html
```

Double-click only if you want a local offline copy after `git pull`.
