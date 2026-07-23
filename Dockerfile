FROM ubuntu
WORKDIR /app
COPY . .
sudo apt update && apt install openjdk21jdk -y
RUN mvn install
RUN mv target/*.jar App.jar
CMD ["java","-jar","App.jar"]

