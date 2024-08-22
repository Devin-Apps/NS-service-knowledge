# Build stage
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/notification-service-1.0-SNAPSHOT.jar .
COPY config.yml .
EXPOSE 8080
CMD ["java", "-jar", "notification-service-1.0-SNAPSHOT.jar", "server", "config.yml"]
