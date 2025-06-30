# PHP Docker
================

A PHP development environment using Docker.

## Description

This project provides a complete PHP development environment, with Apache, PHP, and MySQL, all configured and ready to use.

## Features

* PHP 8.1 (configurable via the `PHP_VERSION` environment variable)
* Apache with mod_php
* MySQL (with phpMyAdmin for administration)
* Composer for dependency management
* Apache configuration with rewrite module enabled

## Usage

1. Clone the repository: `git clone https://github.com/your-repo/php-docker.git`
2. Create a `.env` file with the desired environment variables (see example below)
3. Run `docker-compose up -d` to start the containers in the background
4. Access your PHP application at `http://localhost:8888`
5. Access phpMyAdmin at `http://localhost:8889`

## Example `.env` file

```makefile
PORT=8888
PHP_VERSION=8.1
```

## Licencia

[![GPLv3](https://www.gnu.org/graphics/gplv3-127x51.png)](https://www.gnu.org/licenses/gpl-3.0.html)

Este proyecto se distribuye bajo la licencia **GNU General Public License versión 3 (GPLv3)**.
