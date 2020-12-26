FROM tomcat:8.0-alpine
MAINTAINER rg
ADD http://10.127.129.114:8040/artifactory/rgtestdocker/com/mkyong/CounterWebApp/1.0-SNAPSHOT/CounterWebApp-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/sampleapp.war
EXPOSE 8080
CMD [“catalina.sh”, “run”]
