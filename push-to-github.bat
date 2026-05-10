@echo off
echo.
echo ╔══════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                              ║
echo ║                    PUSH TO GITHUB - SETUP SCRIPT                             ║
echo ║                                                                              ║
echo ╚══════════════════════════════════════════════════════════════════════════════╝
echo.
echo This script will help you push your code to GitHub.
echo.
echo STEP 1: Create GitHub Repository
echo ─────────────────────────────────
echo 1. Open your browser and go to: https://github.com/new
echo 2. Repository name: hospital-management-system
echo 3. Keep it Public
echo 4. Do NOT initialize with README
echo 5. Click "Create repository"
echo.
echo Press any key after you've created the repository...
pause >nul
echo.
echo STEP 2: Enter Your GitHub Username
echo ───────────────────────────────────
set /p GITHUB_USERNAME="Enter your GitHub username: "
echo.
echo Your repository URL will be:
echo https://github.com/%GITHUB_USERNAME%/hospital-management-system.git
echo.
set /p CONFIRM="Is this correct? (Y/N): "
if /i not "%CONFIRM%"=="Y" goto :end
echo.
echo STEP 3: Adding GitHub Remote
echo ─────────────────────────────
git remote add origin https://github.com/%GITHUB_USERNAME%/hospital-management-system.git
if errorlevel 1 (
    echo.
    echo ❌ Error: Failed to add remote. It might already exist.
    echo    Try: git remote remove origin
    echo    Then run this script again.
    goto :end
)
echo ✅ Remote added successfully!
echo.
echo STEP 4: Pushing to GitHub
echo ─────────────────────────
echo Pushing your code to GitHub...
git push -u origin main
if errorlevel 1 (
    echo.
    echo ❌ Error: Failed to push to GitHub.
    echo.
    echo Common issues:
    echo 1. Authentication failed - You may need to set up a Personal Access Token
    echo 2. Repository doesn't exist - Make sure you created it on GitHub
    echo 3. Network issues - Check your internet connection
    echo.
    echo To set up authentication:
    echo 1. Go to: https://github.com/settings/tokens
    echo 2. Generate new token (classic)
    echo 3. Select 'repo' scope
    echo 4. Use the token as your password when prompted
    echo.
    goto :end
)
echo.
echo ╔══════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                              ║
echo ║                    ✅ SUCCESS! CODE PUSHED TO GITHUB! ✅                      ║
echo ║                                                                              ║
echo ╚══════════════════════════════════════════════════════════════════════════════╝
echo.
echo Your repository is now available at:
echo https://github.com/%GITHUB_USERNAME%/hospital-management-system
echo.
echo NEXT STEP: Deploy on Vercel
echo ───────────────────────────
echo 1. Go to: https://vercel.com
echo 2. Sign in with GitHub
echo 3. Click "Add New Project"
echo 4. Select "hospital-management-system"
echo 5. Click "Deploy"
echo.
:end
echo.
echo Press any key to exit...
pause >nul
