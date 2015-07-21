# docker-test
Per chi utilizza boot2docker:
 - Aprire VirtualBox
 - Entrare nelle impostazioni di rete della virtual machine
 - Inoltrare le porte TCP 4567 e 9042 (sia Host che Guest) sull'indirizzo 127.0.0.1
 - Avviare boot2docker

1. Clonare questo repository:
<pre>git clone https://github.com/aiovine/docker-test.git</pre>

2. Entrare nella cartella:
<pre>cd docker-test</pre>

3. Fare il build dell'immagine:
<pre>docker build --tag=gruppo_pbdmng_7/shortify.me ./</pre>

4. Una volta creata l'immagine, creare il container: 
<pre>docker run -d --name shortify.me -p 4567:4567 -p 9042:9042 gruppo_pbdmng_7/shortify.me</pre>

5. Entrare nel container:
<pre>docker exec -it shortify.me bash</pre>

6.Da shell lanciare il comando:
<pre>./start-server</pre>

Per eseguire soltanto i test JUnit è possibile invece lanciare lo script
<pre>./test-server</pre>
