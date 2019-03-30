FROM ubuntu:16.04
LABEL Maintainer=Nilesh
RUN apt-get update && apt-get install unzip -y
RUN apt-get -y install software-properties-common
RUN apt-get -y update
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
RUN apt-get -y install oracle-java8-installer
ENV JAVA_HOME="/usr/lib/jvm/java-8-oracle"
RUN mkdir -p /opt/tomcat
WORKDIR /opt/tomcat 
ADD http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.zip /opt/tomcat 
RUN unzip apache-tomcat-8.5.38.zip -d /opt/tomcat
RUN mv apache-tomcat-8.5.38  tomcat
RUN chmod -R 777 /opt/tomcat/tomcat/bin/*
EXPOSE 8080
CMD ["java","-jar","shopizer-0.0.1-SNAPSHOT.war"]
