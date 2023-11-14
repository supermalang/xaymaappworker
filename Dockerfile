FROM php:8.2-cli

RUN apt-get update && apt-get install -y --no-install-recommends \
        libicu-dev \
        supervisor \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-source delete \
    && rm -rf /tmp/pear \
    && rm -rf /var/cache/apk/*

COPY ./consume-command.sh /entrypoint.sh
COPY ./messenger-worker.conf /etc/supervisor/supervisord.conf

USER www-data
WORKDIR /var/www/app.xayma.sh/

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

EXPOSE 9001