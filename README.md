# Docker Companion Container for Running Symfony Messenger Consumers

This Docker container is designed to run the consumers of the Symfony Messenger Component of the Xayma.sh app. It is a simple straightforward container.

## Prerequisites

Before using this container, ensure you have the following prerequisites:

- Docker installed on your system.
- And the Xayma.sh Platform (with all of its components)
- It is a "Companion" container, so make sure it runs alongside the Xayma.sh app and necessary containers, in a docker-compose or any other relevant configuration.

## Usage

To use this Docker container, follow these steps:

1. Pull the Docker image from Docker Hub:

   ```bash
   docker pull supermalang/xaymaappworker:latest
   ```

2. To test the execution of the container you can do :
  ```bash
  docker run -d -v /path/to/your/app.xayma.sh:/var/www/app.xayma.sh supermalang/xaymaappcron:latest
  ```

Replace `/path/to/your/app.xayma.sh` with the local path to the app.

3. If you use docker-compose, make sure to mount the Xayma.sh web app folder. Use the example below and configure accordingly :
```yaml
# docker-compose.yml
version: '3'
services:
  myworker:
      image: supermalang/xaymaappworker:latest
      depends_on:
        - app
      container_name: myappworker
      restart: unless-stopped
      volumes:
        - vol_app:/var/www/app.xayma.sh
```

Then start your containers
```bash
docker-compose up -d
```

4. Enjoy 🎉

The container will start consuming the workers and kill them periodically. Default time limit is 10 minutes

---