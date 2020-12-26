FROM tomcat:8.0-alpine
MAINTAINER DevOps Team
RUN curl -sSf -u "admin:Password1234" \
    -O /usr/local/tomcat/webapps/seetheapplication.war http://10.127.129.114:8040/artifactory/rgtestdocker/com/mkyong/CounterWebApp/1.0-SNAPSHOT/CounterWebApp-1.0-SNAPSHOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
