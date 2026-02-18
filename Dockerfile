# Start with Ubuntu as the base image
FROM ubuntu:24.04 AS base

# Install OpenJDK 17
RUN apt-get update && apt-get install -y openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

LABEL authors="mkb"

# Copy the JAR file into the container
COPY target/eurekaserver-prod-1.jar eurekaserver.jar

# Expose the port the app runs on
EXPOSE 8761:8761

#INSTALLING UTILITIES
#RUN apt-get update
#RUN apt-get install -y gcc
#RUN apt-get install -y curl


# Run the application
ENTRYPOINT ["java", "-Dspring.profiles.active=dev", "-jar", "eurekaserver.jar"]
