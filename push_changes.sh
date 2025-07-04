#!/bin/bash

cd "$(dirname "$0")" || exit 1

echo "Staging all changes..."
git add .

echo "Enter your commit message:"
read commit_message

git commit -m "$commit_message"
git push origin main
