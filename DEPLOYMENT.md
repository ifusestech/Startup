# Deploying DigiTransform Website to Cloudflare Pages

This guide will walk you through deploying your DigiTransform website to Cloudflare Pages.

## Prerequisites

1. A Cloudflare account (free tier works fine)
2. Git installed on your computer
3. GitHub account (or GitLab/Bitbucket)

## Step 1: Prepare Your Repository

### Initialize Git Repository (if not already done)

```bash
cd /Users/raj.mori/Downloads/Startup
git init
git add .
git commit -m "Initial commit - DigiTransform website"
```

### Create GitHub Repository

1. Go to [GitHub](https://github.com) and create a new repository
2. Name it something like `digitransform-website`
3. Don't initialize with README (we already have files)
4. Copy the repository URL

### Push to GitHub

```bash
git remote add origin YOUR_GITHUB_REPO_URL
git branch -M main
git push -u origin main
```

## Step 2: Deploy to Cloudflare Pages

### Option A: Using Cloudflare Dashboard (Recommended)

1. **Log in to Cloudflare Dashboard**
   - Go to [dash.cloudflare.com](https://dash.cloudflare.com)
   - Navigate to "Workers & Pages" in the left sidebar

2. **Create a New Pages Project**
   - Click "Create application"
   - Select "Pages" tab
   - Click "Connect to Git"

3. **Connect Your Repository**
   - Authorize Cloudflare to access your GitHub account
   - Select your repository (`digitransform-website`)
   - Click "Begin setup"

4. **Configure Build Settings**
   - **Project name**: `digitransform` (or your preferred name)
   - **Production branch**: `main`
   - **Build command**: Leave empty (static site, no build needed)
   - **Build output directory**: `/` (root directory)
   - Click "Save and Deploy"

5. **Wait for Deployment**
   - Cloudflare will deploy your site (usually takes 1-2 minutes)
   - You'll get a URL like: `https://digitransform.pages.dev`

### Option B: Using Wrangler CLI

```bash
# Install Wrangler
npm install -g wrangler

# Login to Cloudflare
wrangler login

# Deploy
wrangler pages deploy . --project-name=digitransform
```

## Step 3: Configure Custom Domain (Optional)

1. **Add Custom Domain**
   - In Cloudflare Pages dashboard, go to your project
   - Click "Custom domains" tab
   - Click "Set up a custom domain"
   - Enter your domain (e.g., `digitransform.com`)
   - Follow DNS configuration instructions

2. **SSL/TLS**
   - Cloudflare automatically provides free SSL certificate
   - Your site will be accessible via HTTPS

## Step 4: Environment Variables (if needed)

If you need to add environment variables:
1. Go to your Pages project settings
2. Click "Environment variables"
3. Add any required variables

## Step 5: Verify Deployment

1. Visit your Cloudflare Pages URL
2. Test all pages:
   - Home (`index.html`)
   - About (`about.html`)
   - Services (`service.html`)
   - Industries (`team.html`)
   - Case Studies (`testimonial.html`)
   - Contact (`contact.html`)
3. Test the contact form submission
4. Check mobile responsiveness

## Automatic Deployments

Cloudflare Pages automatically deploys when you push to your repository:

```bash
# Make changes to your site
git add .
git commit -m "Update content"
git push origin main

# Cloudflare will automatically deploy the changes
```

## Troubleshooting

### Issue: 404 Errors
- Make sure `index.html` is in the root directory
- Check that all file paths are relative (not absolute)

### Issue: Form Not Working
- Verify Formspree endpoint is correct in `contact.html`
- Check browser console for errors

### Issue: Images Not Loading
- Ensure all image paths are relative
- Check that images are committed to Git

## Performance Optimization

Cloudflare Pages automatically provides:
- ✅ Global CDN
- ✅ Automatic HTTPS
- ✅ HTTP/2 and HTTP/3
- ✅ Brotli compression
- ✅ DDoS protection
- ✅ Web Application Firewall (WAF)

## Monitoring

1. **Analytics**
   - Go to your Pages project
   - Click "Analytics" tab
   - View traffic, performance metrics

2. **Deployment History**
   - View all deployments
   - Rollback to previous versions if needed

## Cost

- **Free Tier**: Unlimited bandwidth, 500 builds/month
- **Perfect for this static website**

## Next Steps

1. Set up custom domain
2. Configure redirects (if needed)
3. Add analytics (Google Analytics, Plausible, etc.)
4. Set up monitoring/uptime checks
5. Configure email forwarding for your domain

## Support

- [Cloudflare Pages Documentation](https://developers.cloudflare.com/pages/)
- [Cloudflare Community](https://community.cloudflare.com/)
- [Cloudflare Support](https://support.cloudflare.com/)

