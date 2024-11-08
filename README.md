## Steps to Modify a Container and Create a New Image Using Command Way 

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
