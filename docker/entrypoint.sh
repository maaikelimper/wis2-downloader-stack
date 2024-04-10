#!/bin/bash

echo "START /entrypoint.sh"

set -e

# ensure cron is running
service cron start
service cron status

echo "END /entrypoint.sh"
exec "$@"
