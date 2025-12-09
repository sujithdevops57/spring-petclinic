FROM eclipse-temurin:25-jdk
RUN apt-get update && apt-get install -y git maven
WORKDIR /ram
RUN git clone https://github.com/spring-projects/spring-petclinic.git
RUN mvn -f spring-petclinic/pom.xml clean package -DskipTests
RUN ls -l /ram/spring-petclinic/target
RUN cp /ram/spring-petclinic/target/*-SNAPSHOT.jar /ram/app.jar
EXPOSE 8080
CMD ["java", "-jar", "/ram/app.jar"] 
