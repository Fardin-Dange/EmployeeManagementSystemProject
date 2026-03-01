FROM eclipse-temurin:17-jdk

WORKDIR /app
COPY . .

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

EXPOSE 8080

# CHANGED: target file is now .war, but still runs with java -jar
CMD ["java", "-jar", "target/Spring_MVC_emsProject-0.0.1-SNAPSHOT.war"]