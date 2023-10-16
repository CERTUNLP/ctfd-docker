#!/bin/bash

# Install plugins
actual_dir=$(pwd)
cd /opt/CTFd/CTFd/plugins/
IFS=',' read -ra REPOS <<< "$GIT_PLUGINS"
for repo in "${REPOS[@]}"; do
  git clone "$repo"
  cd "$(basename "$repo" .git)"
  if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
  fi
  cd ..
done
cd "$actual_dir"

# Run CTFd original entrypoint
exec /opt/CTFd/docker-entrypoint.sh "$@"
