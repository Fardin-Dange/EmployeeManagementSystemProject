FROM eclipse-temurin:17-jdk

WORKDIR /app
COPY . .

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# WAR explode karo
RUN mkdir -p /app/exploded && \
    cd /app/exploded && \
    jar -xf /app/target/Spring_MVC_emsProject-0.0.1-SNAPSHOT.war

EXPOSE 8080

CMD ["java", \
     "-cp", "/app/exploded/WEB-INF/classes:/app/exploded/WEB-INF/lib/*", \
     "org.springframework.boot.loader.WarLauncher"]