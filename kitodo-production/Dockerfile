FROM tomcat:8-jre8-alpine

ENV KITODO_WEBAPP kitodo.war
ENV KITODO_BASE /etc/kitodo
ENV MYSQL_INIT /docker-entrypoint-initdb.d

# Kitodo webapp
COPY dist/${KITODO_WEBAPP} ${CATALINA_HOME}/webapps/kitodo.war
RUN mkdir -p ${KITODO_BASE}
RUN mkdir -p ${MYSQL_INIT}
COPY dist/resources/* ${KITODO_BASE}/
COPY kitodo-data/* ${MYSQL_INIT}/