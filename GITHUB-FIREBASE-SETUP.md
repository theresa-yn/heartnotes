# GitHub to Firebase Connection Guide

This guide will help you connect your GitHub repository to Firebase for automatic deployments.

## Prerequisites

- A GitHub repository (this one)
- A Firebase project (`spiritual-journey-e3330`)
- Firebase CLI installed locally (optional, for generating tokens)

## Step 1: Generate a Firebase CI Token

You need to generate a Firebase token that GitHub Actions will use to authenticate with Firebase.

### Option A: Using Firebase CLI (Recommended)

1. Install Firebase CLI if you haven't already:
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Generate a CI token:
   ```bash
   firebase login:ci
   ```

4. Copy the token that is displayed. It will look something like:
   ```
   1//0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   ```

### Option B: Using the Script

Run the provided script:
```bash
./generate-firebase-token.sh
```

## Step 2: Add the Token to GitHub Secrets

1. Go to your GitHub repository on GitHub.com
2. Click on **Settings** (in the repository, not your account settings)
3. In the left sidebar, click on **Secrets and variables** → **Actions**
4. Click **New repository secret**
5. Name: `FIREBASE_TOKEN`
6. Value: Paste the token you generated in Step 1
7. Click **Add secret**

## Step 3: Verify the Workflow

The GitHub Actions workflow is already configured at `.github/workflows/firebase-deploy.yml`. It will:

- Trigger automatically when you push to the `main` branch
- Deploy your `docs/` directory to Firebase Hosting site `heartnotes`
- Use the Firebase project `spiritual-journey-e3330`

## Step 4: Test the Connection

1. Make a small change to your code
2. Commit and push to the `main` branch:
   ```bash
   git add .
   git commit -m "Test Firebase deployment"
   git push origin main
   ```

3. Go to your repository on GitHub
4. Click on the **Actions** tab
5. You should see a workflow run called "Deploy to Firebase Hosting"
6. Click on it to see the deployment progress

## Troubleshooting

### Workflow fails with "Authentication Error"

- Make sure the `FIREBASE_TOKEN` secret is set correctly in GitHub
- Verify the token hasn't expired (tokens don't expire, but you can regenerate if needed)
- Check that the token was generated with the correct Firebase account

### Workflow fails with "Project not found"

- Verify the project ID in `.github/workflows/firebase-deploy.yml` matches your Firebase project
- Current project ID: `spiritual-journey-e3330`
- Current hosting site: `heartnotes`

### Workflow fails with "Site not found"

- Verify the hosting site name in `firebase.json` matches the site in your Firebase project
- Check your Firebase Console → Hosting to see the correct site name

## Manual Deployment

If you need to deploy manually (without GitHub Actions):

```bash
firebase login
firebase use spiritual-journey-e3330
firebase deploy --only hosting:heartnotes
```

## Additional Resources

- [Firebase Hosting Documentation](https://firebase.google.com/docs/hosting)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Firebase CLI Reference](https://firebase.google.com/docs/cli)
