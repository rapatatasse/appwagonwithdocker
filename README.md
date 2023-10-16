

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