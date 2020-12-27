FROM tomcat:8.0-alpine
MAINTAINER DevOps Team
RUN wget -O /usr/local/tomcat/webapps/see.war http://10.127.129.114:8040/artifactory/sachinmehta.e27/com/nagarro/devops-tools/devops/demosampleapplication/1.0.0-SNAPSHOT/demosampleapplication-1.0.0-SNAPSHOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
