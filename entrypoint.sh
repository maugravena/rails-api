#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /opt/app/tmp/pids/server.pid

rails db:prepare

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
