

https://www.youtube.com/watch?v=J7hUHnQtFNo&t=206s
1/ build image

docker build --tag wagonapp .

2/Lancer l'app dans docker
 docker run wagonapp


3/docker-compose up


4/ run migration
dans nouveau terminal commande rails avec 
docker-compose run web bin/rails db:migrate


sur linux
si manque permission :
rajouter permission sur bin/
chmod u+x bin/rails

sinon telechager l'image en local 
créer l'image en Local
docker save couchbase > couchbase.tar
et partage rl'image
remonter l'image en local
docker load < couchbase.tar.xz

Puis dans docker-compose
changer     build: . en image "et nom de l'image"


   


executer rails depuis utre terminal
docker exec -it wagonapp_web_1 sh  
./bin/rails generate scaffold Products name:string comment:text price:float user:references
./bin/rails db:migrate