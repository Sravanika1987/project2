# Hospital Management System

A comprehensive hospital appointment booking and management system with separate dashboards for patients, doctors, receptionists, and administrators.

## Features

- **Patient Portal**: Book appointments, view appointment status
- **Doctor Dashboard**: View patients, manage appointments, prescribe medications
- **Receptionist Dashboard**: Manage booking requests, patient records
- **Admin Dashboard**: Manage doctors, staff, patients, and view workloads

## Tech Stack

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Node.js, Express.js
- **Database**: SQLite3
- **Authentication**: bcryptjs

## Default Login Credentials

### Admin
- Username: `admin`
- Password: `123`

### Receptionist
- Username: `r101`
- Password: `123`

### Doctor
- Doctor ID: `d101`
- Password: `123`

## Local Development

1. Install dependencies:
```bash
cd "backend code"
npm install
```

2. Start the server:
```bash
npm start
```

3. Open `index.html` in your browser

## Deployment to Vercel

### Prerequisites
- GitHub account
- Vercel account (free tier works)
- Git installed on your computer

### Step 1: Initialize Git Repository

```bash
# Navigate to project directory
cd "c:\Users\SRAVANIKA\Downloads\hospital-management-system-fainal-main\hospital-management-system-fainal-main"

# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit - Hospital Management System ready for deployment"
```

### Step 2: Push to GitHub

1. Create a new repository on GitHub (https://github.com/new)
   - Name it: `hospital-management-system`
   - Keep it public or private
   - Don't initialize with README (we already have one)

2. Push your code:
```bash
# Add remote repository (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/hospital-management-system.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Deploy on Vercel

#### Option A: Using Vercel Dashboard (Recommended)

1. Go to [Vercel](https://vercel.com) and sign in
2. Click "Add New Project"
3. Import your GitHub repository
4. Configure project:
   - **Framework Preset**: Other
   - **Root Directory**: `./`
   - **Build Command**: Leave empty
   - **Output Directory**: Leave empty
   - **Install Command**: `cd "backend code" && npm install`
5. Click "Deploy"

#### Option B: Using Vercel CLI

```bash
# Install Vercel CLI globally
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
vercel

# For production deployment
vercel --prod
```

### Step 4: Verify Deployment

After deployment completes:
1. Vercel will provide a URL (e.g., `https://your-project.vercel.app`)
2. Visit the URL to see your live site
3. Test the homepage loads correctly
4. Test login functionality with default credentials

## Important Notes

### Database Persistence
⚠️ **Important**: SQLite database on Vercel is ephemeral (resets on each deployment). For production use, consider:
- Using Vercel Postgres
- MongoDB Atlas
- PlanetScale
- Supabase

### API Endpoints
- `POST /api/login` - User authentication
- `POST /api/appointments` - Create appointment
- `GET /api` - API health check

## Project Structure

```
hospital-management-system/
├── index.html                          # Main landing page
├── patient_booking.html                # Patient appointment booking
├── staff_login.html                    # Staff login page
├── admin_dashboard.html                # Admin dashboard
├── doctor_dashboard.html               # Doctor dashboard
├── receptionist_dashboard.html         # Receptionist dashboard
├── images/                             # Image assets
├── backend code/
│   ├── server.js                       # Express server
│   ├── package.json                    # Node dependencies
│   └── hospital.db                     # SQLite database
├── vercel.json                         # Vercel configuration
├── .gitignore                          # Git ignore rules
└── README.md                           # This file
```

## Troubleshooting

### 404 Error on Vercel
- Ensure `index.html` exists in root directory
- Check `vercel.json` configuration
- Verify all file paths are relative (no absolute paths)

### API Not Working
- Check Vercel function logs
- Verify API routes in `vercel.json`
- Ensure backend dependencies are installed

### Images Not Loading
- Verify image paths are relative (e.g., `images/photo.jpg`)
- Check image files are committed to Git
- Ensure images folder is not in `.gitignore`

## Support

For issues or questions, please check:
- Vercel deployment logs
- Browser console for errors
- Network tab for failed requests

## License

This project is for educational purposes.
