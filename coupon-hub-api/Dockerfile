FROM eclipse-temurin:17-jdk
EXPOSE 8175
WORKDIR /app
COPY target/coupon-hub-service-0.0.1-SNAPSHOT.jar coupon-hub-service.jar
ENTRYPOINT ["java", "-jar", "coupon-hub-service.jar"]
