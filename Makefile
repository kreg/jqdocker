DEV_ORG = kmcdaniel-test
APP_IMAGE = app
# VERSION = $(shell cd JQ-SVR && git rev-parse --short HEAD)
VERSION = latest

all: app

build:
	@docker build -t ${DEV_ORG}/${APP_IMAGE}:${VERSION} -f Dockerfile .

mariadb:
	docker run \
		--rm \
		-d \
		--name mariadb \
		-v ${PWD}:/app \
		-e ALLOW_EMPTY_PASSWORD=yes \
		-e MARIADB_DATABASE=tripnscan \
		bitnami/mariadb:latest


app: mariadb
	docker run \
		--rm \
		-d \
		--name app \
		-v ${PWD}:/app \
		-p 8000:8000 \
		--link=mariadb \
		${DEV_ORG}/${APP_IMAGE}:${VERSION}

populate-db:
	docker exec -it mariadb sh -c "mysql -u root tripnscan < /app/dump.sql"

app-bash:
	docker exec -it app bash

mariadb-bash:
	docker exec -it mariadb bash

app-logs:
	docker logs -f app

mariadb-logs:
	docker logs -f mariadb

stop:
	-docker rm -f app mariadb

clean:
	-docker rmi -f ${DEV_ORG}/${APP_IMAGE}:${VERSION}
