FROM maven:3.8.3-openjdk-17 AS man

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests=true
FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=man /app/target/*.jar /app/target/bg-dashboard.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/target/chat.jar"]