#!/bin/bash

# Image built with composer created vendor dependencies in /tmp/vendor. Copy them to where they should go.
cp -a /tmp/vendor /app/JQ-SVR/vendor

# copy customized config files
cp /app/database.php /app/JQ-SVR/application/config/
cp /app/settings.php /app/JQ-SVR/application/config/

# start it
exec /app-entrypoint.sh "$@"
