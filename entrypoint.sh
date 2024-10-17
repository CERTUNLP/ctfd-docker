#!/bin/bash

# Install plugins
actual_dir=$(pwd)
cd /opt/CTFd/CTFd/plugins/
# For each var that starts with GIT_PLUGINS_
for var in "${!GIT_PLUGINS_@}"; do
  # Split the var into an array of 2 elements
  IFS=',' read -ra REPO <<< "${!var}"
  # If destination exists, skip
  if [ -d "${REPO[1]}" ]; then
    echo "Already installed theme ${REPO[0]}"
    continue
  fi
  git clone "${REPO[0]}" "${REPO[1]}"
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
