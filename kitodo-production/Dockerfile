FROM tomcat:8-jre8-alpine
VOLUME ["/docker-entrypoint-initdb.d"]

ENV KITODO_WEBAPP=kitodo.war \
  KITODO_BASE=/etc/kitodo \
	MYSQL_INIT=/docker-entrypoint-initdb.d

# Kitodo webapp
COPY dist/${KITODO_WEBAPP} ${CATALINA_HOME}/webapps/kitodo.war
RUN mkdir -p ${KITODO_BASE}
COPY dist/resources/* ${KITODO_BASE}/
COPY kitodo-data/* ${MYSQL_INIT}/