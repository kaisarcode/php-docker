# PHP Docker

A PHP development environment using Docker.

## Description

This project provides a complete PHP development environment, with Apache, PHP, and MySQL, all configured and ready to use.

## Features

- **PHP 8+** with Apache (mod_php)
- **MySQL** database with persistent storage
- **phpMyAdmin** for database management
- **Composer** for PHP dependency management
- **Configurable via `.env` file**
- **Customizable ports** for all services

## Usage

1. Clone the repository: `git clone https://github.com/your-repo/php-docker.git`
2. Create a `.env` file with the desired environment variables (see example below)
3. Run `docker-compose up -d` to start the containers in the background
4. Access your PHP application at `http://localhost:8888`
5. Access phpMyAdmin at `http://localhost:8889`

## .env file

```makefile
PROJID="phproj"         # Project identifier used as prefix for container names and networks
WEB_PORT=8888           # Host port mapped to the PHP/Apache web server container
PMA_PORT=8889           # Host port mapped to the phpMyAdmin container
DB_USER="admin"         # MySQL database username
DB_PASS="admin"         # MySQL database password
MA_USER="admin"         # phpMyAdmin username
MA_PASS="admin"         # phpMyAdmin password
DBIMAGE="mysql:8"       # MySQL Docker image version to use
```

## PHP version
The PHP version id configurable via the `PHP_VERSION` environment variable in the Dockerfile.

## License

[![GPLv3](https://www.gnu.org/graphics/gplv3-127x51.png)](https://www.gnu.org/licenses/gpl-3.0.html)

This project is licensed under the **GNU General Public License version 3 (GPLv3)**.
