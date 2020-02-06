## First phase
FROM maven:3.6.3-jdk-11 AS build
# Creating app directory
WORKDIR /tmp
# Copying Application
COPY springapp ./
# cache maven dependencies offline
RUN mvn dependency:go-offline
# Getting .m2 libraries
RUN mvn clean package


## Second Phase
FROM openjdk:11  
# Creating app directory
WORKDIR /usr/src/app
# Copying Jar
COPY --from=build /tmp/target/guybrush-1.0-SNAPSHOT.jar /usr/app/guybrush-1.0-SNAPSHOT.jar
# Exposing Port
EXPOSE 8080
# Running App
ENTRYPOINT ["java","-jar","/usr/app/guybrush-1.0-SNAPSHOT.jar"]  
