FROM tomcat:8.0-alpine
MAINTAINER DevOps Team
ADD sample.war /usr/local/tomcat/webapps/l4.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
