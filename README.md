# CTFd Docker Image for Importing Plugins and Themes via Environment Variables

This repository provides a Docker image for [CTFd](https://ctfd.io/), a Capture The Flag (CTF) platform, which allows you to import plugins and themes into CTFd using environment variables.

## Features

- Based on the official CTFd image.
- Easily import CTFd plugins and themes via environment variables during container creation.

## Usage Plugins

Add environment with list of plugins to import separated by comma like this:

```yaml
GIT_PLUGINS: "https://github.com/puckk/CTFd-Plugin-unique-token.git,https://github.com/TheArqsz/CTFd-gdrive-plugin.git"
```

You can check docker-compose.yml for example.

## Usage Themes

Add environment that starts with `GIT_THEMES_` and ends with theme name. Value should be `<git-url>,<folder-name>`.

```yaml
GIT_THEMES_pixo: "https://github.com/hmrserver/CTFd-theme-pixo.git,pixo"
GIT_THEMES_odin: "https://github.com/0xdevsachin/CTFD-odin-theme.git,odin"
```

You can check docker-compose.yml for example.


## Image

https://hub.docker.com/r/certunlp/ctfd/tags
