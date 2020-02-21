FROM anapsix/alpine-java 
LABEL maintainer="sambitc@choudhury.com" 
COPY /target/hello-docker-0.0.1-SNAPSHOT.jar /home/hello-docker-0.0.1-SNAPSHOT.jar 
CMD ["java","-jar","/home/hello-docker-0.0.1-SNAPSHOT.jar"]

