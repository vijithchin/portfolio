FROM ubuntu
WORKDIR /app
RUN apt update && apt install openjdk-21-jdk -y
RUN apt install maven -y
COPY . .
RUN mvn install
RUN mv target/*.jar App.jar
CMD ["java","-jar","App.jar"]
