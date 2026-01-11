# Fix Google Sign-In for GitHub Deployed Site

## Problem
Cannot sign in with Google on the site deployed from GitHub Actions.

## Solution
The site deployed from GitHub Actions needs to have its domain authorized in Firebase.

## Steps to Fix

### 1. Check Which Domain is Deployed
GitHub Actions deploys to: `https://heartnotes-xyz.web.app` (based on firebase.json)

### 2. Add Domain to Firebase Authorized Domains

1. **Go to Firebase Authentication Settings:**
   - Direct link: https://console.firebase.google.com/project/spiritual-journey-e3330/authentication/settings

2. **Add Authorized Domain:**
   - Scroll down to the **"Authorized domains"** section
   - Check if `heartnotes-xyz.web.app` is listed
   - If NOT listed, click **"Add domain"** button
   - Enter: `heartnotes-xyz.web.app`
   - Click **"Add"**

3. **Also verify these domains are authorized:**
   - ✅ `localhost` (for local development)
   - ✅ `spiritual-journey-e3330.firebaseapp.com` (default Firebase domain)
   - ✅ `spiritual-journey-e3330.web.app` (default web.app domain)
   - ✅ `heartnotes-xyz.web.app` (your GitHub deployed site)

### 3. Verify Google Sign-In Provider is Enabled

1. **Go to Firebase Authentication Providers:**
   - Direct link: https://console.firebase.google.com/project/spiritual-journey-e3330/authentication/providers

2. **Check Google Provider:**
   - Click on **"Google"**
   - Make sure it's **Enabled**
   - Check that "Project support email" is set
   - Save changes if needed

### 4. Test the Site

1. Go to: https://heartnotes-xyz.web.app
2. Try signing in with Google
3. If it still doesn't work, check browser console (F12) for errors

## Common Errors and Fixes

### Error: `auth/unauthorized-domain`
- **Fix:** Add the domain to Firebase Authorized Domains (step 2 above)

### Error: `auth/operation-not-allowed`
- **Fix:** Enable Google Sign-In provider in Firebase Console (step 3 above)

### Error: `auth/popup-blocked`
- **Fix:** Allow popups in your browser settings

## Quick Check Script

Run this to verify your domain:
```bash
./check-firebase-status.sh
```

## After Making Changes

- Changes to authorized domains take effect **immediately** (no deployment needed)
- Wait 1-2 minutes if it doesn't work right away
- Try clearing browser cache or using incognito mode
