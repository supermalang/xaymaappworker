# Docker Companion Container for Running Symfony Messenger Consumers

This Docker container is designed to run the consumers of the Symfony Messenger Component of the Xayma.sh app. It includes a PHP CLI environment and sets up cron jobs that can be configured by users.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
  - [Web App Configuration](#web-app-configuration)

## Prerequisites

Before using this container, ensure you have the following prerequisites:

- Docker installed on your system.

## Usage

To use this Docker container, follow these steps:

1. Pull the Docker image from Docker Hub:

   ```bash
   docker pull supermalang/xaymaappworker:latest
   ```

2. Create a container from the image:

    ```bash
    docker run -d supermalang/xaymaappworker:latest
    ```

The container will start consuming the workers and kill them periodically. 

## Web App Configuration
When running the container, make sure you mount the Xayma.sh web app at `/var/wwww/app.xayma.sh/`.

To do this: 

    ```bash
    docker run -d -v /path/to/your/app.xayma.sh:/var/www/app.xayma.sh supermalang/xaymaappcron:latest
    ```

Replace /path/to/your/app.xayma.sh with the local path to the app.

You can try this configuration in a docker-compose file as well.

---