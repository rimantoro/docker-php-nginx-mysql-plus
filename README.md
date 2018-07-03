# DOCKER STARTER - PHP-FPM NGINX MYSQL ++

This is docker starter with :
- PHP-FPM 7.1
- Nginx

This setup is itended for local development machine with multi domain via Nginx vhost.

## How To Run

```
# docker-compose up --build
```

## Nginx

Every app need a container for it self (i.e meowth & terra) and map in different port (i.e meowth on 8081, terra on 8080). Default vhost configuration for localhost are setup in ```./nginx/sites-enabled```.

### Multiple Vhost

Dont forget to setup your ```/etc/hosts``` file


## Create Network and Support Stack

You can use my other container for supporting stack (i.e: MySQL, Redis, MongoDB, etc) at here : [https://github.com/rimantoro/docker_support_stack](https://github.com/rimantoro/docker_support_stack) . Before this container can be accessible from your container, you need to create a network ```my-shared-network``` or with other you name which you must define it on ```docker-compose.yml```

Create docker network with this command :

```
docker network create my-shared-network
```

## How To Add More Web App Project

I'm using vhost domain to separate webaap. You can add more webapp based on PHP with this step :
* Create a new folder inside ```app``` for your webapp. i.e ```app/my_webapp```.
* Setup your webapp nginx inside ```nginx/sites-enabled``` with full vhost subdomain and .conf as file extension. i.e ```nginx/sites-enabled/my_webapp.local.conf```.
* Setup other configuration related in your webapp.
* Set your container's domain via ```hostname``` in docker-compose.yml.
* Up and Rebuild (if necessary) docker with ```docker-compose up --build```. Makesure this step is success, otherwise you need to figure out your self :D.
* Set your ```hosts file``` and add my_webapp.local domain into it, so your host OS can access it. i.e ```0.0.0.0	my_webapp.local```


