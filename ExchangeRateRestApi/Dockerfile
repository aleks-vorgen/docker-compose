FROM openjdk:17
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} exchange-rate-service.jar
ENTRYPOINT ["java", "-jar", "/exchange-rate-service.jar"]