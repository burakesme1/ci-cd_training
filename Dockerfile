FROM maven:3.9.6-eclipse-temurin-17 AS build 
WORKDIR /build 
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src 
RUN MAVEN_OPTS="-Xmx1024m" mvn clean package -DskipTests


FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /build/target/demo-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]