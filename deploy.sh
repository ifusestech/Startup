#!/bin/bash

# DigiTransform Website Deployment Script
# This script helps you deploy your website to Cloudflare Pages

echo "🚀 DigiTransform Website Deployment"
echo "===================================="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

echo "✅ Git is installed"

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "📦 Initializing Git repository..."
    git init
    echo "✅ Git repository initialized"
else
    echo "✅ Git repository already exists"
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo ""
    echo "📝 You have uncommitted changes. Would you like to commit them? (y/n)"
    read -r commit_choice
    
    if [ "$commit_choice" = "y" ] || [ "$commit_choice" = "Y" ]; then
        echo "💬 Enter commit message:"
        read -r commit_message
        
        git add .
        git commit -m "$commit_message"
        echo "✅ Changes committed"
    fi
fi

# Check if remote exists
if ! git remote | grep -q origin; then
    echo ""
    echo "🔗 No remote repository found."
    echo "📋 Please enter your GitHub repository URL:"
    echo "   (e.g., https://github.com/username/digitransform-website.git)"
    read -r repo_url
    
    git remote add origin "$repo_url"
    echo "✅ Remote repository added"
else
    echo "✅ Remote repository already configured"
fi

# Push to GitHub
echo ""
echo "📤 Pushing to GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub!"
    echo ""
    echo "🎉 Next Steps:"
    echo "=============="
    echo "1. Go to https://dash.cloudflare.com"
    echo "2. Navigate to 'Workers & Pages'"
    echo "3. Click 'Create application' > 'Pages' > 'Connect to Git'"
    echo "4. Select your repository and deploy"
    echo ""
    echo "📖 For detailed instructions, see DEPLOYMENT.md"
else
    echo "❌ Failed to push to GitHub"
    echo "Please check your repository URL and credentials"
    exit 1
fi

