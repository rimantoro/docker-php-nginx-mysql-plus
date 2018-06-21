# DOCKER STARTER - PHP-FPM NGINX MYSQL ++

This is docker starter with :
- PHP-FPM 7.1
- Nginx
- MySQL (MariaDB)
- MongoDB
- RabbitMQ
- Redis

This setup is itended for local development machine with multi domain via Nginx vhost.

## How To Run

```
# docker-compose up
```

## Nginx

This instance are using ```port 80```. Default vhost configuration for localhost are setup in ```./nginx/sites-enabled/000_site.conf```.

### Multiple Vhost

Vhost configuration located in ```./nginx/sites-enabled```. There is (by default) two vhost config for testing purpose, `web_1.local` and `web_2.local`.
Add entries in your `/etc/hosts` file on your host OS (I'm in OSX).

```
0.0.0.0	web_1.local
0.0.0.0	web_2.local
```

Run docker-compose up and access those site within your browser ( i.e: http://web_1.local )

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
* Addtionally : Add your vhost subdomain in ```docker-compose.yml``` in ```extra_hosts``` under ```php``` section, i.e ```"my_webapp.local:127.0.0.1"```.
* Rebuild docker with ```docker-compose build```. Makesure this step is success, otherwise you need to figure out your self.
* Set your ```hosts file``` and add my_webapp.local domain into it, so your host OS can access it. i.e ```0.0.0.0	my_webapp.local```


