# 1. Build the project
Write-Host "Building Flutter Web..."
flutter build web --release --base-href "/portfolio/"

# 2. Go to build folder
cd build/web

# 3. Git Magic (Jo hum haath se karte the)
git init
git add .
git commit -m "Auto Deploy Update"

# REPLACE THIS LINK WITH YOUR REPO LINK 👇
git remote add origin https://github.com/priyanshunegi10/portfolio.git


git push -u -f origin master:gh-pages

# 4. Go back to main folder
cd ../..

Write-Host "✅ Done! Site is updating..."