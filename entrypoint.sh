#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# DB create
bin/rails db:create

# DB migrate
# DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:migrate:reset
bin/rails db:migrate

bin/rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
