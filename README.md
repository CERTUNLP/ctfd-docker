# CTFd Docker Image for Importing Plugins via Environment Variables

This repository provides a Docker image for [CTFd](https://ctfd.io/), a Capture The Flag (CTF) platform, which allows you to import plugins into CTFd using environment variables.

## Features

- Based on the official CTFd image.
- Easily import CTFd plugins via environment variables during container creation.

## Usage

Add environment with list of plugins to import separated by comma like this:

```yaml
GIT_PLUGINS: "https://github.com/puckk/CTFd-Plugin-unique-token.git,https://github.com/TheArqsz/CTFd-gdrive-plugin.git"
```

You can check docker-compose.yml for example.

## Image

https://hub.docker.com/r/certunlp/ctfd/tags
