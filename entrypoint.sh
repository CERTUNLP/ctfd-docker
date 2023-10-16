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

# Install themes
cd /opt/CTFd/CTFd/themes/
# For each var that starts with GIT_THEMES_
for var in "${!GIT_THEMES_@}"; do
  IFS=',' read -ra REPO <<< "${!var}"
  git clone "${REPO[0]}"
  mv "$(basename "${REPO[0]}" .git)" "${REPO[1]}"
done

cd "$actual_dir"

# Run CTFd original entrypoint
exec /opt/CTFd/docker-entrypoint.sh "$@"
