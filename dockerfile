FROM centos
WORKDIR /opt
RUN yum update -y
RUN yum install wget -y
RUN wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u282-b08/OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
RUN tar -zxvf OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
RUN mv jdk8u282-b08 java8
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.65/bin/apache-tomcat-8.5.65.tar.gz
RUN tar -zxvf apache-tomcat-8.5.65.tar.gz
RUN mv apache-tomcat-8.5.65 tomcat8
WORKDIR /opt/tomcat8/webapps
RUN wget https://tmg-123456789.s3.amazonaws.com/target/petclinic.war
RUN echo export JAVA_HOME=/opt/java8 >> /etc/profile
RUN echo export PATH=$PATH:/opt/java8/bin >> /etc/profile
ENV JAVA_HOME "/opt/java8"
ENV PATH "${JAVA_HOME}/bin:${PATH}"
CMD ["/opt/tomcat8/bin/catalina.sh", "run"]
