#!/bin/bash

# Script to generate a Firebase CI token for GitHub Actions

echo "🔐 Firebase CI Token Generator"
echo "================================"
echo ""
echo "This script will help you generate a Firebase token for GitHub Actions."
echo ""

# Check if firebase-tools is installed
if ! command -v firebase &> /dev/null; then
    echo "❌ Firebase CLI is not installed."
    echo ""
    echo "Please install it first:"
    echo "  npm install -g firebase-tools"
    exit 1
fi

echo "Step 1: Logging in to Firebase..."
echo "You may need to authenticate in your browser."
echo ""

firebase login

if [ $? -ne 0 ]; then
    echo "❌ Firebase login failed. Please try again."
    exit 1
fi

echo ""
echo "Step 2: Generating CI token..."
echo ""

TOKEN=$(firebase login:ci 2>&1)

if [ $? -ne 0 ]; then
    echo "❌ Failed to generate token."
    exit 1
fi

# Extract the token from the output
# The token is usually on a line by itself or after "Success! Use this token to sign in:"
FIREBASE_TOKEN=$(echo "$TOKEN" | grep -oE '[0-9]+//[0-9A-Za-z_-]+' | head -1)

if [ -z "$FIREBASE_TOKEN" ]; then
    echo "⚠️  Could not extract token automatically. Please copy it manually from above."
    echo ""
    echo "The token should look like: 1//0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    exit 1
fi

echo ""
echo "✅ Token generated successfully!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  FIREBASE_TOKEN"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "$FIREBASE_TOKEN"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 Next steps:"
echo ""
echo "1. Copy the token above"
echo "2. Go to your GitHub repository → Settings → Secrets and variables → Actions"
echo "3. Click 'New repository secret'"
echo "4. Name: FIREBASE_TOKEN"
echo "5. Value: Paste the token"
echo "6. Click 'Add secret'"
echo ""
echo "After adding the secret, your GitHub Actions workflow will be able to deploy to Firebase!"
echo ""
