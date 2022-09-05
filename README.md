# Mobydick

## Introduction

The purpose of this document is to build PHP development environment quickly and easily.

## Prerequisites

- Docker
- Apache
- MariaDB
- PHP Framework

## First

### Create a certificate

```bash
$ generate-cert.sh
```

Load the certificate at [Keychain Access](https://support.apple.com/ja-jp/guide/keychain-access/kyca1083/mac)

## Docker

### Start app containers

```bash
$ docker-compose up -d
```

### Install PHP Frameworks

#### [dockerfile-modern](https://github.com/limnxn/mobydick/blob/main/php/dockerfile-php-modern) PHP 8.1.4

- [CakePHP](https://cakephp.org/)

```bash
$ composer require cakephp/cakephp .
```

- [Laravel](https://laravel.com/)

```bash
$ composer create-project laravel/laravel .
```

- [Laravel Mix](https://laravel-mix.com/)

```bash
$ npm install
$ npm run watch
```

#### [dockerfile-legacy](https://github.com/limnxn/mobydick/blob/main/php/dockerfile-php-legacy) PHP 7.1

- [Koseven](https://koseven.dev/)

```bash
$ composer require koseven/koseven .
```

## Database

### Create a new connection

| Item     | Info        |
| -------- | ----------- |
| Host     | `127.0.0.1` |
| Port     | `3306`      |
| User     | `test`      |
| Password | `passw0rd`  |
| Database | `mobydick`  |

## FAQ

### Koseven

1. Unable exist the log file
   - Check path at `/application/config/log4php.properties`
2. Unable connect to database
   - Check setting at `/application/config/database.php`
3. Unable trust the host
   - Add host at `/application/config/url.php`
4. Unable apply the style
   - Match url at conditional operator in `/application/classes/Controller/Base.php`
5. Unable access the admin page
   - Check ip restrictions at `/application/classes/Controller/Admin/Base.php`
6. Unable login the admin page
   - Check `Cookie::$secure` and `Cookie::$domain` at `/application/bootstrap.php`
   - Delete `Application>Storage>Session` and `Application>Storage>Cookies` at Chrome DevTools
7. Unable display the event page
   - Create symbolic links
   - Run `$ ln -s /var/www/html/public/www/official /home/{appName}Official` for official
   - Run `$ ln -s /var/www/html/public/www/contents /home/contents` for contents
   - Run `$ ln -s /var/www/html/public/www/contents2 /home/contents2` for contents2
8. Unable register image of event page
   - Run `$ mkdir /mnt/{s3,s3/movie,s3/radio}` to add folder
   - Run `$ chmod -R 777 /mnt/s3` to change permission
