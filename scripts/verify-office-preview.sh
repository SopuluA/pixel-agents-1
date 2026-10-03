#!/usr/bin/env bash
set -euo pipefail
git rev-parse HEAD
node --version
npm --version
npm ci --no-audit --no-fund
npm run asyncapi:generate
npm run build:webview
node esbuild.js --production
mkdir -p artifacts
tar -czf artifacts/pixel-agents-preview.tar.gz dist
