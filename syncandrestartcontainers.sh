docker-machine restart local

eval $(docker-machine env local)

eval $(ssh-agent)

docker-machine ssh local mkdir -p myapp
docker-machine ssh local mkdir -p myapp

ssh-add ~/.docker/machine/machines/local/id_rsa
rsync -avzhe ssh --relative --omit-dir-times --progress ./ docker@$(docker-machine ip local):/myapp

docker-compose build
# docker-compose up