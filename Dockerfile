# Use OpenJDK 21 as the base image
FROM eclipse-temurin:21-jre-alpine

# Set working directory
WORKDIR /app

# Add a non-root user for security
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Set environment variables
ENV SPRING_PROFILES_ACTIVE=prod

# Copy the JAR file
COPY --chown=spring:spring app.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
