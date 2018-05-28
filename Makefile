DEV_ORG = kmcdaniel-test
APP_IMAGE = jq-app
VERSION = $(shell cd JQ-SVR && git rev-parse --short HEAD)

all: build jq-app

build:
	@docker build -t ${DEV_ORG}/${APP_IMAGE}:${VERSION} -f Dockerfile .

jq-db:
	docker run \
		--rm \
		-d \
		--name jq-db \
		-v ${PWD}:/app \
		-e ALLOW_EMPTY_PASSWORD=yes \
		-e MARIADB_DATABASE=tripnscan_stg \
		bitnami/mariadb:latest


jq-app: jq-db
	docker run \
		--rm \
		-d \
		--name jq-app \
		-v ${PWD}:/app \
		-p 8000:8000 \
		--link=jq-db \
		${DEV_ORG}/${APP_IMAGE}:${VERSION}

staging-db:
	docker exec -it jq-db sh -c "mysql -u root tripnscan_stg < /app/schema.sql"

jq-app-bash:
	docker exec -it jq-app bash

jq-db-bash:
	docker exec -it jq-db bash

jq-app-logs:
	docker logs -f jq-app

jq-db-logs:
	docker logs -f jq-db

clean:
	-docker stop jq-app jq-db
	-docker rmi -f ${DEV_ORG}/${APP_IMAGE}:${VERSION}
