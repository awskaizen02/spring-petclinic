FROM eclipse-temurin:17-jdk-jammy AS builder
WORKDIR /app
COPY spring-petclinic/ .
RUN ./mvnw package -DskipTests

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/spring-petclinic-3.4.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
