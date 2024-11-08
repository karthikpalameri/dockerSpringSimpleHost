## Steps to Modify a Container and Create a New Image Using Command Way 

My Spring App Demo
======================

Overview
This is a Java application built using Spring Boot. It is packaged as a Docker image for easy deployment.

Requirements

### Prerequisites

- Docker installed on your machine
- Java 24 (or later) installed on your machine

### Building the Docker Image

To build the Docker image, run the following command from the root directory of this project:

```bash
docker build -t kk/my-spring-app-demo:v3 .
```

# Build the Docker image

docker build -t kk/my-spring-app-demo:v3 .

# Running the Docker Container

# To run the Docker container, use the following command:

docker run -p 8080:8080 kk/my-spring-app-demo:v3

```
## Running the Container

To start the container and map port 8080 on your local machine to port 8080 in the container, run the following command:

```bash
docker run -p 8080:8080 kk/my-spring-app-demo:v3
```

## Accessing the Application

Once the container is running, you can access the application by visiting [http://localhost:8080](http://localhost:8080)
in your web browser.

## Dockerfile Overview

The Dockerfile used to build this image is located in the root directory of this project. It uses the official OpenJDK
24 image as the base image and copies the `my-spring-app-demo.jar` file into the image. It also exposes port 8080 and
sets the default command to run the application using Java.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

## Old Way(NOT RECOMMENDED): Steps to Create a New Image with a JAR File

Follow these steps to put a JAR file into a container and create a new image to share with your team or others:

1. **Run the OpenJDK Container Interactively:**

   ```sh
   docker run -it openjdk:24-jdk
   ```

2. **List Contents Inside the Container:**

   ```sh
   docker exec suspicious_lamarr ls /tmp
   ```

3. **Copy JAR/File to Container's Temp Folder:**

   ```sh
   docker cp ./target/my-spring-app-demo.jar suspicious_lamarr:/tmp
   ```

4. **Commit Changes and Create a New Image:**

   ```sh
   docker commit suspicious_lamarr kk/simple-rest-demo:v1
   ```

5. **Verify and Run the New Image:**

   ```sh
   docker images
   docker run kk/simple-rest-demo:v1
   ```

   This will open a JShell session.

6. **Update the Default Command:**

   ```sh
   docker commit --change="CMD java -jar /tmp/my-spring-app-demo.jar" suspicious_lamarr kk/simple-rest-demo:v2
   ```

7. **Map Host Port to Container Port:**

   ```sh
   docker run -p 8080:8080 kk/simple-rest-demo:v2
   ```
