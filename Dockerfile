# A Dockerfile is a text document that contains all the commands needed to build an image.
# It has a list of instructions that are executed in order to create the image.
# The instructions are kept in the Dockerfile at the root of the context of your image.
#FROM instruction sets the base image for the new image. In this case, the base image is the official
#openjdk:24-jdk image, which is a JDK (Java Development Kit) version 24 image. This image is used to provide
#the necessary environment for running the application.
#FROM instruction sets the base image for the new image. In this case, the base image is the official
#openjdk:24-jdk image, which is a JDK (Java Development Kit) version 24 image. This image is used to provide
#the necessary environment for running the application.
FROM openjdk:24-jdk
#ADD instruction copies new files or directories from <source> and adds them to the filesystem of the image at the path <destination>
ADD  target/my-spring-app-demo.jar my-spring-app-demo.jar
#The EXPOSE 8080 instruction tells Docker that the application inside the container is listening on port 8080. 
#This means that when the container is running, it will be able to receive incoming requests on port 8080. 
#However, it does not automatically make the port accessible from outside the container. To do that, you would need to use the -p flag when running the container, like this: docker run -p 8080:8080 my-container.
EXPOSE 8080
# An ENTRYPOINT allows you to configure a container that will run as an executable.
# The ENTRYPOINT specifies a command that will always be executed when the container starts.
ENTRYPOINT ["java", "-jar", "my-spring-app-demo.jar"]

# To build this image, run the following command in terminal from the same directory as this file:
# $ docker build -t kk/my-spring-app-demo:v3  my-spring-app .
#
# The -t flag allows us to specify a name for the image we're building. 
# The syntax for this flag is: -t <name>, where <name> is the name we want to give to the image.
# The :v3 at the end of the name specifies the version of the image.





# Dockerfile Syntax Reference
#Keyword	Purpose
#FROM	Defines the base image.
#RUN	Runs commands in the container during build.
#COPY	Copies files from the host to the container.
#ADD	Similar to COPY, with extra features like extraction.
#CMD	Defines the default command when running the container.
#ENTRYPOINT	Sets the main application/process to run in the container.
#ENV	Sets environment variables.
#EXPOSE	Exposes a port for external access.
#WORKDIR	Sets the working directory inside the container.
#USER	Specifies the user to run commands.
#VOLUME	Defines a mount point to persist data.
#ARG	Sets a build-time variable.
#ONBUILD	Specifies a trigger for child images.
#LABEL	Adds metadata to the image.
#SHELL	Specifies a custom shell for commands.