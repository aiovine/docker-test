FROM cassandra:latest

#ports
EXPOSE 4040
EXPOSE 4567
EXPOSE 8042
EXPOSE 9042
EXPOSE 9160

#Get repositories for java8
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update

#Install JDK 8
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install oracle-java8-installer -y

#Install Git
RUN apt-get install git -y 

#Install maven
RUN apt-get install maven -y

#Get the source repository
RUN git clone https://github.com/GruppoPBDMNG-7/shortify.me

#move the client files to the root
RUN mv /shortify.me/ClientAngular /

#create the start server file and make it executable
RUN echo '#!/bin/bash' >> /start-server
RUN echo 'cd /shortify.me/ServerJava' >> /start-server
RUN echo 'mvn package' >> /start-server
RUN echo 'java -jar target/shortify.me.jar' >> /start-server
RUN chmod 755 /start-server

#create a test script and make it executable
RUN echo '#!/bin/bash' >> /test-server
RUN echo 'cd /shortify.me/ServerJava' >> /test-server
RUN echo 'mvn test' >> /test-server
RUN chmod 755 /test-server
