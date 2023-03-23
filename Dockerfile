#
# Build stage
#
FROM maven:3.8.3-openjdk-16-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY --from=build /home/app/target/mentoring-apis-0.0.1-SNAPSHOT /usr/local/lib/demo.jar
ENTRYPOINT ["java","-jar","/app.jar"]