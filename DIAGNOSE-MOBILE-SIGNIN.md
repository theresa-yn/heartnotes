# Diagnose Mobile Sign-In Issue

## What to Check

### 1. Check Browser Console on Phone

**On iPhone:**
1. Connect iPhone to Mac
2. Open Safari on Mac
3. Safari → Develop → [Your iPhone] → heartnotes.web.app
4. Check Console for errors

**Or use remote debugging:**
- Settings → Safari → Advanced → Web Inspector (enable)
- Then use Safari on Mac to debug

### 2. Check What Error You See

When you click "Continue with Google", what happens?
- [ ] Nothing happens
- [ ] Shows "Redirecting to sign in..." but nothing happens
- [ ] Shows an error message (what does it say?)
- [ ] Redirects but shows error page
- [ ] Redirects to Google but then shows error

### 3. Verify Configuration

**Firebase Authorized Domains:**
- Go to: https://console.firebase.google.com/project/spiritual-journey-e3330/authentication/settings
- Check if `heartnotes.web.app` is in the list
- If not, add it

**OAuth Redirect URI:**
- Go to: https://console.cloud.google.com/apis/credentials/oauthclient/443749946566-au3ukambp5od7di9odd8inf9v5rk5u9l.apps.googleusercontent.com?project=spiritual-journey-e3330
- Check "Authorized redirect URIs"
- Must have: `https://heartnotes.web.app/__/auth/handler`
- Check "Authorized JavaScript origins"
- Must have: `https://heartnotes.web.app`

### 4. Test Steps

1. **Open Safari directly** (not from Messages/Instagram)
2. Go to: https://heartnotes.web.app
3. Click "Continue with Google"
4. Note what happens and any error message

### 5. Common Issues

**Issue: "Domain not authorized"**
- Fix: Add `heartnotes.web.app` to Firebase authorized domains

**Issue: "redirect_uri_mismatch"**
- Fix: Add `https://heartnotes.web.app/__/auth/handler` to OAuth redirect URIs

**Issue: Nothing happens when clicking button**
- Check browser console for JavaScript errors
- Make sure you're using Safari/Chrome (not in-app browser)

**Issue: Redirects but shows error page**
- Check the URL of the error page
- Look for error parameters in the URL

## Quick Test

Try this URL directly in your phone's browser:
```
https://accounts.google.com/o/oauth2/v2/auth?client_id=443749946566-au3ukambp5od7di9odd8inf9v5rk5u9l.apps.googleusercontent.com&redirect_uri=https://heartnotes.web.app/__/auth/handler&response_type=code&scope=email profile
```

If this works, the OAuth configuration is correct.
If it shows an error, note what the error says.
