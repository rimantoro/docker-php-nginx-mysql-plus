# DOCKER STARTER - PHP-FPM NGINX MYSQL ++

This is docker starter with :
- PHP-FPM 7.1
- Nginx
- MySQL (MariaDB)
- MongoDB
- RabbitMQ
- Redis

## How To Run

```
# docker-compose up
```

## MySQL

MySQL persistence data will be saved into ```./data/mysql``` within this root project, so it will still available if you're running ```docker-compose down```.
```
Host : 0.0.0.0:3306
User : root
Pass : masukaja
```

## MongoDB

Same with MySQL, data are persistence and will be saved in ```./data/mongodb```.
```
Host : 0.0.0.0:27017
User : None
Pass : None
```

## Redis

```
Host : 0.0.0.0:6379
User : None
Pass : None
```

## RabbitMQ

Installed with management plugin.

```
Service Host : 0.0.0.0:5672
Web Management : 0.0.0.0:15672
User : rabbitmq
Pass : rabbitmq
```
