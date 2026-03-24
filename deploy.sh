#!/bin/bash
# ALWISI Gallery + Hero Banner Deployment

cd /home/node/.openclaw/workspace/shared/alwisi

echo "📦 Adding files to git..."
git add index.html GALLERY_PLAN.md DEPLOYMENT_SUMMARY.md gallery-section.html BANNER_OPTIONS.md

echo "💬 Committing changes..."
git commit -m "Add gallery section + hero banner

Gallery:
- 9 featured photos in responsive grid
- Garden photo first as requested
- Removed terrassenbelag detail and fassadenarbeit
- Added renovierung worker photo
- Full DE/AR bilingual support
- SEO-optimized alt text

Hero Banner:
- Subtle background photo overlay (balcony c1)
- Maintains text readability
- Fixed background (parallax effect)
- Professional showcase

Services shown: Gartenarbeit, Bodenbelag, Isolierung, Renovierung"

echo "🚀 Pushing to GitHub..."
git push origin main

echo ""
echo "✅ Deployment complete!"
echo "🌐 Live in ~30 seconds: https://alwisidl.github.io"
echo ""
