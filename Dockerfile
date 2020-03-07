FROM maven:3.6.1-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM openjdk:8-jre-alpine
EXPOSE 7000
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/javalin-rest-1.0.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

