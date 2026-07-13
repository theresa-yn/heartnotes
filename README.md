# Heartnotes

Heartnotes is a small Firebase-backed journaling PWA for saving personal reflections with optional photos, voice input, inspirational prompts, and Google sign-in.

## What It Uses

- Static HTML/CSS/JavaScript served from `docs/`
- Firebase Hosting
- Firebase Authentication with Google sign-in
- Cloud Firestore for user-owned reflection documents
- A service worker and web app manifest for installable PWA behavior

## Repository Layout

- `docs/index.html` - the main app
- `docs/manifest.json` - PWA metadata
- `docs/sw.js` - offline/service worker behavior
- `firestore.rules` - Firestore access rules
- `firebase.json` - Firebase Hosting and Firestore configuration
- `.github/workflows/firebase-deploy.yml` - deploys Firebase Hosting on pushes to `main`

## Local Preview

From the repository root:

```sh
python3 -m http.server 8766 --directory docs
```

Then open `http://localhost:8766`.

## Deployment

The repo is configured to deploy the `docs/` folder to the Firebase Hosting site named `heartnotes`.

Manual deploy:

```sh
firebase use spiritual-journey-e3330
firebase deploy --only hosting:heartnotes
```

GitHub Actions deploy requires a repository secret named `FIREBASE_TOKEN`.

## Security Notes

The Firebase web configuration in `docs/index.html` is public by design. Firestore data protection depends on `firestore.rules`, which currently requires authenticated users to read and write only documents where `userId` matches their Firebase UID.
