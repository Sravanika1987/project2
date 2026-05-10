# Push to GitHub Script
Write-Host "`n╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                                              ║" -ForegroundColor Cyan
Write-Host "║                    PUSH TO GITHUB - SETUP SCRIPT                             ║" -ForegroundColor Cyan
Write-Host "║                                                                              ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

Write-Host "This script will help you push your code to GitHub.`n" -ForegroundColor White

Write-Host "STEP 1: Create GitHub Repository" -ForegroundColor Yellow
Write-Host "─────────────────────────────────" -ForegroundColor Yellow
Write-Host "1. Open your browser and go to: https://github.com/new"
Write-Host "2. Repository name: hospital-management-system"
Write-Host "3. Keep it Public"
Write-Host "4. Do NOT initialize with README"
Write-Host "5. Click 'Create repository'`n"

$continue = Read-Host "Have you created the repository? (Y/N)"
if ($continue -ne "Y" -and $continue -ne "y") {
    Write-Host "`nPlease create the repository first, then run this script again." -ForegroundColor Red
    exit
}

Write-Host "`nSTEP 2: Enter Your GitHub Username" -ForegroundColor Yellow
Write-Host "───────────────────────────────────" -ForegroundColor Yellow
$username = Read-Host "Enter your GitHub username"

Write-Host "`nYour repository URL will be:" -ForegroundColor Cyan
Write-Host "https://github.com/$username/hospital-management-system.git" -ForegroundColor White

$confirm = Read-Host "`nIs this correct? (Y/N)"
if ($confirm -ne "Y" -and $confirm -ne "y") {
    Write-Host "`nScript cancelled. Please run again with correct username." -ForegroundColor Red
    exit
}

Write-Host "`nSTEP 3: Adding GitHub Remote" -ForegroundColor Yellow
Write-Host "─────────────────────────────" -ForegroundColor Yellow

try {
    git remote add origin "https://github.com/$username/hospital-management-system.git" 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Remote added successfully!`n" -ForegroundColor Green
    } else {
        throw "Failed to add remote"
    }
} catch {
    Write-Host "❌ Error: Failed to add remote. It might already exist." -ForegroundColor Red
    Write-Host "   Try: git remote remove origin" -ForegroundColor Yellow
    Write-Host "   Then run this script again.`n" -ForegroundColor Yellow
    exit
}

Write-Host "STEP 4: Pushing to GitHub" -ForegroundColor Yellow
Write-Host "─────────────────────────" -ForegroundColor Yellow
Write-Host "Pushing your code to GitHub...`n" -ForegroundColor White

try {
    git push -u origin main
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
        Write-Host "║                                                                              ║" -ForegroundColor Green
        Write-Host "║                    ✅ SUCCESS! CODE PUSHED TO GITHUB! ✅                      ║" -ForegroundColor Green
        Write-Host "║                                                                              ║" -ForegroundColor Green
        Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Green
        
        Write-Host "Your repository is now available at:" -ForegroundColor Cyan
        Write-Host "https://github.com/$username/hospital-management-system`n" -ForegroundColor White
        
        Write-Host "NEXT STEP: Deploy on Vercel" -ForegroundColor Yellow
        Write-Host "───────────────────────────" -ForegroundColor Yellow
        Write-Host "1. Go to: https://vercel.com"
        Write-Host "2. Sign in with GitHub"
        Write-Host "3. Click 'Add New Project'"
        Write-Host "4. Select 'hospital-management-system'"
        Write-Host "5. Click 'Deploy'`n"
    } else {
        throw "Push failed"
    }
} catch {
    Write-Host "`n❌ Error: Failed to push to GitHub.`n" -ForegroundColor Red
    Write-Host "Common issues:" -ForegroundColor Yellow
    Write-Host "1. Authentication failed - You may need to set up a Personal Access Token"
    Write-Host "2. Repository doesn't exist - Make sure you created it on GitHub"
    Write-Host "3. Network issues - Check your internet connection`n"
    Write-Host "To set up authentication:" -ForegroundColor Cyan
    Write-Host "1. Go to: https://github.com/settings/tokens"
    Write-Host "2. Generate new token (classic)"
    Write-Host "3. Select 'repo' scope"
    Write-Host "4. Use the token as your password when prompted`n"
}

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
