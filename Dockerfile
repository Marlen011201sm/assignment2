FROM openjdk:17.0.1-oracle
VOLUME /tmp
WORKDIR /app
LABEL authors="Marlen Seiitzhan"

COPY *.jar app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
EXPOSE 8080
