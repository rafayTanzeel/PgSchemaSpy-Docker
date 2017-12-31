FROM openjdk:8u151-jdk-slim
MAINTAINER Rafay Tanzeel <rafaytanzeel@gmail.com>

RUN apt-get update &&\
    apt-get install -y graphviz wget &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    wget https://github.com/schemaspy/schemaspy/releases/download/v6.0.0-rc2/schemaspy-6.0.0-rc2.jar -O schemaspy.jar &&\
    wget https://jdbc.postgresql.org/download/postgresql-42.1.4.jar -O postgresql-jdbc.jar

VOLUME /output
ENTRYPOINT [ "java", "-jar", "schemaspy.jar", "-t", "pgsql", "-dp", "postgresql-jdbc.jar", "-o", "/output"]
