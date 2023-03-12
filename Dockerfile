FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

VOLUME /tmp

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

CMD ["./mvnw", ""]

COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]