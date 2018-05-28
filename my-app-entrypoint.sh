#!/bin/bash
cp -a /tmp/vendor /app/JQ-SVR/vendor
exec /app-entrypoint.sh "$@"
