FROM tomcat
MAINTAINER rg
RUN curl -O /usr/local/tomcat/webapps/sampleapp.war http://10.127.129.114:8040/artifactory/rgtestdocker/com/mkyong/CounterWebApp/1.0-SNAPSHOT/CounterWebApp-1.0-SNAPSHOT.war
EXPOSE 8006
CMD /usr/local/tomcat/bin/catalina.sh run
