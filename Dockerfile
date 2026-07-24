FROM ubuntu
WORKDIR /app
COPY . .
RUN apt update && apt install openjdk-21-jdk -y
RUN apt install maven -y
RUN mvn install
RUN mv target/*.jar App.jar
CMD ["java","-jar","App.jar"]

