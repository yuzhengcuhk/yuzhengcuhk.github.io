#!/bin/bash

# Yash Patel Academic Website - Deployment Script
# This script builds the Hugo site and prepares it for deployment

echo "🚀 Building Yash Patel's Academic Website..."

# Clean previous build
echo "🧹 Cleaning previous build..."
rm -rf public/

# Build the site
echo "🔨 Building site with Hugo..."
hugo

if [ $? -eq 0 ]; then
    echo "✅ Site built successfully!"
    echo "📁 Build output: public/"
    echo ""
    echo "🚀 To deploy:"
    echo "   1. Push the 'public/' directory to your gh-pages branch, or"
    echo "   2. Use GitHub Actions for automatic deployment"
    echo ""
    echo "🌐 Local preview: hugo server --bind 0.0.0.0 --port 1313"
else
    echo "❌ Build failed! Please check the error messages above."
    exit 1
fi
