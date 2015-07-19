# docker-test
Per chi utilizza boot2docker:
 - Aprire VirtualBox
 - Entrare nelle impostazioni di rete della virtual machine
 - Inoltrare le porte TCP 4567 e 9042 (sia Host che Guest) sull'indirizzo 127.0.0.1
 - Avviare boot2docker

Clonare questo repository:
<pre>git clone https://github.com/aiovine/docker-test.git</pre>

Entrare nella cartella:
<pre>cd docker-test</pre>

Fare il build dell'immagine:
<pre>docker build --tag=gruppo_pbdmng_7/shortify.me ./</pre>

Una volta creata l'immagine, creare il container: 
<pre>docker run -d --name shortify.me -p 4567:4567 -p 9042:9042 gruppo_pbdmng_7/shortify.me</pre>

Entrare nel container:
<pre>docker exec -it shortify.me bash</pre>

Da shell lanciare il comando:
<pre>java -jar target/shortify.me.jar</pre>
