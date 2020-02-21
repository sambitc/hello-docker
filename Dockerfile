FROM anapsix/alpine-java 
LABEL maintainer="sambitc@choudhury.com" 
COPY /target/hello-docker-app.jar /home/hello-docker-app.jar 
CMD ["java","-jar","/home/hello-docker-app.jar"]

