# One-time setup: commit Pages files, push, enable GitHub Pages, trigger deploy.
# Run from repo root in PowerShell.

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot\..

Write-Host "Checking git status..." -ForegroundColor Cyan
git status

$porcelain = git status --porcelain
if ($porcelain) {
  Write-Host "Committing deployment files..." -ForegroundColor Yellow
  git add index.html .nojekyll .github/workflows/deploy-pages.yml README.md scripts/enable-pages.ps1 automation/weekly-dashboard.md config/research-playbook.md
  git commit -m "Enable GitHub Pages delivery via Actions workflow"
  git push origin main
} else {
  Write-Host "Working tree clean; pushing any unpushed commits..." -ForegroundColor Gray
  git push origin main
}

Write-Host "Checking repo visibility..." -ForegroundColor Cyan
$repo = gh repo view leahkaplowwork/client-news-dashboard --json visibility,isPrivate,url | ConvertFrom-Json
Write-Host ("Repo: {0} (private={1})" -f $repo.url, $repo.isPrivate)

if ($repo.isPrivate) {
  Write-Host ""
  Write-Host "WARNING: Private repos need GitHub Pro for public Pages, OR make the repo public." -ForegroundColor Red
  Write-Host "This dashboard only links to public news — making the repo public is recommended."
  Write-Host "To make public: gh repo edit leahkaplowwork/client-news-dashboard --visibility public"
  Write-Host ""
}

Write-Host "Enabling GitHub Pages (GitHub Actions source)..." -ForegroundColor Cyan
try {
  gh api repos/leahkaplowwork/client-news-dashboard/pages 2>$null | Out-Null
  Write-Host "Pages already configured."
} catch {
  gh api --method POST repos/leahkaplowwork/client-news-dashboard/pages -f build_type=workflow
}

Write-Host "Triggering deploy workflow..." -ForegroundColor Cyan
gh workflow run deploy-pages.yml --repo leahkaplowwork/client-news-dashboard

Write-Host ""
Write-Host "Done. Wait ~2 minutes, then open:" -ForegroundColor Green
Write-Host "https://leahkaplowwork.github.io/client-news-dashboard/"
