#!/bin/bash

# Install plugins
actual_dir=$(pwd)
cd /opt/CTFd/CTFd/plugins/
IFS=',' read -ra REPOS <<< "$GIT_PLUGINS"
for repo in "${REPOS[@]}"; do
  destination=$(basename "$repo" .git)
  # If destination exists, skip
  if [ -d "$destination" ]; then
    echo "Already installed plugin $repo"
    continue
  fi
  git clone "$repo"
  if [ -f "$destination/requirements.txt" ]; then
    pip install -r "$destination/requirements.txt"
  fi
done

# Install themes
cd /opt/CTFd/CTFd/themes/
# For each var that starts with GIT_THEMES_
for var in "${!GIT_THEMES_@}"; do
  # Split the var into an array of 2 elements
  IFS=',' read -ra REPO <<< "${!var}"
  # If destination exists, skip
  if [ -d "${REPO[1]}" ]; then
    echo "Already installed theme ${REPO[0]}"
    continue
  fi
  git clone "${REPO[0]}" "${REPO[1]}"
done

cd "$actual_dir"

# Run CTFd original entrypoint
exec /opt/CTFd/docker-entrypoint.sh "$@"
