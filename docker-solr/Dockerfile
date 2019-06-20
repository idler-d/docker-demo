FROM solr:6.6

RUN set -x \
    && cp /opt/solr/dist/solr-dataimporthandler-* /opt/solr/server/solr-webapp/webapp/WEB-INF/lib/

COPY lib/mysql-connector-java-5.1.46.jar /opt/solr/server/solr-webapp/webapp/WEB-INF/lib/

COPY core /opt/solr/server/solr/