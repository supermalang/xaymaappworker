FROM php:cli-bullseye

RUN apt-get update && apt-get install -y --no-install-recommends cron \
    && docker-php-ext-install mysqli pdo pdo_mysql

COPY ./taskstorun.sh  /etc/cron.d/taskstorun.minute.sh
COPY ./taskstorun.sh  /etc/cron.d/taskstorun.fiveminutes.sh
COPY ./taskstorun.sh  /etc/cron.hourly/taskstorun.hourly.sh
COPY ./taskstorun.sh  /etc/cron.daily/taskstorun.daily.sh

RUN echo "* * * * * /bin/bash /etc/cron.d/taskstorun.minute.sh >> /var/log/cron.log" >> /etc/crontab \
    && echo "*/5 * * * * /bin/bash /etc/cron.d/taskstorun.fiveminutes.sh >> /var/log/cron.log" >> /etc/crontab \
    && chmod +x /etc/cron.d/taskstorun.minute.sh \
    && chmod +x /etc/cron.d/taskstorun.fiveminutes.sh \
    && chmod +x /etc/cron.hourly/taskstorun.hourly.sh \
    && chmod +x /etc/cron.daily/taskstorun.daily.sh \
    && chmod 0644 /etc/crontab \
    && crontab /etc/crontab \
    && touch /var/log/cron.log \
    && rm -rf /var/lib/apt/lists/*

CMD cron -f
