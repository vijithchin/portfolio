FROM ubuntu AS build
WORKDIR /app
RUN apt update && apt install -y openjdk-21-jdk maven 
COPY . .
RUN mvn install
RUN mv target/*.jar App.jar

FROM eclipse-temurin:21-jre-alpine
WORKDIR /build
COPY --from=build /app/App.jar .
CMD ["java", "-jar", "App.jar"]
