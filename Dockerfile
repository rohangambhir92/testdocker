FROM tomcat:8.0-alpine
MAINTAINER rg
RUN curl /usr/local/tomcat/webapps/sampleapp.war http://10.127.129.114:8040/artifactory/rgtestdocker/com/mkyong/CounterWebApp/1.0-SNAPSHOT/CounterWebApp-1.0-SNAPSHOT.war 
EXPOSE 8080
CMD [“catalina.sh”, “run”]
