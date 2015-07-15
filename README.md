# docker-test
Per chi utilizza boot2docker:
 - Aprire VirtualBox
 - Entrare nelle impostazioni di rete della virtual machine
 - Inoltrare le porte TCP 4567 e 9042 (sia Host che Guest) sull'indirizzo 127.0.0.1
 - Avviare boot2docker

Clonare questo repository:
git clone https://github.com/aiovine/docker-test.git

Entrare nella cartella:
cd docker-test

Fare il build dell'immagine:
docker build --tag=gruppoPBDMNG7/shortify.me ./

Una volta creata l'immagine, creare il container: 
docker run -d -name shortify.me -p 4567:4567 -p 9042:9042 gruppoPBDMNG-7/shortify.me

Entrare nel container:
docker exec -it shortify.me bash

Da shell lanciare il comando:
java -jar target/shortify.me.jar
