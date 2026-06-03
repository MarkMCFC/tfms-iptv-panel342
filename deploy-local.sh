#!/usr/bin/env bash
set -euo pipefail
npm install
npm run db:migrate:remote
npm run deploy
