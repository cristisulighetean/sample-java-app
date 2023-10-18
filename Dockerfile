# Step 1: Build the application
FROM maven:3.9.4-amazoncorretto-11-al2023 as builder

# Set the working directory
WORKDIR /app

# Copy pom.xml and the source code to the working directory
COPY pom.xml .
COPY src /app/src

# Build the application
RUN mvn clean package

# Step 2: Create a clean image and copy the built application
FROM amazoncorretto:11-al2023

# Set the working directory
WORKDIR /app

# Copy the jar file from the builder image
COPY --from=builder /app/target/*.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]
