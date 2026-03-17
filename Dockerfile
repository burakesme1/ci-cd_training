# -------- BUILD --------
    FROM maven:3.9.9-eclipse-temurin-17 AS builder

    WORKDIR /build
    
    COPY pom.xml .
    RUN mvn -B -ntp dependency:go-offline
    
    COPY src src
    RUN mvn -B -ntp package -DskipTests
    
    
    # -------- RUNTIME --------
    FROM gcr.io/distroless/java17-debian12
    
    WORKDIR /app
    
    COPY --from=builder /build/target/*.jar app.jar
    
    USER nonroot
    
    EXPOSE 8080
    
    ENTRYPOINT ["java","-jar","app.jar"]