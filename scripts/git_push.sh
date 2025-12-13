#!/usr/bin/env bash
# --------------------------------------
# git_push.sh
# Simple interactive git push helper
# --------------------------------------

set -e

# Ensure we're inside a git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "❌ Not inside a git repository"
  exit 1
fi

# Optional: clean project if Makefile exists
if [ -f Makefile ]; then
  make fclean 2>/dev/null || true
fi

git add .

read -rp "Enter commit message (empty = random): " msg
if [ -z "$msg" ]; then
  msg=$(shuf -i 1000-9999 -n 1 2>/dev/null || date +%s)
fi

git commit -m "$msg"
git push

