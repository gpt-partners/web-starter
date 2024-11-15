#!/bin/bash

# Bootstrap Vite, see: https://vite.dev/guide/
mkdir app
cd app
npm create vite@latest . -- --template preact-ts

# Install shadcdn/ui, see https://ui.shadcn.com/docs/installation/vite
npm install -D tailwindcss postcss autoprefixer prettier-plugin-tailwindcss
npx tailwindcss init -p

# Add theme
curl -sS -o ./src/index.css https://raw.githubusercontent.com/gpt-partners/web-starter/master/index.css
echo "Created shadcdn/ui Theme file: index.css"

# Add tailwind template paths
curl -sS -o ./tailwind.config.js https://raw.githubusercontent.com/gpt-partners/web-starter/master/tailwind.config.js
echo "Created Tailwind config: tailwind.config.js"

# Add tsconfig.json
curl -sS -o ./tailwind.config.js https://raw.githubusercontent.com/gpt-partners/web-starter/master/tailwind.config.js
echo "Created Tailwind config: tailwind.config.js"

# Add tsconfig.json
curl -sS -o ./tsconfig.json https://raw.githubusercontent.com/gpt-partners/web-starter/master/tsconfig.json
echo "Created TypeScript configuration: tsconfig.json"

# Update tsconfig.app.json
NEW_LINE='"baseUrl": ".",'
sed -i "/\"paths\": {/i \    $NEW_LINE" tsconfig.app.json
NEW_LINE="\"@/*\": [\"./src/*\"],"
sed -i "/\"paths\": {/a \      $NEW_LINE" tsconfig.app.json
echo "Updated TypeScript configuration: tsconfig.app.json"

# Update vite.config.ts
npm i -D @types/node
curl -sS -o ./vite.config.ts https://raw.githubusercontent.com/gpt-partners/web-starter/master/vite.config.ts
echo "Created Vite config"

# Update build script to avoid TS errors
NEW_LINE="\"build\": \"tsc -b --noEmit && vite build\""
sed -i "s/\"build\": \"tsc -b && vite build\"/$NEW_LINE/" package.json

# Update package.json
NEW_LINE="\"dev\": \"vite --port 3001 --host\""
sed -i "s/\"dev\": \"vite\"/$NEW_LINE/" package.json
echo "Updated npm scripts: package.json"

# Run shadcn-ui init command
npx shadcn@latest init -d -y
npx shadcn@latest add sidebar-04

# Update main.tsx
curl -sS -o ./src/main.tsx https://raw.githubusercontent.com/gpt-partners/web-starter/master/main.tsx
echo "Created start page: main.tsx"

# Add login with Auth UI
npm install @supabase/supabase-js @supabase/auth-ui-react @supabase/auth-ui-shared
curl -sS -o ./.env.development https://raw.githubusercontent.com/gpt-partners/web-starter/master/.env.development
curl -sS -o ./src/Auth.tsx https://raw.githubusercontent.com/gpt-partners/web-starter/master/Auth.tsx

# Clean project
rm ./src/app.tsx ./src/app.css

# Init Git repo
echo "Initialize Git repository"
git init
git add .
git commit -m "Initial commit"
