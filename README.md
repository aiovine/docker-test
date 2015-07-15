# docker-test
Entrare in boot2docker e clonare questo repository

Entrare nella cartella docker-test, e fare docker build --tag=gruppoPBDMNG-7/shortify.me ./

Una volta creata l'immagine, creare il container facendo docker run -d -p 4567:4567 -p 9042:9042 gruppoPBDMNG-7/shortify.me

Entrare nel container facendo docker exec -it \<id del container\> bash, e da shell lanciare il comando:

java -jar target/shortify.me.jar
