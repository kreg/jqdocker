# Docker Instructions

* `git clone` the JQ-SVR under this directory.
* Using `mysqldump` for the database you want to use, create a `dump.sql` file in this directory.
* `make build` to build the jq-svr/app:latest docker image. Should only have to do that once unless you change
  the Dockerfile or the my-app-entrypoint.sh file.
* `make` to build `mariadb` and `app` docker containers.
* `make mariadb-logs` to watch the logs from mariadb. Ctrl-C to exit.
* `make app-logs` to watch the logs from the app. Ctrl-C to exit.
* Once the mariadb logs show the "Starting mysqld daemon with databases from /opt/bitnami/mariadb/data" line, you can load the database.
* `make populate-db` to populate the database.
* Confirm everything running normally.
* `make stop` to shut everything down.
* `make clean` if you want to remove docker image.
