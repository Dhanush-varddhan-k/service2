FROM openjdk:11-jre-slim
COPY target/service2.jar /app/service2.jar
ENTRYPOINT ["java", "-jar", "/app/service2.jar"]

