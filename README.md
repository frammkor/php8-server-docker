# PHP-Server with Docker

The propose of this repo is to practice and set the bases for the next versions of PHP-Server that will include:

1. Migration of project to PHP 8 and Laminas Framework
2. Improve automation and deployment in various environments
3. Ease development experience
4. Inclusion of new tools to improve code quality

## Requirements

### Stack

- MySQL 5.7
- Linux Kernel 5.4
- Apache 2.4.56
- PHP 8.3
- Composer 2.3.2
- Node v17.8.0

### Tools

- [X] Laminas Project
- [X] Docker
- [ ] PHPStan
- [ ] Rector
- [ ] Husky
- [ ] Linter
- [ ] Webpack
- [ ] Vue3

### Other changes

- [ ] DB dev experience upgrade
- [ ] Use of environmental variables on across all the stack

### TODOS

- [x] Connect this database container with existing local db storage
- [ ] Properly set the root user and its password
- [ ] Move this information to [Docker secrets](https://docs.docker.com/compose/use-secrets/)
- [ ] Properly set the db user and its password to access from the phpmyadmin


## Sources

### Docker
[Build a Full Stack Web App in PHP and MySQL with Docker from scratch!](https://www.youtube.com/watch?v=2Bxh5FNGznQ)
[Docker and PHP Full Course](https://www.youtube.com/playlist?list=PLQH1-k79HB396mS8xRQ5gih5iqkQw-4aV)
[Docker and PHP Full Course REPO](https://github.com/GaryClarke/docker-php/tree/develop)
[PHP web development environment with Docker tutorial - 001](https://www.youtube.com/playlist?list=PLQH1-k79HB396mS8xRQ5gih5iqkQw-4aV)

[ENV EXAMPLE: Laravel Docker Course | Complete Laravel Dockerization](https://www.youtube.com/watch?v=WahJ91Nrgn0)

### Laminas


[Getting Started with Laminas A skeleton application](https://docs.laminas.dev/tutorials/getting-started/skeleton-application/)

Can be useful to understand all the elements components and services that are used in Laminas when creating entities: [starterKit](http://laminasstarterkit.omelak.com/)

[Laminas project structure](https://www.youtube.com/watch?v=pYGmcV5xdtw&ab_channel=ComparedProgramming)
[Laminas Tutorial Espanol](https://www.youtube.com/watch?v=_GzTgVuJuG0)
[Getting started with Laminas MVC PHP 8 and Doctrine ORM Album Module](https://www.youtube.com/watch?v=POKBupriaPE&t=902s&ab_channel=OsiesiefoTechnologies)


### PHPStan and other tools
[Measure PHP Code Quality With Static Analysis Using PHPStan](https://www.youtube.com/watch?v=OiS2xGVWEa0)
[adamculp/php-code-quality](https://hub.docker.com/r/adamculp/php-code-quality)

### To watch

- [ ] [How to run your PHP app in docker with MySql](https://www.youtube.com/watch?v=ZFCR1nERKBk)
- [ ] [How to Fix and Debug Docker Containers Like a Superhero](https://www.docker.com/blog/how-to-fix-and-debug-docker-containers-like-a-superhero/)

- [ ] [Best practices for building a production-ready Dockerfile for PHP applications](https://snyk.io/blog/building-production-ready-dockerfile-php/)

## Usage

From the root directory run 'docker-composer up -d' to start all the services

To access a terminal on any service's container run `docker-compose exec <service-name> /bin/bash`
In the case of the server run `docker-compose exec server /bin/bash`