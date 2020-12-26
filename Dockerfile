FROM tomcat:8.0-alpine
MAINTAINER DevOps Team
RUN wget -o /usr/local/tomcat/webapps/seetheapplication.war http://10.127.129.114:8040/artifactory/rgtestdocker/com/mkyong/CounterWebApp/1.0-SNAPSHOT/CounterWebApp-1.0-SNAPSHOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
