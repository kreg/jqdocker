# See https://hub.docker.com/r/bitnami/codeigniter/ and https://github.com/bitnami/bitnami-docker-codeigniter.
FROM bitnami/codeigniter:latest

# Copied from codeigniter docker-compose.yml
LABEL kompose.service.type=nodeport

# Install and run composer, creates vendor directory of dependencies in /tmp.
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
WORKDIR /tmp
COPY ./JQ-SVR/composer.json .
RUN composer install

# Without this, we'd have to rename the JQ-SVR directory to "myapp". See
# https://github.com/bitnami/bitnami-docker-codeigniter/blob/master/3/Dockerfile.
ENV CODEIGNITER_PROJECT_NAME="JQ-SVR"

# Instead of using /app-entrypoint.sh, use our own entrypoint that copies /tmp/vendor, created by composer
# above, into our project.
COPY ./my-app-entrypoint.sh /
ENTRYPOINT ["/my-app-entrypoint.sh"]
CMD ["php", "-S", "0.0.0.0:8000"]

WORKDIR /app
