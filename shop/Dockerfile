FROM openjdk:17
ARG JAR_FILE=target/*.war
COPY ${JAR_FILE} shop-server.war
ENTRYPOINT ["java", "-jar", "/shop-server.war"]