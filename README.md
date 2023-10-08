# Docker Companion Container for Running Cron Jobs with PHP

This Docker container is designed to run cron jobs with PHP. It includes a PHP CLI environment and sets up cron jobs that can be configured by users.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
  - [Cron Job Configuration](#cron-job-configuration)
- [Logs](#logs)

## Prerequisites

Before using this container, ensure you have the following prerequisites:

- Docker installed on your system.

## Usage

To use this Docker container, follow these steps:

1. Pull the Docker image from Docker Hub:

   ```bash
   docker pull supermalang/xaymaappcron:latest
   ```

2. Create a container from the image:

    ```bash
    docker run -d supermalang/xaymaappcron:latest
    ```

The container will start running cron jobs as per the default schedule (every minute and every five minutes) using the taskstorun.sh script.

## Cron Job Configuration
You can configure your own cron jobs by mounting your own taskstorun.sh scripts. To do this:

Prepare your taskstorun.sh scripts and save it locally.

Mount your script into the container and specify your own cron schedule by using environment variables:

    ```bash
    docker run -d -v /path/to/your/taskstorun.sh:/etc/cron.d/taskstorun.minute.sh supermalang/xaymaappcron:latest
    ```
Replace /path/to/your/taskstorun.sh with the local path to your script.

The configuration above runs every minute. If you want to run the cron jobs on a different schedule, use one of the mount paths below accordingly:
* /etc/cron.d/taskstorun.fiveminutes.sh
* /etc/cron.hourly/taskstorun.hourly.sh
* /etc/cron.daily/taskstorun.daily.sh


## Logs
Cron job execution logs are written to /var/log/cron.log inside the container. You can access them using the following command:

---